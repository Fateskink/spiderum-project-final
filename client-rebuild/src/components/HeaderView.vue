<template>
  <header class="header p-t-15">
    <div class="navbar flex flex-align-center sp-between content-fix">
      <div>
        <ul class="left-navbar flex flex-align-center">
          <li>
            <router-link class="p-15" to="/"
              ><img class="main-logo" src="@/assets/img/wideLogo.png" alt=""
            /></router-link>
          </li>
          <li>
            <a class="p-15" href="https://www.facebook.com/Spiderum/"
              ><img class="nav-logo" src="@/assets/img/navbar/icons8-facebook-circled.gif" alt=""
            /></a>
          </li>
          <li>
            <a class="p-15" href="https://www.youtube.com/c/Spiderum"
              ><img class="nav-logo" src="@/assets/img/navbar/icons8-youtube-logo.gif" alt=""
            /></a>
          </li>
          <li>
            <a class="p-15" href=""><img class="nav-logo" src="@/assets/img/navbar/icons8-spotify.gif" alt="" /></a>
          </li>
        </ul>
      </div>
      <div>
        <ul class="right-navbar flex flex-align-center">
          <li>
            <input class="search-box" type="text" v-model="searchText" />
          </li>
          <li>
            <a class="nav-icon"><img src="@/assets/img/navbar/icons8-search.svg" alt="" /></a>
          </li>
          <li class="pos-rel" v-show="currentUser.token != null">
            <router-link to="/userprofile">Xin chào, {{ currentUser.name }} </router-link>
            <notif-view v-show="showNotif"></notif-view>
          </li>
          <li v-show="currentUser.token != null" @click="showNotif = !showNotif">
            <a class="nav-icon"><img src="@/assets/img/navbar/icons8-notification-32.png" alt="" /></a>
          </li>

          <li v-show="currentUser.token != null">
            <router-link to="/createpost" class="btn-gray">Viết bài</router-link>
          </li>
          <li v-show="currentUser.token == null"><router-link to="/signin" class="btn-gray">Đăng Nhập</router-link></li>
          <li v-show="currentUser.token == null"><router-link to="/register" class="btn-gray">Đăng Ký</router-link></li>
          <li v-show="currentUser.token != null">
            <button class="btn-red" @click="signOut">Đăng Xuất</button>
          </li>
        </ul>
        <ul class="right-navbar-option">
          <li>
            <a class="nav-icon"><img src="@/assets/img/navbar/icons8-option-24.png" alt="" /></a>
          </li>
        </ul>
      </div>
    </div>
    <div>
      <ul class="flex p-tb-15 navbar-categories content-fix">
        <li>
          <router-link to="/categories/quan-diem-tranh-luan"
            ><a class="p-r-35 categories-item" href="">Quan điểm - Tranh luận</a></router-link
          >
        </li>
        <li>
          <router-link to="/categories/truyen-cam-hung" class="p-r-35 categories-item" href=""
            >Truyền cảm hứng</router-link
          >
        </li>
        <li>
          <router-link to="/categories/khoa-hoc" class="p-r-35 categories-item" href="">Khoa học công nghệ</router-link>
        </li>
        <li><router-link to="/categories/the-thao" class="p-r-35 categories-item" href="">Thể thao</router-link></li>
        <li><a class="p-r-35 categories-item" href="">Game</a></li>
        <li>
          <router-link to="/showblog"><a class="p-r-35 categories-item" href="">Tất cả bài viết</a></router-link>
        </li>
      </ul>
    </div>
  </header>
</template>

<script>
import { createNamespacedHelpers } from 'vuex';
const { mapActions, mapState } = createNamespacedHelpers('auth');
export default {
  components: {},
  data() {
    return {
      showNotif: false,
      searchText: '',
    };
  },
  computed: {
    ...mapState(['currentUser']),
  },
  methods: {
    ...mapActions(['signOut']),
  },
};
</script>

<style>
</style>