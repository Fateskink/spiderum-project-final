<template>
  <div>
    <div v-for="comment in comment" :key="comment.id" class="comment-3rdlayout-wrapper">
      <div class="user-comment">
        <p class="username">
          {{ comment.user.name }}<span class="time-comment-cal"> {{ timeAgo(comment.created_at) }}</span>
        </p>
        <p class="comment-content">
          {{ comment.body }}
        </p>
        <div class="reply-box">
          <a class="reply-box-btn">Upvote</a>
          <a class="reply-box-btn">Downvote</a>
          <a class="reply-box-btn" @click="toggleComment(comment.id)">Trả lời</a><br />
          <div v-if="currentCommentId == comment.id">
            <textarea class="replybox" name="" id="" cols="30" rows="10" v-model="comment.currentComment"></textarea>
            <a class="reply-box-btn" @click="commentOnComment(comment.id, comment.currentComment)">Trả lời</a>
          </div>
        </div>
        <show-comment :comment="comment.comments" v-on="$listeners"></show-comment>
      </div>
    </div>
  </div>
</template>

<script>
import timeAgo from '@/function/timeAgo';
import axios from '@/axios/axios';
export default {
  props: ['comment'],
  data() {
    return {
      id: this.$route.params.id,
      currentCommentId: null,
    };
  },
  methods: {
    timeAgo,
    toggleComment(commentId) {
      // this.currentCommentId = this.currentCommentId == commentId ? null : commentId;
      if (this.currentCommentId == commentId) {
        this.currentCommentId = null;
      } else {
        this.currentCommentId = commentId;
      }
    },
    async commentOnComment(commentID, commentBody) {
      this.$emit('abc');
      console.log('abv');
      await axios.post(`/user1/comments/${commentID}/comments`, {
        body: commentBody,
      });
      this.currentCommentId = null;

      // this.getComments();
    },
    // getComments() {
    //   axios.get(`/user1/posts/${this.id}/comments`).then((res) => {
    //     console.log(res.data.comments);
    //     this.comments = res.data.comments;
    //   });
    // },
  },
};
</script>

<style>
</style>