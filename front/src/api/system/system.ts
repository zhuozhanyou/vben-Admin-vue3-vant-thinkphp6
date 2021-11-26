import { defHttp } from '/@/utils/http/axios';

enum Api {
  MenuList = '/system.menu/getList',
  MenuAdd = '/system.menu/add',
  MenuDel = '/system.menu/del',
  DeptList = '/system.dept/getList',
  DeptAdd = '/system.dept/add',
  DeptDel = '/system.dept/del',

  AccountList = '/system.user/getList',
  AccountAdd = '/system.user/add',
  AccountDel = '/system.user/del',
  ChangePassword = '/system.user/changePassword',

  setRoleStatus = '/system.role/setRoleStatus',
  RolePageList = '/system.role/getList',
  RoleAdd = '/system.role/add',
  RoleDel = '/system.role/del',
  GetAllRoleList = '/system.role/getListAll',

  DicList = '/system.Dictionaries/getList',
  getListTree = '/system.Dictionaries/getListTree',
  DicAdd = '/system.Dictionaries/add',
  DicDel = '/system.Dictionaries/del',
  DicItem = '/system.Dictionaries/getDic',

  ApiList = '/system.api/getList',
  ApiAdd = '/system.api/add',
  ApiDel = '/system.api/del',

  LogList = '/system.log/getList',

  NoticeList = '/system.notice/getList',
  NoticeAdd = '/system.notice/add',
  NoticeDel = '/system.notice/del',
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

export const DicItem = (params?: any) => defHttp.post<any[]>({ url: Api.DicItem, params });

export const ApiList = (params: any) => defHttp.get<any>({ url: Api.ApiList, params });

export const ApiAdd = (params?: any) => defHttp.post<any[]>({ url: Api.ApiAdd, params });

export const ApiDel = (params?: any) => defHttp.post<any[]>({ url: Api.ApiDel, params });

export const LogList = (params: any) => defHttp.get<any>({ url: Api.LogList, params });

export const NoticeList = (params: any) => defHttp.get<any>({ url: Api.NoticeList, params });

export const NoticeAdd = (params?: any) => defHttp.post<any[]>({ url: Api.NoticeAdd, params });

export const NoticeDel = (params?: any) => defHttp.post<any[]>({ url: Api.NoticeDel, params });
