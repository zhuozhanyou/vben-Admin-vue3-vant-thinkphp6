<template>
  <iframe id="map" src="static/getpoint/index.html" width="915" height="610"></iframe>
</template>

<script>
import PropTypes from 'ant-design-vue/es/_util/vue-types'

// 省市区级联选择器组件
export default {
  name: 'Getpoint',
  model: {
    prop: 'value',
    event: 'change'
  },
  props: {
    // v-model 指定选中项
    value: PropTypes.array.def()
  },
  data () {
    return {
      // 选中项
      sValue: []
    }
  },
  watch: {
    value (val) {
      this.sValue = val
    }
  },
  created () {
    window.setCoordinate = this.setCoordinate
  },
  methods: {

    setCoordinate (coordinate) {
      this.$emit('setCoordinate', coordinate)
    }

  }
}
</script>

<style lang="less" scoped>
</style>
