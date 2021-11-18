<template>
  <div>
    <!-- 富文本编辑器 -->
    <VueUeditorWrap
      ref="Ueditor"
      v-model="content"
      :config="myConfig"
      @before-init="addCustomButtom"
    />
  </div>
</template>

<script>
import _ from 'lodash'
import PropTypes from 'ant-design-vue/es/_util/vue-types'
import VueUeditorWrap from 'vue-ueditor-wrap'
import { defaultConfig } from './config'

export default {
  name: 'Ueditor',
  components: {
    VueUeditorWrap
  },
  model: {
    prop: 'value',
    event: 'change'
  },
  props: {
    // 内容
    // eslint-disable-next-line vue/require-default-prop
    value: PropTypes.string,
    // 编辑器配置
    config: PropTypes.object.def({})
  },
  data () {
    const myConfig = _.merge(defaultConfig, this.config)
    return {
      myConfig,
      content: ''
    }
  },
  watch: {
    value: {
      // 首次加载的时候执行函数
      immediate: true,
      handler (val) {
        this.content = val
      }
    },
    content (newVal) {
      // 使用setTimeout防止热更新时报错
      setTimeout(() => {
        this.$emit('change', newVal)
      }, 10)
    }
  },
  methods: {

    // 注册自定义组件
    addCustomButtom (editorId) {
      const app = this
      window.UE.registerUI('simpleupload', function (editor, uiName) {
        // 创建一个 button
        var btn = new window.UE.ui.Button({
          // 按钮的名字
          name: uiName,
          // 提示
          title: '插入图片',
          // 需要添加的额外样式，可指定 icon 图标，图标路径参考常见问题 2
          cssRules: '',
          // 点击时执行的命令
          onclick: () => {
            // 打开文件选择器
            app.handleSelectImage()
          }
        })
        // 因为你是添加 button，所以需要返回这个 button
        return btn
      }, undefined /* 指定添加到工具栏上的哪个位置，默认时追加到最后 */, editorId /* 指定这个 UI 是哪个编辑器实例上的，默认是页面上所有的编辑器都会添加这个按钮 */)
    },

    // 打开文件选择器
    handleSelectImage () {
      this.$refs.FilesModal.show()
    },

    // 文件库modal确认回调
    handleSelectImageSubmit (selectedItems) {
      if (selectedItems.length > 0) {
        const content = selectedItems.map(item => {
          return `<p><img src="${item.preview_url}"/></p>`
        })
        this.inserthtml(content.join(''))
      }
    },

    inserthtml (content) {
      const editor = this.$refs.Ueditor.editor
      editor.execCommand('inserthtml', content)
    }

  }
}
</script>
