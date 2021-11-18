<template>
  <div class="m-4 mr-0 overflow-hidden bg-white">
    <BasicTree
      title="字典分类"
      toolbar
      search
      :clickRowToExpand="false"
      :treeData="treeData"
      :replaceFields="{ key: 'id', title: 'name' }"
      ref="treeRef"
      @select="handleSelect"
      :actionList="actionList"
    />
  </div>
</template>
<script lang="ts">
  import { defineComponent, onMounted, ref, nextTick, unref, h } from 'vue';

  import { BasicTree, TreeItem, TreeActionType, ActionItem } from '/@/components/Tree/index';
  import { getListTree } from '/@/api/system/system';
  import { EditOutlined, DeleteOutlined } from '@ant-design/icons-vue';
  import { usePermission } from '/@/hooks/web/usePermission';

  export default defineComponent({
    name: 'DicTree',
    components: { BasicTree },

    emits: ['select', 'edit', 'del'],
    setup(_, { emit }) {
      const treeData = ref<TreeItem[]>([]);
      const treeRef = ref<Nullable<TreeActionType>>(null);
      const { hasPermission } = usePermission();
      async function fetch() {
        treeData.value = (await getListTree()) as unknown as TreeItem[];
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
      const actionList: ActionItem[] = [
        {
          render: (node) => {
            return (
              hasPermission('editDic') &&
              h(EditOutlined, {
                onClick: (event) => {
                  emit('edit', node);
                  event.stopPropagation();
                },
              })
            );
          },
        },
        {
          render: (node) => {
            return (
              hasPermission('delDic') &&
              h(DeleteOutlined, {
                onClick: (event) => {
                  emit('del', node);
                  event.stopPropagation();
                },
              })
            );
          },
        },
      ];
      return { treeData, handleSelect, treeRef, actionList, fetch };
    },
  });
</script>
