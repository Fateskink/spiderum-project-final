<template>
  <div class="artical">
    <h2>Tất cả bài viết</h2>
    <div class="artical-list">
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
      posts: {},
    };
  },
  async created() {
    await this.getAllPost();
  },
  methods: {
    getAllPost() {
      axios.get('/user1/posts').then((res) => {
        this.posts = res.data.posts;
        console.log(this.posts);
      });
    },
    setAltImg: function (event) {
      event.target.src = 'https://wellesleysocietyofartists.org/wp-content/uploads/2015/11/image-not-found.jpg';
    },
  },
  filters: {
    shortArticle(value) {
      return value.slice(0, 75) + '...';
    },
  },
};
</script>
  
  <style>
</style>