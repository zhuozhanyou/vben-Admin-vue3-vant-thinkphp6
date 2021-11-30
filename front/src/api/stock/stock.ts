import { defHttp } from '/@/utils/http/axios';

enum Api {
  StockList = '/stock.stock/getList',
  StockAdd = '/stock.stock/add',
  StockDel = '/stock.stock/del',

  LocationList = '/stock.location/getList',
  LocationAdd = '/stock.location/add',
  LocationDel = '/stock.location/del',
}

export const StockList = (params?: any) => defHttp.get<any>({ url: Api.StockList, params });

export const StockAdd = (params?: any) => defHttp.post<any[]>({ url: Api.StockAdd, params });

export const StockDel = (params?: any) => defHttp.post<any[]>({ url: Api.StockDel, params });

export const LocationList = (params?: any) => defHttp.get<any>({ url: Api.LocationList, params });

export const LocationAdd = (params?: any) => defHttp.post<any[]>({ url: Api.LocationAdd, params });

export const LocationDel = (params?: any) => defHttp.post<any[]>({ url: Api.LocationDel, params });
