<template>
  <div class="m-t-30 comment-box1 m-b-15">
    <div class="post-comment">
      <h3>Bình luận</h3>
      <textarea
        cols="30"
        rows="10"
        placeholder="Mời nhập bình lụân của bạn"
        v-model="currentComment"
        class="replybox"
      ></textarea>
      <button @click="createNewComment">Đăng bình luận</button>
    </div>
    <ShowComment :comment="comments" @abc="getComments()"></ShowComment>
    <!-- <div v-for="commentParent in comments" :key="commentParent.id" class="comment-1stlayout-wrapper">
      <div class="user-comment">
        <p class="username">
          {{ commentParent.user.name }} <span class="time-comment-cal">{{ timeAgo(commentParent.created_at) }}</span>
        </p>
        <p class="comment-content">
          {{ commentParent.body }}
        </p>
        <div class="reply-box">
          <a class="reply-box-btn">Upvote</a>
          <a class="reply-box-btn">Downvote</a>
          <a class="reply-box-btn" @click="toggleComment(commentParent.id)">Trả lời</a><br />
          <div v-if="currentCommentId == commentParent.id">
            <textarea
              class="replybox"
              name=""
              id=""
              cols="30"
              rows="10"
              v-model="commentParent.currentComment"
            ></textarea>
            <a class="reply-box-btn" @click="commentOnComment(commentParent.id, commentParent.currentComment)"
              >Trả lời</a
            >
          </div>
        </div>
        <div v-for="commentChild1 in commentParent.comments" :key="commentChild1.id" class="comment-2ndlayout-wrapper">
          <div class="user-comment">
            <p class="username">
              {{ commentChild1.user.name
              }}<span class="time-comment-cal"> {{ timeAgo(commentChild1.created_at) }}</span>
            </p>
            <p class="comment-content">
              {{ commentChild1.body }}
            </p>
            <div class="reply-box">
              <a class="reply-box-btn">Upvote</a>
              <a class="reply-box-btn">Downvote</a>
              <a class="reply-box-btn" @click="toggleComment(commentChild1.id)">Trả lời</a><br />
              <div v-if="currentCommentId == commentChild1.id">
                <textarea
                  class="replybox"
                  name=""
                  id=""
                  cols="30"
                  rows="10"
                  v-model="commentChild1.currentComment"
                ></textarea>
                <a class="reply-box-btn" @click="commentOnComment(commentChild1.id, commentChild1.currentComment)"
                  >Trả lời</a
                >
              </div>
            </div>
            <div
              v-for="commentChild2 in commentChild1.comments"
              :key="commentChild2.id"
              class="comment-3rdlayout-wrapper"
            >
              <div class="user-comment">
                <p class="username">
                  {{ commentChild2.user.name
                  }}<span class="time-comment-cal"> {{ timeAgo(commentChild2.created_at) }}</span>
                </p>
                <p class="comment-content">
                  {{ commentChild2.body }}
                </p>
                <div class="reply-box">
                  <a class="reply-box-btn">Upvote</a>
                  <a class="reply-box-btn">Downvote</a>
                  <a class="reply-box-btn" @click="toggleComment(commentChild2.id)">Trả lời</a><br />
                  <div v-if="currentCommentId == commentChild2.id">
                    <textarea
                      class="replybox"
                      name=""
                      id=""
                      cols="30"
                      rows="10"
                      v-model="commentChild2.currentComment"
                    ></textarea>
                    <a class="reply-box-btn" @click="commentOnComment(commentChild2.id, commentChild2.currentComment)"
                      >Trả lời</a
                    >
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div> -->
  </div>
</template>

<script>
import axios from '@/axios/axios';
import { createNamespacedHelpers } from 'vuex';
import ShowComment from '@/components/ShowPost/ShowComments.vue';
const { mapActions } = createNamespacedHelpers('comment');
export default {
  components: {
    ShowComment,
  },
  data() {
    return {
      comments: {},
      commentParent: {
        showing: false,
      },
      id: this.$route.params.id,
      post: {},
      currentComment: '',
    };
  },
  async created() {
    await this.getComments();
  },

  methods: {
    call() {
      console.log('jr');
    },
    toggleComment(commentId) {
      // this.currentCommentId = this.currentCommentId == commentId ? null : commentId;
      if (this.currentCommentId == commentId) {
        this.currentCommentId = null;
      } else {
        this.currentCommentId = commentId;
      }
    },
    async commentOnComment(commentID, commentBody) {
      await axios.post(`/user1/comments/${commentID}/comments`, {
        body: commentBody,
      });
      this.currentCommentId = null;
      this.getComments();
    },
    getComments() {
      axios.get(`/user1/posts/${this.id}/comments`).then((res) => {
        console.log(res.data.comments);
        this.comments = res.data.comments;
      });
    },
    ...mapActions(['createComment']),
    saveComment() {
      this.saveId();
      this.$store.commit('comment/setComment', this.currentComment);
    },
    createNewComment() {
      this.$store.commit('comment/setComment', this.currentComment);
      this.saveId();
      this.createComment();
      this.currentComment = null;
      this.getComments();
    },
    saveId() {
      //   console.log(this.id);
      this.$store.commit('comment/setParamId', this.id);
    },
  },
};
</script>

<style>
</style>