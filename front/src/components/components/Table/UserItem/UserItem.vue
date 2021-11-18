<template>
  <div v-if="user" class="user-info clearfix">
    <div class="in-left">
      <a-tooltip>
        <template slot="title">会员ID: {{ user.user_id }}</template>
        <img v-if="user.avatar_url" :src="user.avatar_url" alt="会员头像" />
        <img v-else src="~@/assets/img/default-avatar.png" alt="会员头像" />
      </a-tooltip>
    </div>
    <div class="in-right flex flex-dir-column flex-x-center">
      <p class="user-name oneline-hide">{{ user.nick_name }}</p>
      <p v-if="PlatformIcons[user.platform]" class="user-source">
        <a-icon class="icon" :class="[user.platform]" :component="PlatformIcons[user.platform]" />
      </p>
    </div>
  </div>
</template>

<script>
import PropTypes from 'ant-design-vue/es/_util/vue-types'
import { mpweixin, h5 } from '@/core/icons'

// 注册来源图标
const PlatformIcons = {
  'MP-WEIXIN': mpweixin,
  'H5': h5
}

// Table内容元素: 会员信息
export default {
  name: 'UserItem',
  props: {
    // 会员信息
    user: PropTypes.object.def()
  },
  data () {
    return {
      // 注册来源图标
      PlatformIcons
    }
  },
  methods: {

  }
}
</script>

<style lang="less" scoped>
// 会员信息
.user-info {
  width: 160px;
  height: 40px;
  line-height: 1.3;

  .in-left {
    float: left;
    margin-right: 10px;

    img {
      width: 40px;
      height: 40px;
      border-radius: 50%;
    }
  }

  .in-right {
    float: left;
    width: 100px;
    height: 100%;

    .user-name {
      margin-bottom: 2px;
    }

    .user-source {
      font-size: 16px;

      .icon {
        margin-right: 5px;

        &:last-child {
          margin-right: 0;
        }
      }

      .MP-WEIXIN {
        color: #04be02;
      }
      .H5 {
        color: #e44c27;
      }
    }
  }
}
</style>
