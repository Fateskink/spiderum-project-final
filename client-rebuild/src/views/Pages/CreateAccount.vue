<template>
  <form class="login flex flex-col m-t-30" @submit.prevent="register">
    <div class="login-box flex flex-col">
      <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="" />
      <label>Họ và tên</label><input type="text" v-model="name" /> <label>Email</label
      ><input type="email" v-model="email" />
      <br />
      <label>Mật khẩu</label><input type="password" v-model="password" /> <label>Nhập lại mật khẩu</label
      ><input type="password" v-model="passwordConfirmation" />
      <br />
      <input type="submit" value="Đăng Ký" class="btn-login m-b-15" />
    </div>
  </form>
</template>

<script>
import { mapFields } from 'vuex-map-fields';
import { createNamespacedHelpers } from 'vuex';
const { mapActions } = createNamespacedHelpers('auth');

export default {
  data() {
    return {};
  },
  computed: {
    ...mapFields('auth', {
      name: 'registerForm.name',
      email: 'registerForm.email',
      passwordConfirmation: 'registerForm.password_confirmation',
      password: 'registerForm.password',
    }),
  },
  methods: {
    ...mapActions(['register']),
  },
};
</script>

<style>
</style>