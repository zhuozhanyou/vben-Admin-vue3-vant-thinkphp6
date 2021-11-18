<?php

declare (strict_types=1);

namespace app\common\model;

use think\Paginator;
use think\model\Collection;
use app\common\library\helper;
use app\store\model\GoodsCategoryRel as GoodsCategoryRelModel;
use app\common\enum\goods\Status as GoodsStatusEnum;

/**
 * 商品模型
 * Class Goods
 * @package app\common\model
 */
class Goods extends BaseModel
{
    // 定义表名
    protected $name = 'goods';

    // 定义主键
    protected $pk = 'goods_id';

    // 追加字段
    protected $append = ['goods_sales'];

    /**
     * 计算显示销量 (初始销量 + 实际销量)
     * @param $value
     * @param $data
     * @return mixed
     */
    public function getGoodsSalesAttr($value, $data)
    {
        return $data['sales_initial'] + $data['sales_actual'];
    }

    /**
     * 商品详情：HTML实体转换回普通字符
     * @param $value
     * @return string
     */
    public function getContentAttr($value)
    {
        return htmlspecialchars_decode($value);
    }

    /**
     * 获取器：单独设置折扣的配置
     * @param $json
     * @return mixed
     */
    public function getAloneGradeEquityAttr($json)
    {
        return helper::jsonDecode($json);
    }

    /**
     * 修改器：单独设置折扣的配置
     * @param $data
     * @return mixed
     */
    public function setAloneGradeEquityAttr($data)
    {
        return helper::jsonEncode($data);
    }

    /**
     * 关联商品规格表
     * @return \think\model\relation\HasMany
     */
    public function skuList()
    {
        return $this->hasMany('GoodsSku')->order(['id' => 'asc']);
    }

    /**
     * 关联商品规格关系表
     * @return \think\model\relation\HasMany
     */
    public function specRel()
    {
        return $this->hasMany('GoodsSpecRel');
    }

    /**
     * 关联商品图片表
     * @return \think\model\relation\HasMany
     */
    public function images()
    {
        return $this->hasMany('GoodsImage')->order(['id']);
    }

    /**
     * 关联运费模板表
     * @return \think\model\relation\BelongsTo
     */
    public function delivery()
    {
        return $this->BelongsTo('Delivery');
    }

    /**
     * 关联订单评价表
     * @return \think\model\relation\HasMany
     */
    public function commentData()
    {
        return $this->hasMany('Comment');
    }

    /**
     * 获取商品列表
     * @param array $param 查询条件
     * @param int $listRows 分页数量
     * @return mixed
     * @throws \think\db\exception\DbException
     */
    public function getList(array $param = [], int $listRows = 15)
    {
        // 筛选条件
        $query = $this->getQueryFilter($param);
        // 设置显示的销量 goods_sales
        $query->field(['(sales_initial + sales_actual) as goods_sales']);
        // 排序条件
        $sort = $this->setQuerySort($param);
        // 执行查询
        $list = $query->with(['images.file'])
            ->alias($this->name)
            ->field($this->getAliasFields($this->name, ['content']))
            ->where('is_delete', '=', 0)
            ->order($sort)
            ->paginate($listRows);
        // 整理列表数据并返回
        return $this->setGoodsListData($list);
    }

    /**
     * 检索排序条件
     * @param array $param
     * @return array|string[]
     */
    private function setQuerySort(array $param = [])
    {
        $params = $this->setQueryDefaultValue($param, [
            'sortType' => 'all',    // 排序类型
            'sortPrice' => false,   // 价格排序 (true高到低 false低到高)
        ]);
        // 排序规则
        $sort = [];
        if ($params['sortType'] === 'all') {
            $sort = ['sort' => 'asc'];
        } elseif ($params['sortType'] === 'sales') {
            $sort = ['goods_sales' => 'desc'];
        } elseif ($params['sortType'] === 'price') {
            $sort = $params['sortPrice'] ? ['goods_price_max' => 'desc'] : ['goods_price_min' => 'asc'];
        }
        return array_merge($sort, [$this->getPk() => 'desc']);
    }

    /**
     * 检索查询条件
     * @param array $param
     * @return \think\db\BaseQuery
     */
    private function getQueryFilter(array $param)
    {
        // 商品列表获取条件
        $params = $this->setQueryDefaultValue($param, [
            'listType' => 'all',    // 列表模式 (全部:all 出售中:on_sale 已下架:off_sale 已售罄:sold_out)
            'categoryId' => null,    // 分类ID集
            'goodsName' => null,     // 商品名称
            'goodsNo' => null,       // 商品编码
            'status' => 0,         // 商品状态(0全部 10上架 20下架)
        ]);
        // 实例化新查询对象
        $query = $this->getNewQuery();
        // 筛选条件
        $filter = [];
        // 列表模式
        if ($params['listType'] === 'on_sale') {
            $filter[] = ['status', '=', GoodsStatusEnum::ON_SALE];        // 出售中
        } elseif ($params['listType'] === 'off_sale') {
            $filter[] = ['status', '=', GoodsStatusEnum::OFF_SALE];        // 已下架
        } elseif ($params['listType'] === 'sold_out') {
            $filter[] = ['stock_total', '=', 0];    // 已售罄
        }
        // 商品状态
        $params['status'] > 0 && $filter[] = ['status', '=', (int)$params['status']];
        // 商品分类
        if ($params['categoryId'] > 0) {
            // 关联商品与分类关系记录表
            $GoodsCategoryRelName = (new GoodsCategoryRelModel)->getName();
            $query->join($GoodsCategoryRelName, "{$GoodsCategoryRelName}.goods_id = {$this->name}.goods_id");
            // 设置分类ID条件
            $query->where('goods_category_rel.category_id', '=', (int)$params['categoryId']);
        }
        // 商品名称
        !empty($params['goodsName']) && $filter[] = ['goods_name', 'like', "%{$params['goodsName']}%"];
        // 商品编码
        !empty($params['goodsNo']) && $filter[] = ['goods_no', 'like', "%{$params['goodsNo']}%"];
        // 实例化新查询对象
        return $query->where($filter);
    }

    /**
     * 设置商品展示的数据
     * @param Collection|Paginator $list 商品列表
     * @param callable|null $callback 回调函数
     * @return mixed
     */
    protected function setGoodsListData($list, callable $callback = null)
    {
        if ($list->isEmpty()) return $list;
        // 遍历商品列表整理数据
        foreach ($list as &$goods) {
            $goods = $this->setGoodsData($goods, $callback);
        }
        return $list;
    }

    /**
     * 整理商品数据
     * @param Collection|static $goodsInfo
     * @param callable|null $callback
     * @return mixed
     */
    protected function setGoodsData($goodsInfo, callable $callback = null)
    {
        // 商品图片列表
        $goodsInfo['goods_images'] = helper::getArrayColumn($goodsInfo['images'], 'file');
        // 商品主图
        $goodsInfo['goods_image'] = current($goodsInfo['goods_images'])['preview_url'];
        // 商品销量(实际显示=初始虚拟销量+实际销量)
        $goodsInfo['goods_sales'] = $goodsInfo['sales_initial'] + $goodsInfo['sales_actual'];
        // 回调函数
        is_callable($callback) && call_user_func($callback, $goodsInfo);
        return $goodsInfo->hidden(array_merge($this->hidden, ['specRel', 'images']));
    }

    /**
     * 根据商品id集获取商品列表
     * @param array $goodsIds
     * @param null $status
     * @return array|mixed
     */
    public function getListByIds(array $goodsIds, $status = null)
    {
        // 筛选条件
        $filter = [['goods_id', 'in', $goodsIds]];
        // 商品状态
        $status > 0 && $filter[] = ['status', '=', $status];
        // 获取商品列表数据
        $data = $this
            // ->withoutField(['content'])
            ->with(['images.file'])
            ->where($filter)
            ->where('is_delete', '=', 0)
            ->orderRaw('field(goods_id, ' . implode(',', $goodsIds) . ')')
            ->select();
        // 整理列表数据并返回
        return $this->setGoodsListData($data);
    }

    /**
     * 商品多规格信息
     * @param \think\Collection $specRel
     * @param \think\Collection $skuData
     * @return array
     */
    public function getManySpecData($specRel, $skuData)
    {
        // spec_attr
        $specAttrData = [];
        foreach ($specRel as $item) {
            if (!isset($specAttrData[$item['spec_id']])) {
                $specAttrData[$item['spec_id']] = [
                    'group_id' => $item['spec']['spec_id'],
                    'name' => $item['spec']['spec_name'],
                    'spec_items' => [],
                ];
            }
            $specAttrData[$item['spec_id']]['spec_items'][] = [
                'item_id' => $item['spec_value_id'],
                'spec_value' => $item['spec_value'],
            ];
        }
        // spec_list
        $specListData = [];
        foreach ($skuData as $item) {
            $image = (isset($item['images']) && !empty($item['images'])) ? $item['images'] : ['file_id' => 0, 'external_url' => ''];
            $specListData[] = [
                'id' => $item['id'],
                'goods_sku_id' => $item['goods_sku_id'],
                'rows' => [],
                'form' => [
                    'image_id' => $image['file_id'],
                    'image_path' => $image['external_url'],
                    'goods_sku_no' => $item['goods_sku_no'],
                    'goods_price' => $item['goods_price'],
                    'goods_weight' => $item['goods_weight'],
                    'line_price' => $item['line_price'],
                    'stock_num' => $item['stock_num'],
                ],
            ];
        }
        return ['spec_attr' => array_values($specAttrData), 'spec_list' => $specListData];
    }

    /**
     * 获取商品记录
     * @param int $goodsId
     * @param array $with
     * @return static
     */
    public static function detail(int $goodsId, array $with = [])
    {
        return static::get($goodsId, $with);
    }

//    /**
//     * 指定的商品规格信息
//     * @param static $goods 商品详情
//     * @param string $goodsSkuId
//     * @return array|bool
//     */
//    public static function getGoodsSku(self $goods, string $goodsSkuId)
//    {
//        // 获取指定的sku
//        $goodsSku = [];
//        foreach ($goods['skuList'] as $item) {
//            if ($item['goods_sku_id'] == $goodsSkuId) {
//                $goodsSku = $item;
//                break;
//            }
//        }
//        if (empty($goodsSku)) {
//            return false;
//        }
//        // 多规格文字内容
//        $goodsSku['goods_attr'] = '';
//        if ($goods['spec_type'] == 20) {
//            $specRelData = helper::arrayColumn2Key($goods['spec_rel'], 'spec_value_id');
//            $attrs = explode('_', $goodsSku['goods_sku_id']);
//            foreach ($attrs as $specValueId) {
//                $goodsSku['goods_attr'] .= $specRelData[$specValueId]['spec']['spec_name'] . ':'
//                    . $specRelData[$specValueId]['spec_value'] . '; ';
//            }
//        }
//        return $goodsSku;
//    }

}
