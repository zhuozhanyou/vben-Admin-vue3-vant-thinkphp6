<template>
  <a-modal
    class="noborder"
    :title="title"
    :width="720"
    :visible="visible"
    :isLoading="isLoading"
    :maskClosable="false"
    @ok="handleSubmit"
    @cancel="handleCancel"
  >
    <a-spin :spinning="isLoading">
      <div class="areas-content clearfix">
        <div class="areas-left fl-l">
          <h2 class="areas-title clearfix">
            <span class="fl-l">地区选择：</span>
            <a
              v-if="Object.keys(unSelected).length > 0"
              class="areas-flip fl-r"
              @click="handleSelectAll"
            >全选</a>
          </h2>
          <div class="areas-list">
            <ul class="areas-list-body">
              <li
                class="areas-item"
                :class="{'show-children': !province.isHideChildren}"
                v-for="(province, pidx) in unSelected"
                :key="pidx"
              >
                <div class="text clearfix" @click="handleActive(province)">
                  <a-icon class="icon" type="right" />
                  <span class="item-title fl-l">{{ province.name }}</span>
                  <a class="item-flip fl-r" @click="handleSelected($event, 'province', province)">选择</a>
                </div>
                <ul v-show="!province.isHideChildren" class="areas-sublist">
                  <li class="areas-item" v-for="(city, cidx) in province.city" :key="cidx">
                    <div class="text clearfix">
                      <span class="item-title fl-l">{{ city.name }}</span>
                      <a class="item-flip fl-r" @click="handleSelected($event, 'city', city)">选择</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
        <div class="areas-right fl-r">
          <h2 class="areas-title">已选择：</h2>
          <div class="areas-list">
            <ul class="areas-list-body">
              <li
                class="areas-item"
                :class="{'show-children': !province.isHideChildren}"
                v-for="(province, pidx) in selected"
                :key="pidx"
              >
                <div class="text clearfix" @click="handleActive(province)">
                  <a-icon class="icon" type="right" />
                  <span class="item-title fl-l">{{ province.name }}</span>
                  <a
                    class="item-flip fl-r"
                    @click="handleUnSelected($event, 'province', province)"
                  >删除</a>
                </div>
                <ul v-show="!province.isHideChildren" class="areas-sublist">
                  <li class="areas-item" v-for="(city, cidx) in province.city" :key="cidx">
                    <div class="text clearfix">
                      <span class="item-title fl-l">{{ city.name }}</span>
                      <a class="item-flip fl-r" @click="handleUnSelected($event, 'city', city)">删除</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </a-spin>
  </a-modal>
</template>

<script>
import _ from 'lodash'
import RegionModel from '@/common/model/Region'
import { inArray } from '@/utils/util'

export default {
  name: 'AreasModal',
  data () {
    return {
      // 对话框标题
      title: '选择地区',
      // 标签布局属性
      labelCol: { span: 7 },
      // 输入框布局属性
      wrapperCol: { span: 13 },
      // modal(对话框)是否可见
      visible: false,
      // modal(对话框)确定按钮 loading
      isLoading: false,
      // 全部地区列表
      regions: [],
      // 城市总数
      citysCount: null,
      // 自定义参数
      custom: {},
      // 已选择的城市id集
      selectedCityIds: [],
      // 排除的城市id集(用于控制不显示在unSelected中)
      excludedCityIds: [],
      // 未选择的地区
      unSelected: {},
      // 已选择的地区
      selected: {}
    }
  },
  // 初始化获取地区数据
  created () {
    // 获取地区数据
    RegionModel.getTreeData().then(data => {
      this.regions = data
    })
    // 城市总数
    RegionModel.getCitysCount().then(count => {
      this.citysCount = count
    })
  },
  methods: {

    // 显示对话框
    handle (custom, selectedCityIds = [], excludedCityIds = []) {
      // 显示窗口,
      this.visible = true
      // 自定义参数
      this.custom = custom
      // 已选择的城市id集
      this.selectedCityIds = selectedCityIds
      // 排除的城市id集
      this.excludedCityIds = excludedCityIds
      // 设置默认值
      this.init()
    },

    // 初始化数据
    init () {
      // 初始化未选择的地区
      this.initUnSelectedData()
      // 初始化已选择的地区
      this.initSelectedData()
    },

    // 初始化未选择的地区
    initUnSelectedData () {
      const { unSelected, regions, selectedCityIds, excludedCityIds } = this
      const data = _.cloneDeep(regions)
      const newUnSelected = {}
      // 遍历省份
      for (const pidx in data) {
        const province = data[pidx]
        // 遍历城市
        const cityList = []
        for (const cidx in province.city) {
          const cityItem = province.city[cidx]
          if (!inArray(cityItem.id, selectedCityIds) && !inArray(cityItem.id, excludedCityIds)) {
            cityList.push(cityItem)
          }
        }
        if (cityList.length) {
          province.city = cityList
          const isHideChildren = unSelected[pidx] ? unSelected[pidx].isHideChildren : true
          newUnSelected[pidx] = { ...province, isHideChildren }
        }
      }
      this.unSelected = newUnSelected
    },

    // 初始化已选择的地区
    initSelectedData () {
      const { selected, regions, selectedCityIds } = this
      const data = _.cloneDeep(regions)
      const newSelected = {}
      // 遍历省份
      for (const pidx in data) {
        const province = data[pidx]
        // 遍历城市
        const cityList = []
        for (const cidx in province.city) {
          const cityItem = province.city[cidx]
          if (inArray(cityItem.id, selectedCityIds)) {
            cityList.push(cityItem)
          }
        }
        if (cityList.length) {
          province.city = cityList
          const isHideChildren = selected[pidx] ? selected[pidx].isHideChildren : true
          newSelected[pidx] = { ...province, isHideChildren }
        }
      }
      this.selected = newSelected
    },

    // 展开/收缩子集
    handleActive (item) {
      item.isHideChildren = !item.isHideChildren
    },

    // 选中地区
    handleSelected (e, type, item) {
      e.stopPropagation()
      const newCityIds = []
      if (type === 'province') {
        for (const cidx in item.city) {
          newCityIds.push(item.city[cidx].id)
        }
      } else if (type === 'city') {
        newCityIds.push(item.id)
      }
      this.selectedCityIds = this.selectedCityIds.concat(newCityIds)
      this.init()
    },

    // 取消选中地区
    handleUnSelected (e, type, item) {
      e.stopPropagation()
      const newCityIds = []
      if (type === 'province') {
        for (const cidx in item.city) {
          newCityIds.push(item.city[cidx].id)
        }
      } else if (type === 'city') {
        newCityIds.push(item.id)
      }
      this.selectedCityIds = _.difference(this.selectedCityIds, newCityIds)
      this.excludedCityIds = _.difference(this.excludedCityIds, newCityIds)
      this.init()
    },

    // 全选
    handleSelectAll (e) {
      e.stopPropagation()
      const { selectedCityIds, unSelected } = this
      const newCityIds = []
      // 遍历省份
      for (const pidx in unSelected) {
        const province = unSelected[pidx]
        // 遍历城市
        for (const cidx in province.city) {
          const cityItem = province.city[cidx]
          newCityIds.push(cityItem.id)
        }
      }
      this.selectedCityIds = selectedCityIds.concat(newCityIds)
      this.init()
    },

    /**
     * 确认按钮
     */
    handleSubmit (e) {
      e.preventDefault()
      if (this.selectedCityIds.length < 1) {
        this.$message.error('请至少选择一个区域', 0.8)
        return false
      }
      // 通知父端组件提交完成了
      this.$emit('handleSubmit', {
        custom: this.custom,
        selectedCityIds: this.selectedCityIds,
        selectedText: this.getSelectedText()
      })
      // 关闭对话框事件
      this.handleCancel()
    },

    // 获取已选择地区文本
    getSelectedText () {
      const { regions, citysCount, selected, selectedCityIds } = this
      const textData = []
      if (selectedCityIds.length === citysCount) {
        return [{ name: '全国', citys: [] }]
      }
      for (const pidx in selected) {
        const province = selected[pidx]
        const citys = []
        if (province.city.length !== Object.keys(regions[pidx].city).length) {
          for (const cidx in province.city) {
            const city = province.city[cidx]
            citys.push({ name: city.name })
          }
        }
        textData.push({ name: province.name, citys })
      }
      return textData
    },

    /**
     * 关闭对话框事件
     */
    handleCancel () {
      this.visible = false
    }

  }
}
</script>
<style lang="less" scoped>

.areas-content {
  .areas-left,
  .areas-right {
    width: 50%;
    padding: 0 10px;
  }
  .areas-title {
    font-size: 14px;
    width: 95%;
    .areas-flip {
      margin-right: 17px;
      user-select: none;
      font-size: 12px;
    }
  }
  .areas-list {
    border: 1px solid #ededed;
    border-radius: 2px;
    height: 450px;
    width: 95%;
    overflow-y: auto;
    padding: 15px 10px;
    padding-bottom: 0;
    .areas-list-body,
    .areas-sublist {
      margin: 0;
      padding: 0;
    }
    .areas-item {
      margin-bottom: 8px;
      cursor: pointer;
      .text {
        padding-left: 20px;
        position: relative;
      }
      &.show-children .icon {
        transform: rotate(90deg);
      }
      .areas-item {
        padding-left: 10px;
        color: #999;
      }
      .icon {
        position: absolute;
        font-size: 11px;
        transition: all 0.3s ease-in-out;
        left: 5px;
        top: 5px;
      }
      .item-flip {
        user-select: none;
        font-size: 12px;
      }
      .areas-sublist {
        width: 100%;
        padding-top: 8px;
      }
    }
  }
}
</style>
