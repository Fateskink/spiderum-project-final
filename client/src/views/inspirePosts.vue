<template>
  <div class="content-fix m-t-30 flex">
    <div class="flex-7">
      <h1>Thể loại: Truyền cảm hứng</h1>
      <!-- <div class="m-t-15 bg-gray " v-for="blog in blogs" :key="blog">
            <router-link v-bind:to="'/showBlog/singleBlog/'+blog.id"><h2>{{blog.title}}</h2></router-link>
            <article v-html="$options.filters.shortArticle(blog.content)"></article>
            <h3>Author: {{blog.author}}</h3>
            <p>The loai: {{blog.tag_id}}</p>
        </div> -->
      <div class="artical-box flex m-b-66" v-for="blog in blogs" :key="blog">
        <img class="content-img" src="" @error="setAltImg" alt="" />
        <div class="aside-content">
          <div class="artical-categories flex sp-between align-center p-tb-15">
            <p class="daf">{{ convertIdTag(blog.tag_id) }}</p>
            <img class="dfas" src="assets/img/svg-icon/save.svg" alt="" />
          </div>
          <router-link v-bind:to="'/showBlog/singleBlog/' + blog.id">
            <div>
              <a href=""
                ><h2 class="artical-title">{{ blog.title }}</h2></a
              >
              <p class="artical-short-content" v-html="$options.filters.shortArticle(blog.content)"></p>
            </div>
          </router-link>
          <div class="artical-author flex align-center sp-between p-tb-15">
            <div class="align-center flex">
              <img
                class="img-avatar"
                src="https://images.spiderum.com/sp-xs-avatar/a0d1ce20071711ed83a82bc6df79ac6d.jpeg"
                alt=""
              />
              <a href="" class="artical-author-name">Tác giả: user {{ blog.user_id }}</a>
            </div>
            <div class="flex align-center">
              <img src="assets/img/svg-icon/upvote.svg" alt="" />
              <p>Upvote</p>
              <img src="assets/img/svg-icon/comment-time.svg" alt="" />
            </div>
          </div>
        </div>
      </div>
      <button v-on:click="convertIdTag(1)">ConsoleLog data</button>
      <input type="text" value="search" v-model="search" />
    </div>
    <app-topauthor></app-topauthor>
  </div>
</template>

<script>
// import { mapActions } from 'vuex';
import axios from 'axios';
export default {
  data() {
    return {
      blogs: [],
      search: '',
      tag: 1,
    };
  },
  methods: {
    // ...mapActions(['showBlog']),
    showData: function () {
      console.log(this.blogs);
      // console.log(blog)
    },
    setAltImg: function (event) {
      event.target.src = 'https://wellesleysocietyofartists.org/wp-content/uploads/2015/11/image-not-found.jpg';
    },
    convertIdTag: function (idtag) {
      switch (idtag) {
        case 1:
          idtag = 'Truyền cảm hứng';
          break;
        case 2:
          idtag = 'Quan điểm - Tranh luận';
          break;
        case 3:
          idtag = 'Khoa học';
          break;
        case 4:
          idtag = 'Thể thao';
          break;
        case 5:
          idtag = 'Sáng tạo nội dung';
          break;
        case 6:
          idtag = 'Phim';
          break;
        case 7:
          idtag = 'Âm nhạc';
          break;
        case 8:
          idtag = 'English Zone';
          break;
        case 9:
          idtag = 'Kỹ năng';
          break;
        default:
          return 'Unknow category';
      }
      return idtag;
    },
  },
  async created() {
    // // alert("created");
    // this.$http.get('https://khoatd-2f63c-default-rtdb.asia-southeast1.firebasedatabase.app/testdb.json').then(function(data){
    //     // this.blogs = data.body;
    //     // console.log(data);
    //     return data.json();
    // }).then(function(data){
    //     var blogArray = [];
    //     // console.log(data);
    //     for (let key in data){
    //         console.log(data[key]);
    //         data[key].id = key;
    //         blogArray.push(data[key])
    //     }
    //     // console.log(blogArray)
    //     this.blogs = blogArray
    // })

    // alert("created")
    try {
      await axios.get('/api/v1/user1/tags/1', {}).then(
        (data) => {
          var blogArray = data.data.posts;
          console.log(blogArray);
          this.blogs = blogArray;
        },
        // this.catagoryFilter()
      );
    } catch (error) {
      console.log(error);
    }
  },
  filters: {
    shortArticle: function (value) {
      return value.slice(0, 150) + '...';
    },
    // 'tagFilter': function ()
  },
  computed: {
    // catagoryFilter: function () {
    //     return this.blogs.filter((blog) => {
    //         return blog.tag_id.match(1)
    //     })
    // },
    // catagoryFilter: function () {
    //     return this.blogs.filter((blog) => {
    //         return this.search.includes(blog.tag)
    //     })
    // },
  },
};
</script>

<style scoped>
.bg-gray {
  background: rgb(224, 224, 224);
}

h1 {
  color: rgb(22, 22, 22);
  font-size: 20px;
  font-weight: 600;
  line-height: 30px;
}
</style>>

