<template>
  <div class="m-4 mr-0 overflow-hidden bg-white">
    <BasicTree
      title="仓库列表"
      toolbar
      search
      defaultExpandAll
      :clickRowToExpand="false"
      :treeData="treeData"
      :replaceFields="{ key: 'id', title: 'fname' }"
      ref="treeRef"
      @select="handleSelect"
    />
  </div>
</template>
<script lang="ts">
  import { defineComponent, onMounted, ref, nextTick, unref } from 'vue';

  import { BasicTree, TreeItem, TreeActionType } from '/@/components/Tree';
  import { StockList } from '/@/api/stock/stock';

  export default defineComponent({
    name: 'DeptTree',
    components: { BasicTree },

    emits: ['select'],
    setup(_, { emit }) {
      const treeData = ref<TreeItem[]>([]);
      const treeRef = ref<Nullable<TreeActionType>>(null);

      async function fetch() {
        treeData.value = (await StockList()) as unknown as TreeItem[];
        nextTick(() => {
          unref(treeRef)?.expandAll(true);
        });
      }

      function handleSelect(keys) {
        emit('select', keys[0]);
      }

      onMounted(() => {
        fetch();
      });
      return { treeData, handleSelect, treeRef };
    },
  });
</script>
