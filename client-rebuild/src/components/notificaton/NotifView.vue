<template>
  <div class="notification-box">
    <h1 class="m-b-15">Thông báo</h1>
    <div class="noti-list">
      <div v-for="notification in notifications" :key="notification.id">
        <a href="https://google.com"
          >Người dùng {{ notification.actor_id }} đã {{ notification.action }} vào
          {{ notification.notificationable_type }} của bạn.</a
        >
      </div>
    </div>
    <h2 class="none-noti" v-if="notifCheck()">Bạn hiện không có thông báo nào</h2>
  </div>
</template>

<script>
import axios from '@/axios/axios';
export default {
  data() {
    return {
      notifications: [],
    };
  },
  created() {
    this.getNotification();
  },
  computed: {},
  methods: {
    notifCheck: function () {
      if (this.notifications.length === 0) {
        return true;
      } else {
        return false;
      }
    },
    async getNotification() {
      await axios
        .get('/user1/notifications')
        .then((res) => (this.notifications = res.data.notifications), console.log(this.notifications));
    },
  },
};
</script>

<style scoped>
h1 {
  font-size: 20px;
}
</style>