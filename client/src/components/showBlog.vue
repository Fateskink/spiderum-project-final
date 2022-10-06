<template>
  <div class="content-fix m-t-15 flex">
    <div class="flex-7">
        <h1>
        Tất cả bài viết
        </h1>
        <div class="m-t-15 bg-gray " v-for="blog in blogs" :key="blog">
            <router-link v-bind:to="'/showBlog/singleBlog/'+blog.id"><h2>{{blog.title}}</h2></router-link>
            <article v-html="$options.filters.shortArticle(blog.content)"></article>
            <h3>Author: {{blog.author}}</h3>
            <p>The loai: {{blog.categories}}</p>
        </div>
        <button v-on:click="showData">ConsoleLog data</button>
    </div>
    <app-topauthor></app-topauthor>
  </div>
</template>

<script>
// import { mapActions } from 'vuex';
import axios from 'axios';
export default {

    data(){
        return {
            blogs:[]
        }
    },
    methods: {
        // ...mapActions(['showBlog']),
        showData: function () {
            console.log(this.blogs);
            // console.log(blog)
        }
    },
    async created () {
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
            await axios.get('/api/v1/user1/posts/',{
            }).then (
                (data) => {
                    var blogArray = data.data.posts;
                    console.log(blogArray)
                    this.blogs = blogArray
                }
            )
        } catch (error) {
            console.log(error)
        }
    },
    filters: {
        'shortArticle' : function (value) {
            return value.slice(0,150)+'...'
        }
    },
}
</script>

<style scoped>
.bg-gray {
    background: rgb(224, 224, 224);
}

h1 {
    color: rgb(22, 22, 22);
    font-size: 20px;
    font-weight: 600;
    line-height: 30px
}
</style>>

