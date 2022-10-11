<template>
  <main class="login flex flex-col">
    <div class="login-box flex flex-col">
      <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="" />
      <lable>Tên đăng nhập</lable><input type="email" v-model="currentUser.email" />
      <br />
      <lable>Mật khẩu</lable><input type="password" v-model="currentUser.password" />
      <br />
      <button class="btn-login m-b-15" v-on:click="signIn">Đăng Nhap</button>
    </div>
  </main>
</template>

<script>
// import axios from 'axios';
// import { mapActions, mapState } from 'vuex';
import { createNamespacedHelpers } from 'vuex';
const { mapActions, mapState } = createNamespacedHelpers('auth');
// const auth1 = createNamespacedHelpers('auth1');

export default {
  data() {
    return {};
  },
  computed: {
    ...mapState(['currentUser']),
    // currentUserData() {
    //   console.log(this.$store.state.currentUser);
    //   return this.$store.state.currentUser;
    // },
  },
  methods: {
    ...mapActions(['signIn']),
    // ...auth1.mapActions(['signIn']),
    // login(){
    //     if(this.$store.state.token != '' || this.$store.state.token != null || this.$store.state.token.length != 0){
    //         this.$router.push("/discuss")
    //     }
    // }
  },
};
</script>

<style>
@import url(@/assets/css/style.css);
</style>