<template>
  <BasicModal
    v-bind="$attrs"
    @register="register"
    :title="title"
    :showOkBtn="false"
    @visible-change="handleVisibleChange"
  >
    <p class="h-20">{{ modelRef }}</p>
  </BasicModal>
</template>
<script lang="ts">
  import { defineComponent, ref } from 'vue';
  import { BasicModal, useModalInner } from '/@/components/Modal';

  export default defineComponent({
    components: { BasicModal },
    setup() {
      const title = ref();
      const modelRef = ref();

      const [register] = useModalInner((data) => {
        data && onDataReceive(data);
      });

      function onDataReceive(data) {
        console.log('Data Received', data);
        // 方式1;
        // setFieldsValue({
        //   field2: data.data,
        //   field1: data.info,
        // });

        // // 方式2
        modelRef.value = data.data;
        title.value = data.title;
        // setProps({
        //   model:{ field2: data.data, field1: data.info }
        // })
      }

      return { register, modelRef, title };
    },
  });
</script>
