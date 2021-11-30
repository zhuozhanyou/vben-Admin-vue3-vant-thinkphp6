<template>
  <PageWrapper dense contentFullHeight fixedHeight contentClass="flex">
    <LeftTree class="w-1/4 xl:w-1/5" @select="handleSelect" />
    <BasicTable @register="registerTable" class="w-3/4 xl:w-4/5" :searchInfo="searchInfo">
      <template #toolbar>
        <a-button v-if="hasPermission('addUser')" type="primary" @click="handleCreate">新增</a-button>
      </template>
      <template #action="{ record }">
        <TableAction
          :actions="[
            {
              icon: 'clarity:note-edit-line',
              tooltip: '编辑',
              onClick: handleEdit.bind(null, record),
              auth: 'editUser',
            },
            {
              icon: 'ant-design:delete-outlined',
              color: 'error',
              tooltip: '删除此',
              popConfirm: {
                title: '是否确认删除',
                confirm: handleDelete.bind(null, record),
              },
              auth: 'delUser',
            },
          ]"
        />
      </template>
    </BasicTable>
    <Modal @register="registerModal" @success="handleSuccess" />
  </PageWrapper>
</template>
<script lang="ts">
  import { defineComponent, reactive } from 'vue';
  import { BasicTable, useTable, TableAction } from '/@/components/Table';
  import { LocationList, LocationDel } from '/@/api/stock/stock';
  import { PageWrapper } from '/@/components/Page';
  import LeftTree from './LeftTree.vue';
  import { useModal } from '/@/components/Modal';
  import Modal from './Modal.vue';
  import { columns, searchFormSchema } from './schema.data';
  import { usePermission } from '/@/hooks/web/usePermission';

  export default defineComponent({
    name: 'AccountManagement',
    components: { BasicTable, PageWrapper, LeftTree, Modal, TableAction },
    setup() {
      const { hasPermission } = usePermission();
      const showAction = hasPermission('editUser') || hasPermission('delUser');
      const [registerModal, { openModal }] = useModal();
      const searchInfo = reactive<Recordable>({});
      const [registerTable, { reload }] = useTable({
        title: '储位列表',
        api: LocationList,
        columns,
        formConfig: {
          labelWidth: 120,
          schemas: searchFormSchema,
          autoSubmitOnEnter: true,
        },
        useSearchForm: true,
        showTableSetting: true,
        bordered: true,
        showIndexColumn: false,
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

      function handleDelete(record: Recordable) {
        LocationDel(record.id).then(() => {
          reload();
        });
      }

      function handleSuccess() {
        reload();
      }

      function handleSelect(id = '') {
        searchInfo.stock_id = id;
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
      };
    },
  });
</script>
