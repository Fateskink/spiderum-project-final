<template>
    <main class="login flex flex-col">
          <div class="login-box flex flex-col">
              <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="">
              <label>Họ và tên</label><input type="text" v-model="users.name">
              <label>Email</label><input type="email" v-model="users.email">
              <br>
              <label>Mật khẩu</label><input type="password" v-model="users.password">
              <label>Nhập lại mật khẩu</label><input type="password" v-model="users.password_confirmation">
              <br>
              <button class="btn-login m-b-15" v-on:click="signUp">Đăng Ký</button>
          </div>
      </main>
  </template>
  
  <script>
import axios from 'axios'
 
  export default {
      data() {
          return {
              users: {
                name : '',
                email: '',
                password: '',
                // username: ''
                password_confirmation: ''
              }
          }
      },
      methods: {
         async signUp () {
            const respone = await axios.post('/api/v1/user1/users', {
                name: this.users.name,
                email: this.users.email,
                password: this.users.password,
                password_confirmation: this.users.password_confirmation
            });
            console.log(respone)
            alert("Đăng ký thành công! Quay lại trang đăng nhập");
            this.$router.push('/login')
         }
      }
  }
  </script>
  
  <style>
  @import url(@/assets/css/style.css);
  </style>