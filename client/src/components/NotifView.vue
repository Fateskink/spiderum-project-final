<template>
  <div class="notification-box">
    <h1 class="m-b-15">Thông báo</h1>
    <div class="noti-list">
      <div v-for="noti in notification.notification_lists" :key="noti.id">{{noti}}</div>
    </div>
    <h2 class="none-noti" v-if="notifCheck()">Bạn hiện không có thông báo nào</h2>
  </div>
</template>

<script>
import { mapState } from 'vuex'
export default {
  data() {
    return {
      
    }
  },
  computed: {
    ...mapState(['notification']),
 
  },
  methods: {
    notifCheck: function () {
      if (this.notification.notification_lists.length === 0) {
        return true
      } else {
        return false
      }
    }
  }
}
</script>

<style scoped>
  h1 {
    font-size: 20px ;
  }
</style>