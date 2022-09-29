<template>
  <main class="login flex flex-col">
        <div class="login-box flex flex-col">
            <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="">
            <lable>Tên đăng nhập</lable><input type="email" v-model="currentUser.email">
            <br>
            <lable>Mật khẩu</lable><input type="password" v-model="currentUser.password">
            <br>
            <button class="btn-login m-b-15" v-on:click="signIn">Đăng Nhap</button>
        </div>
    </main>
</template>

<script>
// import axios from 'axios'
import { mapActions, mapState } from 'vuex';
export default {
    data() {
        return {
            
        }
    },
    computed: mapState(["currentUser"]),
    methods:{
        ...mapActions(["signIn"])
    }
}
</script>

<style>
@import url(@/assets/css/style.css);
</style>