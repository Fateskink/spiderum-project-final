<template>
  <main class="login flex flex-col">
    <form class="login-box flex flex-col" @submit.prevent="signIn">
      <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="" />
      <label>Tên đăng nhập</label><input type="email" v-model="loginform.email" />
      <br />
      {{ currentUser.token }}
      {{ currentUser.name }}
      <label>Mật khẩu</label><input type="password" v-model="loginform.password" />
      <br />
      <input type="submit" value="Đăng Nhập" class="btn-login m-b-15" />
    </form>
  </main>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapActions, mapState } = createNamespacedHelpers('auth');
export default {
  data() {
    return {};
  },
  computed: {
    ...mapState(['currentUser', 'loginform']),
  },
  methods: {
    ...mapActions(['signIn']),
  },
};
</script>

<style>
</style>