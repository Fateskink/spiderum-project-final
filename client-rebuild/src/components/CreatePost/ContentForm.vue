<template>
  <body class="content-fix m-t-15">
    <form class="flex flex-col flex-gaps-30" @submit.prevent="createPost">
      <h2>Tạo bài viết của bạn</h2>
      <input type="text" placeholder="Tiêu đề bài viết" v-model="contentForm.title" />
      <VueEditor v-model="contentForm.content" useCustomImageHandler @image-added="uploadImage" />
      <div class="flex sp-between">
        <div class="flex flex-col">
          <label for="carte">Thể loại</label>
          <select v-model="contentForm.tagid">
            <option :value="index + 1" v-for="(category, index) in categories" :key="category + index">
              {{ category }}
            </option>
          </select>
        </div>
      </div>
      <div>
        <input class="btn-lightblue" type="submit" value="Gửi bài viết" />
        <button class="btn-gray">Lưu bài viết</button>
      </div>
    </form>
  </body>
</template>

<script>
// import axios from '@/axios/axios';
import uploadImage from '@/function/uploadImage';
import { VueEditor } from 'vue2-editor';
import { createNamespacedHelpers } from 'vuex';
const { mapState, mapActions } = createNamespacedHelpers('createPost');
export default {
  components: {
    VueEditor,
  },
  data() {
    return {
      categories: [
        'Truyền cảm hứng',
        'Quan điểm - tranh luận',
        'Khoa học',
        'Thể thao',
        'Sáng tạo nội dung',
        'Phim',
        'Âm nhạc',
        'English Zone',
        'Skill',
      ],
    };
  },
  computed: {
    ...mapState(['currentUser', 'contentForm']),
  },
  methods: {
    ...mapActions(['createPost']),
    uploadImage,
  },
};
</script>

<style>
</style>