<?php

declare (strict_types=1);

namespace app\common\model;

use think\Model;
use think\db\Query;

/**
 * 模型基类
 * Class BaseModel
 * @package app\common\model
 */
class BaseModel extends Model
{
    // 当前访问的商城ID
    public static $storeId;

    // 定义表名
    protected $name;

    // 模型别名
    protected $alias = '';

    // 定义全局的查询范围
    protected $globalScope = ['store_id'];

    // 是否允许全局查询store_id
    protected $isGlobalScopeStoreId = true;

    // 错误信息
    protected $error = '';

    /**
     * 模型基类初始化
     */
    public static function init()
    {
        parent::init();
        // 绑定store_id
        self::getStoreId();
    }

    /**
     * 查找单条记录
     * @param $data
     * @param array $with
     * @return array|static|null
     */
    public static function get($data, $with = [])
    {
        try {
            $query = (new static)->with($with);
            return is_array($data) ? $query->where($data)->find() : $query->find((int)$data);
        } catch (\Exception $e) {
            return false;
        }
    }

    /**
     * 定义全局的查询范围
     * @param Query $query
     * @return bool
     */
    public function scopeStore_id(Query $query)
    {
        if (!$this->isGlobalScopeStoreId) return false;
        $storeId = self::getStoreId();
        $storeId > 0 && $query->where($query->getTable() . '.store_id', $storeId);
        return true;
    }

    /**
     * 获取当前操作的商城ID
     * @return int|null
     */
    private static function getStoreId()
    {
        if (empty(self::$storeId) && in_array(app_name(), ['store', 'api','wms'])) {
            self::$storeId = getStoreId();
        }
        return self::$storeId;
    }

    /**
     * 获取当前调用来源的应用名称
     * 例如：admin, api, store, task
     * @return string|bool
     */
    protected static function getCalledModule()
    {
        if (preg_match('/app\\\(\w+)/', get_called_class(), $class)) {
            return $class[1];
        }
        return 'common';
    }

    /**
     * 设置默认的检索数据
     * @param array $query
     * @param array $default
     * @return array
     */
    protected function setQueryDefaultValue(array $query, array $default = [])
    {
        $data = array_merge($default, $query);
        foreach ($query as $field => $value) {
            // 不存在默认值跳出循环
            if (!isset($default[$field])) continue;
            // 如果传参为空, 设置默认值
            if (empty($value) && $value !== '0') {
                $data[$field] = $default[$field];
            }
        }
        return $data;
    }

    /**
     * 设置基础查询条件（用于简化基础alias和field）
     * @test 2019-4-25
     * @param string $alias
     * @param array $join
     * @return BaseModel
     */
    public function setBaseQuery($alias = '', $join = [])
    {
        // 设置别名
        $aliasValue = $alias ?: $this->alias;
        $query = $this->alias($aliasValue)->field("{$aliasValue}.*");
        // join条件
        if (!empty($join)) : foreach ($join as $item):
            $query->join($item[0], "{$item[0]}.{$item[1]}={$aliasValue}."
                . (isset($item[2]) ? $item[2] : $item[1]));
        endforeach; endif;
        return $query;
    }

    /**
     * 更新数据
     * 重写\think\Model::update方法, 目的可以返回更新的状态bool
     * @access public
     * @param array $data 数据数组
     * @param array $where 更新条件
     * @param array $allowField 允许字段
     * @return bool
     */
    public static function updateBase(array $data, array $where = [], array $allowField = []): bool
    {
        $model = new static;
        if (!empty($allowField)) {
            $model->allowField($allowField);
        }
        if (!empty($where)) {
            $model->setUpdateWhere($where);
        }
        return $model->exists(true)->save($data);
    }

    /**
     * 批量更新数据(支持带where条件)
     * @param iterable $dataSet [0 => ['data'=>[], 'where'=>[]]]
     * @return array|false
     */
    public function updateAll(iterable $dataSet)
    {
        if (empty($dataSet)) {
            return false;
        }
        return $this->transaction(function () use ($dataSet) {
            $result = [];
            foreach ($dataSet as $key => $item) {
                $result[$key] = self::updateBase($item['data'], $item['where']);
            }
            return $result;
        });
    }

    /**
     * 批量新增数据
     * @param iterable $dataSet [0 => ['id'=>10001, 'name'=>'wang']]
     * @return array|false
     */
    public function addAll(iterable $dataSet)
    {
        if (empty($dataSet)) {
            return false;
        }
        return $this->transaction(function () use ($dataSet) {
            $result = [];
            foreach ($dataSet as $key => $item) {
                $result[$key] = self::create($item, $this->field);
            }
            return $result;
        });
    }

    /**
     * 删除记录
     * @param array $where
     *  方式1: ['goods_id' => $goodsId]
     *  方式2: [
     *           ['store_user_id', '=', $storeUserId],
     *           ['role_id', 'in', $deleteRoleIds]
     *        ]
     * @return int
     */
    public static function deleteAll(array $where)
    {
        return (new static)->where($where)->delete();
    }

    /**
     * 返回错误信息
     * @return string
     */
    public function getError()
    {
        return empty($this->error) ? false : $this->error;
    }

    /**
     * 字段值增长
     * @param array|int|bool $where
     * @param string $field
     * @param float $step
     * @return mixed
     */
    protected function setInc($where, string $field, float $step = 1)
    {
        if (is_numeric($where)) {
            $where = [$this->getPk() => (int)$where];
        }
        return $this->where($where)->inc($field, $step)->update();
    }

    /**
     * 字段值消减
     * @param array|int|bool $where
     * @param string $field
     * @param float $step
     * @return mixed
     */
    protected function setDec($where, string $field, float $step = 1)
    {
        return $this->where($where)->dec($field, $step)->update();
    }

    /**
     * 实例化新查询对象
     * @return \think\db\BaseQuery
     */
    protected function getNewQuery()
    {
        return $this->db();
    }

    /**
     * 新增hidden属性
     * @param array $hidden
     * @return $this
     */
    protected function addHidden(array $hidden)
    {
        $this->hidden = array_merge($this->hidden, $hidden);
        return $this;
    }

    /**
     * 生成字段列表(字段加上$alias别名)
     * @param string $alias 别名
     * @param array $withoutFields 排除的字段
     * @return array
     */
    protected function getAliasFields(string $alias, $withoutFields = [])
    {
        $fields = array_diff($this->getTableFields(), $withoutFields);
        foreach ($fields as &$field) {
            $field = "$alias.$field";
        }
        return $fields;
    }

}
