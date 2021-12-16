<template>
  <div ref="domRef">
    <PageWrapper dense contentFullHeight fixedHeight contentClass="flex">
      <BasicTable @register="registerTable" class="w-2/4 xl:w-2/5" :searchInfo="searchInfo">
        <template #action="{ record }">
          <TableAction
            :actions="[
              {
                icon: 'clarity:note-edit-line',
                tooltip: '编辑用户资料',
                onClick: handleEdit.bind(null, record),
                auth: 'editUser',
              },
              {
                icon: 'ant-design:delete-outlined',
                color: 'error',
                tooltip: '删除此账号',
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
      <div class="w-2/4 xl:w-2/5">2</div>
    </PageWrapper>
  </div>
</template>
<script lang="ts">
  import { Row, Col } from 'ant-design-vue';
  import { defineComponent, onMounted, ref } from 'vue';
  import { useFullscreen } from '@vueuse/core';
  import { PageWrapper } from '/@/components/Page';
  import { BasicTable, useTable, TableAction } from '/@/components/Table';
  import { columns, searchFormSchema } from './schema.data';

  export default defineComponent({
    components: {
      [Row.name]: Row,
      [Col.name]: Col,
      PageWrapper,
      BasicTable,
      TableAction,
    },
    setup() {
      const domRef = ref(null);
      const { toggle: toggleDom } = useFullscreen(domRef);
      const [registerTable, { reload, updateTableDataRecord }] = useTable({
        title: '账号列表',
        api: getAccountList,
        columns,
        rowKey: 'user_id',
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
        },
      });

      onMounted(() => {
        toggleDom();
      });
      return {
        domRef,
        registerTable,
      };
    },
  });
</script>
<style lang="less" scoped>
  #delivery_box :deep(.ant-col) {
    background: #ffffff;
  }
</style>
