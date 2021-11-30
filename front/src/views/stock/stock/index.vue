<template>
  <div>
    <BasicTable @register="registerTable" @fetch-success="onFetchSuccess">
      <template #toolbar>
        <a-button v-if="hasPermission('addDept')" type="primary" @click="handleCreate"> 新增 </a-button>
      </template>
      <template #action="{ record }">
        <TableAction
          :actions="[
            {
              icon: 'clarity:note-edit-line',
              onClick: handleEdit.bind(null, record),
              auth: 'editDept',
            },
            {
              icon: 'ant-design:delete-outlined',
              color: 'error',
              popConfirm: {
                title: '是否确认删除',
                confirm: handleDelete.bind(null, record),
              },
              auth: 'delDept',
            },
          ]"
        />
      </template>
    </BasicTable>
    <Modal @register="registerModal" @success="handleSuccess" />
  </div>
</template>
<script lang="ts">
  import { defineComponent, nextTick } from 'vue';

  import { BasicTable, useTable, TableAction } from '/@/components/Table';
  import { StockList, StockDel } from '/@/api/stock/stock';

  import { useModal } from '/@/components/Modal';
  import Modal from './Modal.vue';

  import { columns, searchFormSchema } from './schema.data';
  import { usePermission } from '/@/hooks/web/usePermission';

  export default defineComponent({
    name: 'DeptManagement',
    components: { BasicTable, Modal, TableAction },
    setup() {
      const { hasPermission } = usePermission();
      const showAction = hasPermission('editDept') || hasPermission('delDept');
      const [registerModal, { openModal }] = useModal();
      const [registerTable, { reload, expandAll }] = useTable({
        title: '仓库列表',
        api: StockList,
        columns,
        formConfig: {
          labelWidth: 120,
          schemas: searchFormSchema,
        },
        isTreeTable: true,
        pagination: false,
        striped: false,
        useSearchForm: true,
        showTableSetting: true,
        bordered: true,
        showIndexColumn: false,
        canResize: false,
        actionColumn: {
          width: 80,
          title: '操作',
          dataIndex: 'action',
          slots: { customRender: 'action' },
          fixed: undefined,
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
        StockDel(record.id).then(() => {
          reload();
        });
      }

      function handleSuccess() {
        reload();
      }
      function onFetchSuccess() {
        nextTick(expandAll);
      }
      return {
        registerTable,
        registerModal,
        handleCreate,
        handleEdit,
        handleDelete,
        handleSuccess,
        hasPermission,
        onFetchSuccess,
      };
    },
  });
</script>
