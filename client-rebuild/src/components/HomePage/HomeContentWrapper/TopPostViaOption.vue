<template>
  <div class="artical">
    <div class="border-b-light-gray">
      <ul class="flex p-t-15 p-b-15">
        <li><a class="p-lr-30 artical-item" href="">Mới nhất</a></li>
        <li><a class="p-lr-30 artical-item" href="">Đang theo dõi</a></li>
        <li><a class="p-lr-30 artical-item" href="">Top bình luận</a></li>
      </ul>
    </div>
    <div class="artical-list">
      <div class="none-of-post" v-if="checkPost()">Không có bài viết trong mục này. Đóng góp ngay</div>
      <div v-for="post in posts" :key="post.id" class="artical-box flex m-b-66">
        <img class="content-img" src="" alt="" @error="setAltImg" />
        <div class="aside-content">
          <div class="artical-categories flex sp-between align-center p-tb-15">
            <p class="daf">{{ post.tag_id }}</p>
            <img class="dfas" src="@/assets/img/svg-icon/save.svg" alt="" />
          </div>
          <router-link v-bind:to="'/posts/' + post.id">
            <a href=""
              ><h2 class="artical-title">
                {{ post.title }}
              </h2></a
            >
            <p class="artical-short-content" v-html="$options.filters.shortArticle(post.content)"></p>
          </router-link>
          <div class="artical-author flex align-center sp-between p-tb-15">
            <div class="align-center flex">
              <img
                class="img-avatar"
                src="https://images.spiderum.com/sp-xs-avatar/a0d1ce20071711ed83a82bc6df79ac6d.jpeg"
                alt=""
              />
              <a href="" class="artical-author-name">{{ post.user_id }}</a>
            </div>
            <!-- <button @click="consolelogmeta">ConsoleLog</button> -->
            <div class="flex align-center">
              <img src="@/assets/img/svg-icon/upvote.svg" alt="" />
              <p>Upvote</p>
              <img src="@/assets/img/svg-icon/comment-time.svg" alt="" />
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
      id: this.$route.params.id,
      posts: {},
      currentPage: 1,
      meta: {},
    };
  },
  methods: {
    checkPost() {
      this.posts.length == 0 ? true : false;
    },
    setAltImg: function (event) {
      event.target.src = 'https://wellesleysocietyofartists.org/wp-content/uploads/2015/11/image-not-found.jpg';
    },
    setCurrentPage(pageNum) {
      this.currentPage = pageNum;
    },
    setMeta(payload) {
      this.meta = payload;
    },
    consolelogmeta() {
      console.log(this.meta.total);
    },
    goToPage(pageNum) {
      this.setCurrentPage(pageNum);
      this.setMeta;
      this.getPosts();
    },
    async getPosts() {
      await axios.get(`user1/tags/${this.id}?page${this.currentPage}`).then((response) => {
        this.posts = response.data.posts;
      });
      console.log(this.posts);
    },
  },
  // async mounted() {
  //   await axios.get(`user1/tags/${this.id}?page${this.currentPage}`).then((response) => {
  //     this.posts = response.data.posts;
  //   });
  //   console.log(this.posts);
  // },
  mounted() {
    this.getPosts();
  },
  filters: {
    shortArticle(value) {
      return value.slice(0, 75) + '...';
    },
  },
  watch: {
    $route: {
      handler(newValue) {
        axios.get(`user1/tags/${newValue.params.id}?page=${this.currentPage}`).then((response) => {
          this.posts = response.data.posts;
          this.meta = response.data.meta;
        });
      },
      deep: true,
    },
  },
  computed: {},
};
</script>

<style>
</style>