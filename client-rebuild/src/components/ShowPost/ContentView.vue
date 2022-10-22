<template>
  <div class="content-fix m-t-15 single-blog">
    <h1 class="m-t-15">{{ post.title }}</h1>
    <article class="m-t-15" v-html="post.content"></article>
    <votes-box></votes-box>
  </div>
</template>

<script>
import VotesBox from '@/components/ShowPost/VotesBox.vue';
import axios from '@/axios/axios';
// const commentStore = createNamespacedHelpers('comment');

export default {
  components: { VotesBox },
  data() {
    return {
      post: {},
      id: this.$route.params.id,
      currentComment: '',
    };
  },
  async created() {
    await axios.get(`/user1/posts/${this.id}`).then((response) => (this.post = response.data));
  },

  methods: {},
  computed: {
    // ...mapState(['currentUser', 'currentComment']),
  },
};
</script>

<style scoped>
h1 {
  font-size: 42px;
  line-height: 58px;
  max-width: 680px;
  margin: 0 auto;
  text-align: center;
  padding: 30px 0;
}
</style>