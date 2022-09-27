<template>
  <main class="login flex flex-col">
        <div class="login-box flex flex-col">
            <img src="@/assets/img/log-in-page/spiderum-logo.png" alt="">
            <lable>Tên đăng nhập</lable><input type="email" v-model="email">
            <br>
            <lable>Mật khẩu</lable><input type="password" v-model="password">
            <br>
            <button class="btn-login m-b-15" v-on:click="signIn">Đăng Nhap</button>
            {{email}}{{password}}
        </div>
    </main>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            email:'',
            password:''
        }
    },
    methods: {
        async signIn () {
            const respone = await axios.post('/api/v1/user1/login', {
                email: this.email,
                password: this.password
            });
            console.log(respone)
        }
    }
}
</script>

<style>
@import url(@/assets/css/style.css);
</style>