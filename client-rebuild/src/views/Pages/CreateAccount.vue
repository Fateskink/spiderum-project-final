<template>
  <form class="login flex flex-col m-t-30" @submit.prevent="register">
    <div class="login-box flex flex-col">
      <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="" />
      <label>Họ và tên</label><input type="text" v-model="registerForm.name" /> <label>Email</label
      ><input type="email" v-model="registerForm.email" />
      <br />
      <label>Mật khẩu</label><input type="password" v-model="registerForm.password" /> <label>Nhập lại mật khẩu</label
      ><input type="password" v-model="registerForm.password_confirmation" />
      <br />
      <input type="submit" value="Đăng Ký" class="btn-login m-b-15" />
    </div>
  </form>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapActions, mapState } = createNamespacedHelpers('auth');
export default {
  data() {
    return {};
  },
  computed: {
    ...mapState(['registerForm']),
  },
  methods: {
    ...mapActions(['register']),
  },
};
</script>

<style>
</style>