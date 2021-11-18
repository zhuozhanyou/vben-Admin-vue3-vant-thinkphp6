<template>
  <PageWrapper dense contentFullHeight fixedHeight contentClass="flex">
    <RightTree
      class="w-1/4 xl:w-1/5"
      ref="RightTree"
      @select="handleSelect"
      @edit="handleEdit"
      @del="handleDelete"
    />
    <BasicTable @register="registerTable" class="w-3/4 xl:w-4/5" :searchInfo="searchInfo">
      <template #toolbar>
        <a-button v-if="hasPermission('addDic')" type="primary" @click="handleCreate"
          >新增项目</a-button
        >
      </template>
      <template #action="{ record }">
        <TableAction
          :actions="[
            {
              icon: 'clarity:note-edit-line',
              tooltip: '编辑用户资料',
              onClick: handleEdit.bind(null, record),
              auth: 'editDic',
            },
            {
              icon: 'ant-design:delete-outlined',
              color: 'error',
              tooltip: '删除此账号',
              onClick: handleDelete.bind(null, record),
              auth: 'delDic',
            },
          ]"
        />
      </template>
    </BasicTable>
    <FormModal @register="registerModal" @success="handleSuccess" />
  </PageWrapper>
</template>
<script lang="ts">
  import { defineComponent, reactive, ref } from 'vue';
  import { BasicTable, useTable, TableAction } from '/@/components/Table';
  import { DicList, DicDel } from '/@/api/system/system';
  import { PageWrapper } from '/@/components/Page';
  import RightTree from './RightTree.vue';
  import { useModal } from '/@/components/Modal';
  import FormModal from './Modal.vue';
  import { columns, searchFormSchema } from './schemas.data';
  import { usePermission } from '/@/hooks/web/usePermission';
  import { useMessage } from '/@/hooks/web/useMessage';

  export default defineComponent({
    name: 'Dictionaries',
    components: { BasicTable, PageWrapper, RightTree, FormModal, TableAction },
    setup() {
      const { hasPermission } = usePermission();
      const showAction = hasPermission('editDic') || hasPermission('delDic');
      const [registerModal, { openModal }] = useModal();
      const searchInfo = reactive<Recordable>({});
      const [registerTable, { reload }] = useTable({
        title: '字典项目',
        api: DicList,
        columns,
        formConfig: {
          labelWidth: 120,
          schemas: searchFormSchema,
          autoSubmitOnEnter: true,
        },
        useSearchForm: true,
        showTableSetting: true,
        bordered: true,
        handleSearchInfoFn(info) {
          return info;
        },
        actionColumn: {
          width: 80,
          title: '操作',
          dataIndex: 'action',
          slots: { customRender: 'action' },
          ifShow: showAction,
        },
      });

      function handleCreate() {
        openModal(true, {
          isUpdate: false,
        });
      }

      function handleEdit(record: Recordable) {
        openModal(true, {
          record,
          isUpdate: true,
        });
      }
      const { createConfirm } = useMessage();
      async function handleDelete(record: Recordable) {
        createConfirm({
          content: '确定要删除吗？',
          onOk: () => {
            return DicDel(record.id).then(() => {
              record.type == 20 ? reload() : RightTree.value.fetch();
            });
          },
        });
      }
      const RightTree = ref();
      function handleSuccess(type) {
        if (type == 20) {
          reload();
        } else {
          RightTree.value.fetch();
        }
      }

      function handleSelect(id = '') {
        searchInfo.parent_id = id;
        reload();
      }

      return {
        registerTable,
        registerModal,
        handleCreate,
        handleEdit,
        handleDelete,
        handleSuccess,
        handleSelect,
        searchInfo,
        hasPermission,
        RightTree,
      };
    },
  });
</script>
