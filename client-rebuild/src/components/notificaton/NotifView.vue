<template>
  <div class="notification-box">
    <h1 class="m-b-15">Thông báo</h1>
    <div>
      <div v-for="notification in notifications" :key="notification.id">
        <a class="noti-list">{{ notification.actor.name }} {{ actionTranslate(notification.action) }} bạn.</a>
      </div>
    </div>
    <h2 class="none-noti" v-if="notifCheck()">Bạn hiện không có thông báo nào</h2>
  </div>
</template>

<script>
import axios from '@/axios/axios';
// import { actionTranslate } from '@/function/actionTranslate';
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
    actionTranslate(actionName) {
      console.log(actionName);
      switch (actionName) {
        case 'commented':
          actionName = 'đã trả lời bình luận của';
          break;
        case 'posted':
          actionName = 'đã đăng bài';
          break;
        case 'voted':
          actionName = 'đã vote bài viết';
          break;
        case 'followed':
          actionName = 'đang theo dõi';
          break;
      }
      return actionName;
    },
    async getNotification() {
      await axios
        .get('/user1/notifications')
        .then((res) => (this.notifications = res.data.notifications), console.log(this.notifications));
    },
    test() {},
  },
  // mounted() {
  //   actionTranslate;
  // },
};
</script>

<style scoped>
h1 {
  font-size: 20px;
}
</style>