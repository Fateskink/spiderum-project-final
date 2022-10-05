<template>
  <body class="content-fix m-t-15">
    <form class="flex flex-col flex-gaps-30" action="">
        <h2>Tạo bài viết của bạn</h2>
        <input type="text" placeholder="Tiêu đề bài viết" v-model="blog.title">
        <!-- <button v-on:click="addPara">Add Para</button> -->
        <VueEditor v-model="blog.content"/>
        <div class="flex sp-between">
            <div>
                <label for="userName">Tên tác giả: </label>   
                <input type="text" name="" id="userName" v-model="blog.author">
            </div>
            <div class="flex flex-col">
                <label for="">Chọn chuyên mục: </label>
                <div><label for="">Quan điểm - Tranh luận</label><input type="checkbox" value="Quan điểm - Tranh luận" v-model="blog.categories"></div>
                <div><label for="">Truyền cảm hứng</label><input type="checkbox" value="Truyền cảm hứng" v-model="blog.categories"></div>
                <div><label for="">Khoa học công nghệ</label><input type="checkbox" value="Khoa học công nghệ" v-model="blog.categories"></div>
                <div><label for="">Thể thao</label><input type="checkbox" value="Thể thao" v-model="blog.categories"></div>
                <div><label for="">Game</label><input type="checkbox" value="Game" v-model="blog.categories"></div>
                <!-- <select name="" id="">
                    <option value="">Quan điểm - Tranh luận</option>
                    <option value="">Truyền cảm hứng</option>
                    <option value="">Khoa học công nghệ</option>
                    <option value="">Thể thao</option>
                    <option value="">Game</option>
                </select> -->
            </div>
        </div>
        <button class="btn-gray" v-on:click.prevent="upPost">Gửi bài viết</button>
    </form>
</body>
</template>

<script>
import { mapActions, mapState } from 'vuex'
import { VueEditor } from "vue2-editor";
export default {
    data() {
        return {}
    },
    components: {
        VueEditor
    },
    computed: mapState(["blog"]),
    // methods: {
    //     post: function () {
    //         this.$http.post('https://khoatd-2f63c-default-rtdb.asia-southeast1.firebasedatabase.app/testdb.json', this.blogs).then(function(data){
    //             console.log(data)
    //         })
    //     }
    // },
    // computed: {
       
    // }
    methods: mapActions(['upPost'])
}
</script>

<style>

</style>