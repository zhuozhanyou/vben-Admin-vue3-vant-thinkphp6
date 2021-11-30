import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { h } from 'vue';
import { Tag } from 'ant-design-vue';

export const columns: BasicColumn[] = [
  {
    title: '编码',
    dataIndex: 'fnumber',
    width: 160,
    align: 'left',
  },
  {
    title: '名称',
    dataIndex: 'fname',
    width: 160,
    align: 'left',
  },
  {
    title: '排序',
    dataIndex: 'sort',
    width: 50,
    sorter: true,
  },
  {
    title: '是否零散库',
    dataIndex: 'is_scattered',
    width: 80,
    customRender: ({ record }) => {
      const status = record.is_scattered;
      const enable = ~~status === 1;
      const color = enable ? 'green' : 'red';
      const text = enable ? '是' : '否';
      return h(Tag, { color: color }, () => text);
    },
  },
  {
    title: '创建时间',
    dataIndex: 'create_time',
    width: 180,
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'fname',
    label: '仓库名称',
    component: 'Input',
    colProps: { span: 8 },
  },
];

export const formSchema: FormSchema[] = [
  {
    field: 'id',
    label: 'ID',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    field: 'fname',
    label: '仓库名称',
    component: 'Input',
    required: true,
  },
  {
    field: 'fnumber',
    label: '仓库编码',
    component: 'Input',
    required: true,
  },
  {
    field: 'sort',
    label: '排序',
    component: 'InputNumber',
    defaultValue: 100,
    required: true,
  },
  {
    field: 'is_scattered',
    label: '是否零散库',
    component: 'RadioButtonGroup',
    defaultValue: -1,
    componentProps: {
      options: [
        { label: '是', value: 1 },
        { label: '否', value: -1 },
      ],
    },
    required: true,
  },
];
