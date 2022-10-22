<template>
  <div class="content-fix m-t-15 single-blog">
    <!-- <div class="m-t-15" v-for="blog in blogs" :key="blog"> -->
    <button @click="editPost">Sửa bài viết</button>
    <h1 class="m-t-15">{{ blogs.title }}</h1>
    <article class="m-t-15" v-html="blogs.content"></article>
    <div class="post-comment">
      <h3>Bình luận</h3>
      <textarea
        cols="30"
        rows="10"
        placeholder="Mời nhập bình lụân của bạn"
        v-model="comments.activeComment"
      ></textarea>
      <button @click="postComment">Send</button>
      <div class="user-comment">
        <h4>
          User id {{ comments.user_id }}: <span>{{ comments.body }}</span>
        </h4>
      </div>
    </div>
    <button @click="showData">Console log data</button>
    <!-- </div> -->
  </div>
</template>

<script>
import axios from 'axios';
import { mapState } from 'vuex';
// import qs from 'qs'

export default {
  data() {
    return {
      blogs: {
        title: '',
        content: '',
      },
      comments: {
        user_id: '',
        body: '',
        activeComment: '',
      },
      id: this.$route.params.id,
    };
    cod;
  },
  methods: {
    showData: function () {
      console.log(this.blogs);
      console.log(this.currentUser.token);
      // console.log(blog)
    },
    async postComment() {
      try {
        await axios.post(
          '/api/v1/user1/posts/' + this.id + '/comments',
          {
            body: this.comments.activeComment,
          },
          {
            headers: {
              Authorization: `Bearer ${this.currentUser.token}`,
            },
          },
        );
      } catch (error) {
        console.log(error);
        // console.log(this.comments.activeComment)
      }
    },
    editPost: function () {
      this.$router.push(`/editpost/${this.id}`);
    },

    // async postComment(){
    //     const configs ={
    //         method: "POST",
    //         url: `/api/v1/user1/posts/${this.id}/comments`,
    //         param: {
    //             body: "this.comments.activeComment"
    //         }
    //         // headers: {
    //         //     Authorization: `Bearer ${this.currentUser.token}`
    //         //     // `BearereyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2NjQ4NTc2MjZ9.O6muJ30a1BMDNByqb4KYPiPw2OjoPrDkDUa3yAcLajA`
    //         // },
    //     }
    //     await axios(configs).then(res => {
    //         console.log(res)
    //     }).catch(err => {
    //         console.log(err)
    //         console.log(configs)
    //         console.log(this.currentUser.token)
    //     })
    // }

    //  postComment(){

    //     axios.post(`/api/v1/user1/posts/${this.id}/comments`, {
    //         body: "this is comment"
    //     }).catch(err => {
    //         console.log(err)
    //     })
    // }
  },
  async created() {
    // alert("created");

    // this.$http.get('https://khoatd-2f63c-default-rtdb.asia-southeast1.firebasedatabase.app/testdb/' + this.id +'.json').then(function(data){
    //     // this.blogs = data.body;
    //     // console.log(data);
    //     this.blogs = data;
    //     console.log(this.blogs)
    // })

    // .then(function(data){
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

    try {
      await axios.get('/api/v1/user1/posts/' + this.id).then((response) => {
        console.log(typeof response.data.post);
        this.blogs = response.data.post;
        console.log(this.blogs.title);
      });
    } catch (error) {
      console.log(error);
    }

    try {
      await axios.get('/api/v1/user1/posts/' + this.id + '/comments/1').then((respone) => {
        console.log(respone.data.comment.body);
        this.comments.user_id = respone.data.comment.user_id;
        this.comments.body = respone.data.comment.body;
        console.log(typeof respone.data.comment.created_at);
      });
    } catch (error) {
      console.log(error);
    }
  },
  filters: {
    shortArticle: function (value) {
      return value.slice(0, 350) + '...';
    },
  },
  computed: mapState(['currentUser']),
};
</script>

<style scoped>
h1 {
  font-size: 36px;
  font-size: 42px;
  line-height: 58px;
  text-align: center;
  margin-bottom: 35px;
}
@import '~vue2-editor/dist/vue2-editor.css';
</style>