import { time } from 'console';
import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';

export const columns: BasicColumn[] = [
  {
    title: '操作用户',
    dataIndex: 'user_name',
    width: 100,
  },
  {
    title: '操作功能',
    dataIndex: 'api_name',
    width: 200,
    align: 'left',
  },
  {
    title: '访问路径',
    dataIndex: 'url',
    width: 200,
    align: 'left',
  },
  {
    title: '操作时间',
    dataIndex: 'create_time',
    width: 180,
    sorter: true,
  },
  {
    title: 'IP',
    dataIndex: 'ip',
    width: 100,
  },
  {
    title: '参数',
    dataIndex: 'params',
    width: 100,
    slots: { customRender: 'params' },
  },
  {
    title: 'SQL',
    dataIndex: 'run_sql',
    width: 100,
    slots: { customRender: 'showSql' },
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'user_name',
    label: '操作用户',
    component: 'Input',
    colProps: { span: 6 },
  },
  {
    field: 'api',
    label: '访问路径',
    component: 'Input',
    colProps: { span: 6 },
  },
  {
    field: 'op_time',
    component: 'RangePicker',
    label: '操作时间',
    componentProps: {
      format: 'YYYY-MM-DD HH:mm',
      showTime: "{ format: 'HH:mm' }",
    },
    colProps: {
      span: 6,
    },
  },
];
