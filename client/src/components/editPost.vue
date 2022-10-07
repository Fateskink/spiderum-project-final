<template>
    <body class="content-fix m-t-15">
      <form class="flex flex-col flex-gaps-30" @submit.prevent="upPost">
          <h2>Chỉnh sửa bài viết của bạn</h2>
          <input type="text" placeholder="Tiêu đề bài viết" v-model="blog.title">
          <!-- <button v-on:click="addPara">Add Para</button> -->
          <VueEditor v-model="blog.content"/>
          <div class="flex sp-between">
              <div class="flex flex-col">
                  <!-- <label for="">Chọn chuyên mục: </label>
                  <div><label for="">Quan điểm - Tranh luận</label><input type="checkbox" value="Quan điểm - Tranh luận" v-model="blog.categories"></div>
                  <div><label for="">Truyền cảm hứng</label><input type="checkbox" value="Truyền cảm hứng" v-model="blog.categories"></div>
                  <div><label for="">Khoa học công nghệ</label><input type="checkbox" value="Khoa học công nghệ" v-model="blog.categories"></div>
                  <div><label for="">Thể thao</label><input type="checkbox" value="Thể thao" v-model="blog.categories"></div>
                  <div><label for="">Game</label><input type="checkbox" value="Game" v-model="blog.categories"></div> -->
                  <label for="carte">Thể loại</label>
                  <select v-model="blog.category">
                      <option :value='index+1' v-for="(category,index) in categories" :key="category+index">{{category}}</option>
                  </select>
                  <!-- {{blog.category}} -->
                  <!-- <button @click="run()">Console log</button> -->
              </div>
          </div>
          <div>
              <input class="btn-lightblue" type="submit" value="Gửi bài viết">
              <button class="btn-gray">Lưu bài viết</button>
          </div>
      </form>
  </body>
  </template>
  
  <script>
  import { mapActions } from 'vuex'
  import { VueEditor } from "vue2-editor";
  import axios from 'axios';
  export default {
      data() {
          return {
              // category: '',
              categories:[
                  'Truyền cảm hứng',
                  'Quan điểm - tranh luận',
                  'Khoa học',
                  'Thể thao',
                  'Sáng tạo nội dung',
                  'Phim',
                  'Âm nhạc',
                  'English Zone',
                  'Skill'
              ],
              blog:[],
              id: this.$route.params.id
          }
      },
      components: {
          VueEditor
      },
      async created () {
        try {
            await axios.get(`/api/v1/user1/posts/${this.id}`)
            .then (
                (response)=> {
                    this.blog = response.data.post
                }
            )
        } catch (error) {
            console.log(error)
        }
      },
      computed: {
        //   ...mapState(["blog"]),
      },
      // methods: {
      //     post: function () {
      //         this.$http.post('https://khoatd-2f63c-default-rtdb.asia-southeast1.firebasedatabase.app/testdb.json', this.blogs).then(function(data){
      //             console.log(data)
      //         })
      //     }
      // },
      // computed: {
         
      // }
      methods: {
          ...mapActions(['upPost']),
          async editPost () {
            try {
                await axios.patch(`/api/v1/user1/posts/${this.id}`,{
                    title: this.blog.title,
                    content: this.blog.content,
                    tag_id: this.blog.ca
                })
            } catch (error) {
                console.log(error)
            }
          }
          // run: function () {
          //     return console.log (this.categories[1].nametag)
          // },
          // checkID(e){
          //     console.log(e)
          // }
      }
  }
  </script>
  
  <style scoped>
      h2 {
          margin-top: 30px;
          font-size: 42px;
          line-height: 58px;
          text-align: center;
          margin-bottom: 35px;
      }
  </style>