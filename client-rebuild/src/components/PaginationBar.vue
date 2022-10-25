<template>
  <div class="d-flex justify-content-center">
    <ul v-if="meta.pages > 1" class="pagination">
      <li v-if="meta.page > 1" @click="goToPage(meta.page - 1)">&laquo;</li>
      <li v-else class="disabled">{{ meta.page }}</li>

      <!-- <li v-for="page in meta.pages" :class="{ active: currentPage == page }" @click="goToPage(page)">{{ page }}</li> -->

      <li v-if="meta.page < meta.pages" @click="goToPage(meta.page + 1)">&raquo;</li>
      <li v-else class="disabled">&raquo;</li>
    </ul>
  </div>
</template>
<script>
import axios from '@/axios/axios';
export default {
  data() {
    return {
      id: this.$route.params.id,
      metaData: {},
    };
  },
  methods: {
    functionName() {},
  },

  async created() {
    await axios.get(`/user1/tags/${this.id}`).then((res) => (this.metaData = res.data.meta));
  },
};
/* eslint-disable */
</script>

<style>
</style>