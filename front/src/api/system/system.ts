import {
  DeptListItem,
  MenuParams,
  RoleParams,
  RolePageParams,
  MenuListGetResultModel,
  DeptListGetResultModel,
  RolePageListGetResultModel,
  RoleListGetResultModel,
} from './model/systemModel';
import { defHttp } from '/@/utils/http/axios';

enum Api {
  MenuList = '/menu/getList',
  MenuAdd = '/menu/add',
  MenuDel = '/menu/del',
  DeptList = '/dept/getList',
  DeptAdd = '/dept/add',
  DeptDel = '/dept/del',

  AccountList = '/user/getList',
  AccountAdd = '/user/add',
  AccountDel = '/user/del',
  ChangePassword = '/user/changePassword',

  setRoleStatus = '/role/setRoleStatus',
  RolePageList = '/role/getList',
  RoleAdd = '/role/add',
  RoleDel = '/role/del',
  GetAllRoleList = '/role/getListAll',

  DicList = '/Dictionaries/getList',
  getListTree = '/Dictionaries/getListTree',
  DicAdd = '/Dictionaries/add',
  DicDel = '/Dictionaries/del',

  ApiList = '/api/getList',
  ApiAdd = '/api/add',
  ApiDel = '/api/del',

  LogList = '/log/getList',

  NoticeList = '/notice/getList',
  NoticeAdd = '/notice/add',
  NoticeDel = '/notice/del',
}
export const getMenuList = (params?: any) => defHttp.get<any>({ url: Api.MenuList, params });

export const MenuAdd = (params?: any) => defHttp.post<any>({ url: Api.MenuAdd, params });

export const MenuDel = (params?: any) => defHttp.post<any>({ url: Api.MenuDel, params });

export const getDeptList = (params?: any) => defHttp.get<any>({ url: Api.DeptList, params });

export const DeptAdd = (params?: any) => defHttp.post<any[]>({ url: Api.DeptAdd, params });

export const DeptDel = (params?: any) => defHttp.post<any[]>({ url: Api.DeptDel, params });

export const getAccountList = (params: any) => defHttp.get<any>({ url: Api.AccountList, params });

export const ChangePassword = (params?: any) =>
  defHttp.post<any[]>({ url: Api.ChangePassword, params });

export const AccountAdd = (params?: any) => defHttp.post<any[]>({ url: Api.AccountAdd, params });

export const AccountDel = (params?: any) => defHttp.post<any[]>({ url: Api.AccountDel, params });

export const getRoleListByPage = (params?: any) =>
  defHttp.get<any>({ url: Api.RolePageList, params });

export const getAllRoleList = (params?: any) =>
  defHttp.get<any>({ url: Api.GetAllRoleList, params });

export const setRoleStatus = (id: number, status: number) =>
  defHttp.post({ url: Api.setRoleStatus, params: { id, status } });

export const RoleAdd = (params?: any) => defHttp.post<any[]>({ url: Api.RoleAdd, params });

export const RoleDel = (params?: any) => defHttp.post<any[]>({ url: Api.RoleDel, params });

export const DicList = (params: any) => defHttp.get<any>({ url: Api.DicList, params });

export const getListTree = () => defHttp.get<any>({ url: Api.getListTree });

export const DicAdd = (params?: any) => defHttp.post<any[]>({ url: Api.DicAdd, params });

export const DicDel = (params?: any) => defHttp.post<any[]>({ url: Api.DicDel, params });

export const ApiList = (params: any) => defHttp.get<any>({ url: Api.ApiList, params });

export const ApiAdd = (params?: any) => defHttp.post<any[]>({ url: Api.ApiAdd, params });

export const ApiDel = (params?: any) => defHttp.post<any[]>({ url: Api.ApiDel, params });

export const LogList = (params: any) => defHttp.get<any>({ url: Api.LogList, params });

export const NoticeList = (params: any) => defHttp.get<any>({ url: Api.NoticeList, params });

export const NoticeAdd = (params?: any) => defHttp.post<any[]>({ url: Api.NoticeAdd, params });

export const NoticeDel = (params?: any) => defHttp.post<any[]>({ url: Api.NoticeDel, params });
