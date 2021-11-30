import { StockList } from '/@/api/stock/stock';
import { DicItem } from '/@/api/system/system';
import { BasicColumn } from '/@/components/Table';
import { FormSchema } from '/@/components/Table';
import { h } from 'vue';

export const columns: BasicColumn[] = [
  {
    title: '仓库',
    dataIndex: 'stock.fname',
    width: 150,
    sorter: true,
  },
  {
    title: '储位编码',
    dataIndex: 'fnumber',
    width: 100,
    sorter: true,
  },
  {
    title: '存放品类',
    dataIndex: 'goods_cate',
    width: 120,
  },
  {
    title: '当前商品',
    dataIndex: 'goods.goodsName',
    width: 200,
    sorter: true,
  },
  {
    title: '商品批号',
    dataIndex: 'flot',
    width: 100,
  },
  {
    title: '商品数量',
    dataIndex: 'goods_num',
    width: 100,
    sorter: true,
  },
  {
    title: '序号',
    dataIndex: 'sort',
    width: 100,
    sorter: true,
  },
];

export const searchFormSchema: FormSchema[] = [
  {
    field: 'fnumber',
    label: '储位编码',
    component: 'Input',
    colProps: { span: 8 },
  },
  {
    field: 'goodsName',
    label: '商品名称',
    component: 'Input',
    colProps: { span: 8 },
  },
];

export const accountFormSchema: FormSchema[] = [
  {
    field: 'id',
    label: 'id',
    component: 'Input',
    defaultValue: 0,
    show: false,
  },
  {
    label: '所在仓库',
    field: 'stock_id',
    component: 'ApiSelect',
    componentProps: {
      api: StockList,
      labelField: 'fname',
      valueField: 'id',
    },
    required: true,
  },
  {
    field: 'fnumber',
    label: '储位编码',
    component: 'Input',
    required: true,
  },

  {
    label: '存放品类',
    field: 'goods_cate',
    component: 'ApiSelect',
    componentProps: {
      api: DicItem,
      params: { item: 'stockCate' },
      labelField: 'name',
      valueField: 'id',
    },
    required: true,
  },
  {
    label: '序号',
    field: 'sort',
    defaultValue: 100,
    component: 'Input',
  },
];
