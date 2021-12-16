import { getAllRoleList } from '/@/api/system/system';
import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';

export const columns: BasicColumn[] = [
  {
    title: '用户名',
    dataIndex: 'user_name',
    width: 120,
    align: 'left',
  },
  {
    title: '真实姓名',
    dataIndex: 'real_name',
    width: 120,
    align: 'left',
  },
  {
    title: '手机号',
    dataIndex: 'mobile',
    width: 120,
  },
  {
    title: '创建时间',
    dataIndex: 'create_time',
    width: 180,
  },
  {
    title: '角色',
    dataIndex: 'role_name',
    width: 200,
    align: 'left',
  },
  {
    title: '备注',
    dataIndex: 'remark',
    align: 'left',
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'user_name',
    label: '用户名',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'mobile',
    label: '手机号码',
    component: 'Input',
    colProps: { span: 8 },
  },
];

export const accountFormSchema: FormSchema[] = [
  {
    field: 'user_id',
    label: 'id',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    field: 'user_name',
    label: '用户名',
    component: 'Input',
    required: true,
  },
  {
    field: 'password',
    label: '密码',
    component: 'InputPassword',
    required: true,
  },
  {
    label: '角色',
    field: 'role_id',
    component: 'ApiSelect',
    componentProps: {
      api: getAllRoleList,
      labelField: 'role_name',
      valueField: 'role_id',
      mode: 'multiple',
    },
    required: true,
  },
  {
    field: 'dept_id',
    label: '所属部门',
    component: 'TreeSelect',
    componentProps: {
      replaceFields: {
        title: 'dept_name',
        key: 'dept_id',
        value: 'dept_id',
      },
      getPopupContainer: () => document.body,
    },
    required: true,
  },
  {
    field: 'real_name',
    label: '真实姓名',
    component: 'Input',
    required: true,
  },

  {
    label: '手机号码',
    field: 'mobile',
    component: 'Input',
  },
  {
    field: 'is_super',
    label: '超级管理员',
    component: 'RadioButtonGroup',
    defaultValue: -1,
    componentProps: {
      options: [
        { label: '否', value: -1 },
        { label: '是', value: 1 },
      ],
    },
  },
  {
    label: '备注',
    field: 'remark',
    component: 'InputTextArea',
  },
];
