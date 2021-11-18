import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { h } from 'vue';
import { Tinymce } from '/@/components/Tinymce/index';
import { Tag } from 'ant-design-vue';
export const columns: BasicColumn[] = [
  {
    title: '标题',
    dataIndex: 'title',
    width: 160,
    align: 'left',
  },
  {
    title: '发布人',
    dataIndex: 'create_user',
    width: 50,
    align: 'left',
  },
  {
    title: '发布时间',
    dataIndex: 'create_time',
    width: 90,
    sorter: true,
  },
  {
    title: '消息类型',
    dataIndex: 'notice_type',
    width: 50,
    customRender: ({}) => {
      return h(Tag, {}, () => '通知');
    },
    filters: [
      { text: '通知', value: '10' },
      { text: '消息', value: '20' },
      { text: '待办', value: '30' },
    ],
  },
  {
    title: '来源',
    dataIndex: 'source',
    width: 50,
  },
  {
    title: '接收人',
    dataIndex: 'accepter',
    width: 50,
  },
  {
    title: '阅读次数',
    dataIndex: 'view_times',
    width: 50,
    sorter: true,
  },
  {
    title: '紧急度',
    dataIndex: 'grade',
    width: 50,
    customRender: ({ record }) => {
      const grade = record.grade;
      const enable = ~~grade === 1;
      const color = enable ? 'green' : 'red';
      const text = enable ? '正常' : '紧急';
      return h(Tag, { color: color }, () => text);
    },
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'title',
    label: '消息标题',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'create_time',
    label: '发布时间',
    component: 'RangePicker',
    componentProps: {
      format: 'YYYY-MM-DD HH:mm',
      showTime: "{ format: 'HH:mm' }",
    },
    colProps: { span: 8 },
  },
];

export const formSchema: FormSchema[] = [
  {
    field: 'notice_id',
    label: 'ID',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    field: 'notice_type',
    label: 'notice_type',
    component: 'Input',
    defaultValue: '10',
    show: false,
  },
  {
    field: 'title',
    label: '通知标题',
    component: 'Input',
    required: true,
  },
  {
    field: 'content',
    label: '通知内容',
    component: 'Input',
    required: true,
    rules: [{ required: true }],
    render: ({ model, field }) => {
      return h(Tinymce, {
        value: model[field],
        height: 200,
        toolbar: false,
        onChange: (value: string) => {
          model[field] = value;
        },
      });
    },
  },
  {
    field: 'grade',
    label: '紧急度',
    component: 'RadioButtonGroup',
    defaultValue: '1',
    componentProps: {
      options: [
        { label: '正常', value: '1' },
        { label: '紧急', value: '2' },
      ],
    },
  },
  {
    field: 'accepter',
    label: '接收人',
    component: 'Input',
  },
];
