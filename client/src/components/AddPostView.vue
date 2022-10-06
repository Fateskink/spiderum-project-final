<template>
  <body class="content-fix m-t-15">
    <form class="flex flex-col flex-gaps-30" @submit.prevent="upPost">
        <h2>Tạo bài viết của bạn</h2>
        <input type="text" placeholder="Tiêu đề bài viết" v-model="blog.title">
        <!-- <button v-on:click="addPara">Add Para</button> -->
        <VueEditor v-model="blog.content"/>
        <input type="file" name="img" id="img">
        <div class="flex sp-between">
            <div>
                <label for="userName">Tên tác giả: </label>   
                <input type="text" name="" id="userName" v-model="blog.author">
            </div>
            <div class="flex flex-col">
                <!-- <label for="">Chọn chuyên mục: </label>
                <div><label for="">Quan điểm - Tranh luận</label><input type="checkbox" value="Quan điểm - Tranh luận" v-model="blog.categories"></div>
                <div><label for="">Truyền cảm hứng</label><input type="checkbox" value="Truyền cảm hứng" v-model="blog.categories"></div>
                <div><label for="">Khoa học công nghệ</label><input type="checkbox" value="Khoa học công nghệ" v-model="blog.categories"></div>
                <div><label for="">Thể thao</label><input type="checkbox" value="Thể thao" v-model="blog.categories"></div>
                <div><label for="">Game</label><input type="checkbox" value="Game" v-model="blog.categories"></div> -->
                <label for="carte">The loai</label>
                <select v-model="blog.category">
                    <option v-for="category in categories" :key="category">{{category}}</option>
                </select>
            </div>
        </div>
        <input type="submit" value="UpPost">
    </form>
</body>
</template>

<script>
import { mapActions, mapState } from 'vuex'
import { VueEditor } from "vue2-editor";
export default {
    data() {
        return {
            categories:['Truyền cảm hứng','Quan điểm - tranh luận','Khoa học','Thể Thao','Sáng tạo nội dung','Phim','Âm nhạc','English Zone','Skill'],
        }
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