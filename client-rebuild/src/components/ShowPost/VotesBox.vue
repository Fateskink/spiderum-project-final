<template>
  <div class="votes-box">
    <a class="upvote-btn" @click="upvote()" :class="{ disabledup: vote.upvoted }"> &#9824;</a>
    <h4 class="m-15">Vote : {{ votes }}</h4>
    <a class="downvote-btn" @click="downvote()" :class="{ disableddown: vote.downvoted }"> &#9829;</a>
  </div>
</template>

<script>
import axios from '@/axios/axios';
export default {
  data() {
    return {
      vote: {
        upvoted: false,
        downvoted: false,
      },
      post: {},
      id: this.$route.params.id,
    };
  },
  methods: {
    upvote() {
      axios.post(`user1/posts/${this.id}/votes/upvote`);
      this.vote.upvoted = !this.vote.upvoted;
      this.vote.downvoted = false;
      console.log('upvote ' + this.vote.upvoted);
    },
    downvote() {
      axios.post(`user1/posts/${this.id}/votes/25`);
      axios.post(`user1/posts/${this.id}/votes/downvote`);
      this.vote.downvoted = !this.vote.downvoted;
      this.vote.upvoted = false;
      console.log('downvote ' + this.vote.downvoted);
    },
  },
  computed: {
    votes: function () {
      if (this.vote.upvoted) {
        return this.post.vote_sum + 1;
      } else if (this.vote.downvoted) {
        return this.post.vote_sum - 1;
      } else {
        return this.post.vote_sum;
      }
    },
  },
  async created() {
    await axios.get(`/user1/posts/${this.id}`).then((response) => (this.post = response.data));
  },
};
</script>

<style>
@import url('@/assets/css/votesBox.css');
</style>