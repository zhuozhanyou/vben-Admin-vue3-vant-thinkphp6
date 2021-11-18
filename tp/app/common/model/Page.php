<?php

declare (strict_types = 1);

namespace app\common\model;

use app\common\library\helper;
use app\common\enum\page\PageType as PageTypeEnum;

/**
 * 店铺页面模型
 * Class Page
 * @package app\common\model
 */
class Page extends BaseModel
{
    // 定义表名
    protected $name = 'page';

    // 定义主键
    protected $pk = 'page_id';

    /**
     * 获取器：格式化页面数据
     * @param $json
     * @return array
     */
    public function getPageDataAttr(string $json)
    {
        // 数据转义
        $array = helper::jsonDecode($json);
        // 合并默认数据
        return $this->_mergeDefaultData($array);
    }

    /**
     * 修改器：自动转换data为json格式
     * @param array $value
     * @return string
     */
    public function setPageDataAttr(array $value)
    {
        $json = helper::jsonEncode($value ?: ['items' => []]);
        return htmlspecialchars_decode($json);
    }

    /**
     * 页面标题栏默认数据
     * @return array
     */
    public function getDefaultPage()
    {
        return [
            'name' => '页面设置',
            'type' => 'page',
            'params' => [
                'name' => '页面名称',
                'title' => '页面标题',
                'shareTitle' => '分享标题'
            ],
            'style' => [
                'titleTextColor' => 'black',
                'titleBackgroundColor' => '#ffffff',
            ]
        ];
    }

    /**
     * 页面diy元素默认数据
     * @return array
     */
    public function getDefaultItems()
    {
        return [
            'search' => [
                'name' => '搜索框',
                'type' => 'search',
                'params' => ['placeholder' => '请输入关键字进行搜索'],
                'style' => [
                    'textAlign' => 'left',
                    'searchStyle' => 'square'
                ]
            ],
            'banner' => [
                'name' => '图片轮播',
                'type' => 'banner',
                'style' => [
                    'btnColor' => '#ffffff',
                    'btnShape' => 'round',
                    'interval' => 2.5
                ],
                'data' => [
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/banner/01.png',
                        'link' => null
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/banner/01.png',
                        'link' => null
                    ]
                ]
            ],
            'image' => [
                'name' => '图片',
                'type' => 'image',
                'style' => [
                    'paddingTop' => 0,
                    'paddingLeft' => 0,
                    'background' => '#ffffff'
                ],
                'data' => [
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/banner/01.png',
                        'imgName' => 'image-1.jpg',
                        'link' => null
                    ]
                ]
            ],
            'navBar' => [
                'name' => '导航组',
                'type' => 'navBar',
                'style' => ['rowsNum' => 4, 'background' => '#ffffff', 'paddingTop' => 0, 'textColor' => '#666666'],
                'data' => [
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/navbar/01.png',
                        'imgName' => 'icon-1.png',
                        'link' => null,
                        'text' => '按钮文字1'
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/navbar/01.png',
                        'imgName' => 'icon-2.jpg',
                        'link' => null,
                        'text' => '按钮文字2'
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/navbar/01.png',
                        'imgName' => 'icon-3.jpg',
                        'link' => null,
                        'text' => '按钮文字3'
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/navbar/01.png',
                        'imgName' => 'icon-4.jpg',
                        'link' => null,
                        'text' => '按钮文字4'
                    ]
                ]
            ],
            'blank' => [
                'name' => '辅助空白',
                'type' => 'blank',
                'style' => [
                    'height' => 20,
                    'background' => '#ffffff'
                ]
            ],
            'guide' => [
                'name' => '辅助线',
                'type' => 'guide',
                'style' => [
                    'background' => '#ffffff',
                    'lineStyle' => 'solid',
                    'lineHeight' => 1,
                    'lineColor' => "#000000",
                    'paddingTop' => 10
                ]
            ],
            'video' => [
                'name' => '视频组',
                'type' => 'video',
                'params' => [
                    'videoUrl' => 'http://wxsnsdy.tc.qq.com/105/20210/snsdyvideodownload?filekey=30280201010421301f0201690402534804102ca905ce620b1241b726bc41dcff44e00204012882540400.mp4',
                    'poster' => base_url() . 'assets/store/img/diy/video_poster.png',
                    'autoplay' => 0
                ],
                'style' => [
                    'paddingTop' => 0,
                    'height' => 190
                ]
            ],
            'article' => [
                'name' => '文章组',
                'type' => 'article',
                'params' => [
                    'source' => 'auto', //  数据来源 (choice指定  auto自动获取)
                    'auto' => [
                        'category' => -1,   // -1全部
                        'showNum' => 6
                    ]
                ],
//                'style' => [],
                // '自动获取' => 默认数据
                'defaultData' => [
                    [
                        'title' => '此处显示文章标题',
                        'show_type' => 10,
                        'image' => base_url() . 'assets/store/img/diy/article/01.png',
                        'views_num' => 309
                    ],
                    [
                        'title' => '此处显示文章标题',
                        'show_type' => 10,
                        'image' => base_url() . 'assets/store/img/diy/article/01.png',
                        'views_num' => 309
                    ]
                ],
                // '手动选择' => 默认数据
                'data' => []
            ],
            'notice' => [
                'name' => '店铺公告',
                'type' => 'notice',
                'params' => [
                    'text' => '这里是第一条自定义公告的标题', // 公告内容
                    // 'icon' => base_url() . 'assets/store/img/diy/notice.png',
                    'link' => null,     // 链接
                    'showIcon' => true, // 是否显示图标
                    'scrollable' => true    // 是否滚动
                ],
                'style' => [
                    'paddingTop' => 0,
                    'background' => '#fffbe8',
                    'textColor' => '#de8c17'
                ]
            ],
            'richText' => [
                'name' => '富文本',
                'type' => 'richText',
                'params' => [
                    'content' => '<p>这里是文本的内容</p>'
                ],
                'style' => [
                    'paddingTop' => 0,
                    'paddingLeft' => 0,
                    'background' => '#ffffff'
                ]
            ],
            'window' => [
                'name' => '图片橱窗',
                'type' => 'window',
                'style' => [
                    'paddingTop' => 0,
                    'paddingLeft' => 0,
                    'background' => '#ffffff',
                    'layout' => 2   // 布局方式: -1橱窗
                ],
                'data' => [
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/window/01.jpg',
                        'link' => null
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/window/02.jpg',
                        'link' => null
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/window/03.jpg',
                        'link' => null
                    ],
                    [
                        'imgUrl' => base_url() . 'assets/store/img/diy/window/04.jpg',
                        'link' => null
                    ]
                ],
                'dataNum' => 4
            ],
            'goods' => [
                'name' => '商品组',
                'type' => 'goods',
                'params' => [
                    'source' => 'auto',         // 数据来源 (choice手动选择 auto自动获取)
                    'auto' => [
                        'category' => 0,       // 商品分类 0为全部
                        'goodsSort' => 'all',   // 商品排序 (all默认 sales销量 price价格)
                        'showNum' => 6          // 显示数量
                    ]
                ],
                'style' => [
                    'background' => '#F6F6F6',
                    'display' => 'list',        // 显示类型 (list列表平铺 slide横向滑动)
                    'column' => 2,              // 分列数量
                    'show' => [                 // 显示内容
                        'goodsName', 'goodsPrice', 'linePrice', 'sellingPoint', 'goodsSales'
                    ]
                ],
                // '自动获取' => 默认数据
                'defaultData' => [
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                    ],
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                    ],
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                    ],
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                    ]
                ],
                // '手动选择' => 默认数据
                'data' => [
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                        'is_default' => true
                    ],
                    [
                        'goods_name' => '此处显示商品名称',
                        'goods_image' => base_url() . 'assets/store/img/diy/goods/01.png',
                        'goods_price_min' => '99.00',
                        'line_price_min' => '139.00',
                        'selling_point' => '此款商品美观大方 不容错过',
                        'goods_sales' => 100,
                        'is_default' => true
                    ]
                ]
            ],
            'service' => [
                'name' => '在线客服',
                'type' => 'service',
                'params' => [
                    'type' => 'chat',     // '客服类型' => chat在线聊天，phone拨打电话
                    'image' => base_url() . 'assets/store/img/diy/service.png',
                    'tel' => '' // 电话号吗
                ],
                'style' => [
                    'right' => 1,
                    'bottom' => 10,
                    'opacity' => 100
                ]
            ],
        ];
    }

    /**
     * diy页面详情
     * @param int $pageId
     * @return static|null
     */
    public static function detail(int $pageId)
    {
        return static::get(['page_id' => $pageId]);
    }

    /**
     * diy页面详情
     * @return static|null
     */
    public static function getHomePage()
    {
        return static::get(['page_type' => PageTypeEnum::HOME]);
    }

    /**
     * 合并默认数据
     * @param $array
     * @return mixed
     */
    private function _mergeDefaultData($array)
    {
        $array['page'] = array_merge_multiple($this->getDefaultPage(), $array['page']);
        $defaultItems = $this->getDefaultItems();
        foreach ($array['items'] as &$item) {
            if (isset($defaultItems[$item['type']])) {
                array_key_exists('data', $item) && $defaultItems[$item['type']]['data'] = [];
                $item = array_merge_multiple($defaultItems[$item['type']], $item);
            }
        }
        return $array;
    }

}
