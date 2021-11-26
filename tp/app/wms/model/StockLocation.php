<?php

declare (strict_types = 1);

namespace app\wms\model;

use app\wms\model\BaseModel;

class StockLocation extends BaseModel
{
    public function goods()
    {
        return $this->hasOne(Goods::class,'goodsSn','goodsSn');
    }
    private function setWhere(array $param)
    {
        $query = $this->db();
        !empty($params['fnumber']) && $where[] = ['fnumber', 'like', "%{$params['fnumber']}%"];
        !empty($params['stock_id']) && $where[] = ['stock_id', '=', $params['stock_id']];
        !empty($param['goodsName']) && $query->hasWhere("goods",function($query) use($param){ $query->where("goodsName", "like", "%{$param['goodsName']}%");});

        return $query;
    }
    public function getList(array $param)
    {
        $query = $this->setWhere($param);
        return $query->with('goods')->order($this->listOrder($param))->select()->toArray();
    }
    public function add(array $data)
    {
        $id = $data['id'];
        unset($data['id']);
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
