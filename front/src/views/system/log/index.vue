<template>
  <div>
    <BasicTable @register="registerTable">
      <template #params="{ record }">
        <a-button type="link" @click="showParam(record)"> 查看 </a-button>
      </template>
      <template #showSql="{ record }">
        <a-button type="link" @click="showSql(record)"> 查看 </a-button>
      </template>
    </BasicTable>
    <Modal @register="register" />
  </div>
</template>
<script lang="ts">
  import { defineComponent } from 'vue';
  import { BasicTable, useTable } from '/@/components/Table';
  import { LogList } from '/@/api/system/system';
  import { columns, searchFormSchema } from './schema.data';
  import { usePermission } from '/@/hooks/web/usePermission';
  import { useModal } from '/@/components/Modal';
  import Modal from './Modal.vue';

  export default defineComponent({
    name: 'RoleManagement',
    components: { BasicTable, Modal },
    setup() {
      const { hasPermission } = usePermission();
      const [registerTable] = useTable({
        title: '系统操作日志',
        api: LogList,
        columns,
        formConfig: {
          labelWidth: 120,
          schemas: searchFormSchema,
        },
        useSearchForm: true,
        showTableSetting: true,
        bordered: true,
        showIndexColumn: false,
      });
      const [register, { openModal }] = useModal();
      function showParam(record: any) {
        openModal(true, { data: record.params, title: '查看参数' });
      }
      function showSql(record: any) {
        openModal(true, { data: record.run_sql, title: '查看sql' });
      }
      return {
        registerTable,
        hasPermission,
        register,
        showParam,
        showSql,
      };
    },
  });
</script>
