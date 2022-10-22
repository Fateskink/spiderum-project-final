<template>
  <div>
    <paginate
      :page-count="metaData.pages"
      :click-handler="functionName"
      :prev-text="'Prev'"
      :next-text="'Next'"
      :container-class="'className'"
    >
    </paginate>
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