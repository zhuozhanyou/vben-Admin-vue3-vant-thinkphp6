import { BasicColumn, FormSchema } from '/@/components/Table';

export const columns: BasicColumn[] = [
  {
    title: '项目名称',
    dataIndex: 'name',
    width: 120,
    align: 'left',
  },
  {
    title: '项目编码',
    dataIndex: 'code',
    width: 120,
    align: 'left',
  },
  {
    title: '简拼',
    dataIndex: 'spell',
    width: 120,
  },
  {
    title: '序号',
    dataIndex: 'sort',
    width: 120,
  },
  {
    title: '创建时间',
    dataIndex: 'create_time',
    width: 180,
  },
  {
    title: '备注',
    dataIndex: 'remark',
    align: 'left',
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'name',
    label: '项目名称',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'code',
    label: '项目编码',
    component: 'Input',
    colProps: { span: 8 },
  },
];

export const formSchema: FormSchema[] = [
  {
    field: 'id',
    label: 'id',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    field: 'type',
    label: '项目类型',
    component: 'RadioButtonGroup',
    defaultValue: '10',
    componentProps: {
      options: [
        { label: '分类', value: '10' },
        { label: '项目', value: '20' },
      ],
    },
    colProps: { lg: 24, md: 24 },
  },
  {
    label: '上级分类',
    field: 'parent_id',
    component: 'TreeSelect',
    defaultValue: 0,
    componentProps: {
      replaceFields: {
        title: 'name',
        key: 'id',
        value: 'id',
      },
      defaultExpandAll: '1',
      getPopupContainer: () => document.body,
    },
    required: true,
  },
  {
    field: 'name',
    label: '项目名称',
    component: 'Input',
    required: true,
  },
  {
    field: 'code',
    label: '项目编码',
    component: 'Input',
    required: true,
  },
  {
    field: 'spell',
    label: '项目简拼',
    component: 'Input',
  },

  {
    label: '项目序号',
    field: 'sort',
    component: 'Input',
    defaultValue: 100,
  },
  {
    label: '备注',
    field: 'remark',
    component: 'InputTextArea',
  },
];
