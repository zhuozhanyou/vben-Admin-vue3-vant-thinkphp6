<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\library\express\Kuaidi100;
use app\common\model\store\Setting as SettingModel;
use app\common\enum\Setting as SettingEnum;

/**
 * 物流公司模型
 * Class Express
 * @package app\common\model
 */
class Express extends BaseModel
{
    // 定义表名
    protected $name = 'express';

    // 定义主键
    protected $pk = 'express_id';

    /**
     * 获取全部记录
     * @param array $param
     * @return \think\Collection
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function getAll($param = [])
    {
        // 检索查询条件
        $filter = $this->getFilter($param);
        // 查询列表数据
        return $this->where($filter)->order(['sort', $this->getPk()])->select();
    }

    /**
     * 获取列表
     * @param array $param
     * @return \think\Paginator
     * @throws \think\db\exception\DbException
     */
    public function getList($param = [])
    {
        // 检索查询调价你
        $filter = $this->getFilter($param);
        // 查询列表数据
        return $this->where($filter)->order(['sort', 'express_id'])->paginate(15);
    }

    /**
     * 检索查询条件
     * @param array $param
     * @return array
     */
    private function getFilter($param = [])
    {
        // 默认查询条件
        $params = $this->setQueryDefaultValue($param, ['search' => '']);
        // 检索查询条件
        $filter = [];
        !empty($params['search']) && $filter[] = ['express_name', 'like', "%{$params['search']}%"];
        return $filter;
    }

    /**
     * 物流公司详情
     * @param int $expressId
     * @return null|static
     */
    public static function detail(int $expressId)
    {
        return self::get($expressId);
    }

    /**
     * 获取物流动态信息
     * @param string $expressName
     * @param string $expressCode
     * @param string $expressNo
     * @return false|string[]
     * @throws \app\common\exception\BaseException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function dynamic(string $expressName, string $expressCode, string $expressNo)
    {
        $data = [
            'express_name' => $expressName,
            'express_no' => $expressNo
        ];
        // 获取快递100配置项
        $config = $this->getKuaidi100Config();
        // 实例化快递100类
        $Kuaidi100 = new Kuaidi100($config);
        // 请求查询接口
        $data['list'] = $Kuaidi100->query($expressCode, $expressNo);
        if ($data['list'] === false) {
            $this->error = $Kuaidi100->getError();
            return false;
        }
        return $data;
    }

    /**
     * 获取快递100配置项
     * @return mixed
     * @throws \app\common\exception\BaseException
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    private function getKuaidi100Config()
    {
        // 实例化快递100类
        $config = SettingModel::getItem(SettingEnum::DELIVERY);
        if (empty($config['kuaidi100']['customer']) || empty($config['kuaidi100']['key'])) {
            throwError('请先到后台-设置-配送方式 补充物流查询API配置');
        }
        return $config['kuaidi100'];
    }

}
