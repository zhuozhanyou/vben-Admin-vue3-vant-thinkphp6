import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { h } from 'vue';
import { Tag } from 'ant-design-vue';
import { Icon } from '/@/components/Icon';

export const columns: BasicColumn[] = [
  {
    title: '菜单名称',
    dataIndex: 'title',
    width: 200,
    align: 'left',
  },
  {
    title: '图标',
    dataIndex: 'icon',
    width: 50,
    customRender: ({ record }) => {
      return h(Icon, { icon: record.icon });
    },
  },
  {
    title: '权限标识',
    dataIndex: 'name',
    width: 180,
    align: 'left',
  },
  {
    title: '路由',
    dataIndex: 'path',
    width: 180,
    align: 'left',
  },
  {
    title: '组件',
    dataIndex: 'component',
    align: 'left',
  },
  {
    title: '排序',
    dataIndex: 'orderNo',
    width: 50,
  },
  {
    title: '状态',
    dataIndex: 'status',
    width: 80,
    customRender: ({ record }) => {
      const status = record.status;
      const enable = ~~status === 1;
      const color = enable ? 'green' : 'red';
      const text = enable ? '启用' : '停用';
      return h(Tag, { color: color }, () => text);
    },
  },
  {
    title: '创建时间',
    dataIndex: 'create_time',
    width: 180,
  },
];

const isDir = (type: string) => type === '10';
const isMenu = (type: string) => type === '20';
const isButton = (type: string) => type === '30';

export const searchFormSchema: FormSchema[] = [
  {
    field: 'title',
    label: '菜单名称',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'status',
    label: '状态',
    component: 'Select',
    componentProps: {
      options: [
        { label: '启用', value: 1 },
        { label: '停用', value: -1 },
      ],
    },
    colProps: { span: 8 },
  },
];

export const formSchema: FormSchema[] = [
  {
    field: 'menu_type',
    label: '菜单类型',
    component: 'RadioButtonGroup',
    defaultValue: '10',
    componentProps: {
      options: [
        { label: '目录', value: '10' },
        { label: '菜单', value: '20' },
        { label: '按钮', value: '30' },
      ],
    },
    colProps: { lg: 24, md: 24 },
  },
  {
    field: 'menu_id',
    label: 'ID',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    field: 'title',
    label: '菜单名称',
    component: 'Input',
    required: true,
  },
  {
    field: 'parent_id',
    label: '上级菜单',
    component: 'TreeSelect',
    defaultValue: 0,
    componentProps: {
      replaceFields: {
        title: 'title',
        key: 'menu_id',
        value: 'menu_id',
      },
      getPopupContainer: () => document.body,
    },
  },
  {
    field: 'name',
    label: '权限标识',
    required: true,
    component: 'Input',
  },
  {
    field: 'path',
    label: '路由地址',
    component: 'Input',
    required: true,
    ifShow: ({ values }) => !isButton(values.menu_type),
  },
  {
    field: 'component',
    label: '组件路径',
    required: true,
    component: 'Input',
    ifShow: ({ values }) => !isButton(values.menu_type),
  },
  {
    field: 'orderNo',
    label: '排序',
    component: 'InputNumber',
    defaultValue: 100,
    required: true,
  },
  {
    field: 'icon',
    label: '图标',
    component: 'IconPicker',
    ifShow: ({ values }) => !isButton(values.menu_type),
  },
  {
    field: 'status',
    label: '状态',
    component: 'RadioButtonGroup',
    defaultValue: 1,
    componentProps: {
      options: [
        { label: '启用', value: 1 },
        { label: '禁用', value: -1 },
      ],
    },
  },
  {
    field: 'frameSrc',
    label: '是否外链',
    component: 'RadioButtonGroup',
    defaultValue: -1,
    componentProps: {
      options: [
        { label: '否', value: -1 },
        { label: '是', value: 1 },
      ],
    },
    ifShow: ({ values }) => isMenu(values.menu_type),
  },

  {
    field: 'ignoreKeepAlive',
    label: '忽略缓存',
    component: 'RadioButtonGroup',
    defaultValue: 1,
    componentProps: {
      options: [
        { label: '否', value: -1 },
        { label: '是', value: 1 },
      ],
    },
    ifShow: ({ values }) => isMenu(values.menu_type),
  },

  {
    field: 'hideChildrenInMenu',
    label: '隐藏子菜单',
    component: 'RadioButtonGroup',
    defaultValue: -1,
    componentProps: {
      options: [
        { label: '是', value: 1 },
        { label: '否', value: -1 },
      ],
    },
    ifShow: ({ values }) => isDir(values.menu_type),
  },
  {
    label: 'API权限',
    field: 'accessApi',
    slot: 'access',
    component: 'Input',
    colProps: { lg: 24, md: 24 },
    show: ({ values }) => !isDir(values.menu_type),
  },
];
