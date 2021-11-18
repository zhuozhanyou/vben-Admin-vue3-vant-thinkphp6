<template>
  <PageWrapper title="修改当前用户密码" content="修改成功后会自动退出当前登录！">
    <div class="flex flex-col items-center justify-center py-8 bg-white">
      <BasicForm @register="register" />
      <div class="flex justify-center">
        <a-button @click="resetFields"> 重置 </a-button>
        <a-button class="!ml-4" type="primary" @click="handleSubmit"> 确认 </a-button>
      </div>
    </div>
  </PageWrapper>
</template>
<script lang="ts">
  import { defineComponent } from 'vue';
  import { PageWrapper } from '/@/components/Page';
  import { BasicForm, useForm } from '/@/components/Form';
  import { ChangePassword } from '/@/api/system/system';
  import { formSchema } from './pwd.data';
  import { useUserStore } from '/@/store/modules/user';

  export default defineComponent({
    name: 'ChangePassword',
    components: { BasicForm, PageWrapper },
    setup() {
      const [register, { validate, resetFields }] = useForm({
        size: 'large',
        labelWidth: 100,
        showActionButtonGroup: false,
        schemas: formSchema,
      });
      const userStore = useUserStore();
      async function handleSubmit() {
        try {
          const values = await validate();
          ChangePassword({ ...values }).then(() => {
            userStore.logout(true);
          });
        } catch (error) {}
      }

      return { register, resetFields, handleSubmit };
    },
  });
</script>
