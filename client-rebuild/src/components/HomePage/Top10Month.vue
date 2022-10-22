<template>
  <div class="top10-month">
    <div class="content-fix pos-rel">
      <h2 class="trending-title">10 BÀI VIẾT NỔI BẬT TRONG THÁNG</h2>
      <img
        class="scroll-btn scroll-left"
        src="@/assets/img/top10month/icons8-chevron-left-48.png"
        @click="scrollLeft"
      />
      <img
        class="scroll-btn scroll-right"
        src="@/assets/img/top10month/icons8-chevron-right-48.png"
        @click="scrollRight"
      />
      <div class="flex top10-list" id="top10-list">
        <div class="m-l-15" v-for="post in posts" :key="post.id">
          <router-link :to="'/posts/' + post.id">
            <div class="image">
              <img
                class="content-img"
                src="https://wellesleysocietyofartists.org/wp-content/uploads/2015/11/image-not-found.jpg"
                alt=""
              />
            </div>
            <h2 class="artical-title">{{ post.title }}</h2>
          </router-link>
          <div class="card-details">
            <div class="username-card">
              {{ post.user.name }} .
              <span class="timepost-card">{{ convertTime(post.created_at) }}</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from '@/axios/axios';
export default {
  data() {
    return {
      posts: {},
    };
  },
  created() {
    this.getPost();
  },
  methods: {
    async getPost() {
      await axios.get('/user1/top').then((res) => {
        this.posts = res.data;
      });
    },
    convertTime(jsonISOTime) {
      let date = new Date(jsonISOTime);
      let time = date.getDate() + ' tháng ' + (date.getMonth() + 1);
      // console.log('thang' + date.getMonth());
      return time;
    },
    scrollRight() {
      document.getElementById('top10-list').scrollLeft += 500;
    },
    scrollLeft() {
      document.getElementById('top10-list').scrollLeft -= 500;
    },
  },
  computed: {},
};
</script>

<style></style>
