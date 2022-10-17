<template>
  <main class="login flex flex-col">
    <form class="login-box flex flex-col" @submit.prevent="signIn">
      <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="" />
      <label>Tên đăng nhập</label><input type="email" v-model="email" />
      <br />
      <label>Mật khẩu</label><input type="password" v-model="password" />
      <br />
      <input type="submit" value="Đăng Nhập" class="btn-login m-b-15" />
    </form>
  </main>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
import { mapFields } from 'vuex-map-fields';
const { mapActions } = createNamespacedHelpers('auth');
export default {
  data() {
    return {};
  },
  computed: {
    ...mapFields('auth', {
      email: 'loginform.email',
      password: 'loginform.password',
    }),
  },
  methods: {
    ...mapActions(['signIn']),
  },
};
</script>

<style>
</style>