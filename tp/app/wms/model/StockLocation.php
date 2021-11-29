<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class StockLocation extends BaseModel
{
    public function stock()
    {
        return $this->hasOne(Stock::class,'id','stock_id');
    }
    public function goods()
    {
        return $this->hasOne(Goods::class,'goodsSn','goodsSn');
    }
    private function setWhere(array $param)
    {
        $query = $this->db();
        !empty($param['fnumber']) &&  $query->where('fnumber', 'like', "%{$param['fnumber']}%");
        !empty($param['stock_id']) && $query->where('stock_id', '=', $param['stock_id']);
        !empty($param['goodsName']) && $query->hasWhere("goods",function($query) use($param){ $query->where("goodsName", "like", "%{$param['goodsName']}%");});
        return $query;
    }
    public function getList(array $param)
    {
        $query = $this->setWhere($param);
        $cate = getDic('stockCate');
        $list =  $query->with(['stock','goods'])->order($this->listOrder($param))
                ->select()->each(function($item,$key) use($cate){
                    $item['goods_cate'] = isset($cate[$item['goods_cate']])?$cate[$item['goods_cate']]:'';
                    return $item;
                })->toArray();
        return $list;
    }
    public function add(array $data)
    {
        $id = $data['id'];
        unset($data['id']);
        $where = [];
        $where[] = ['fnumber','=',$data['fnumber']];
        !empty($id) && $where[] = ['id','<>',$id];
        $isExists = $this->where($where)->count();
        if ($isExists>0) {
            $this->error = '储位编码已存在';
            return false;
        }
        if(!empty($id))
        {
             return $this->find($id)->save($data);
        }
        else
        {
            return $this->save($data);
        }
    }
}
