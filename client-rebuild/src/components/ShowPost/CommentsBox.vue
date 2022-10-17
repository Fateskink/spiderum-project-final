<template>
  <div class="m-t-30 comment-box1 m-b-15 content-fix">
    <div v-for="commentParent in comments" :key="commentParent.id" class="comment-1stlayout-wrapper">
      <div class="user-comment">
        <p class="username">{{ commentParent.user.name }} <span class="time-comment-cal">4 hours ago</span></p>
        <p class="comment-content">
          {{ commentParent.body }}
        </p>
        <div class="reply-box">
          <a class="reply-box-btn">Upvote</a>
          <a class="reply-box-btn">Downvote</a>
          <a class="reply-box-btn">Trả lời</a><br />
          <!-- <textarea class="replybox" name="" id="" cols="30" rows="10"></textarea>
          <a class="reply-box-btn">Trả lời</a> -->
        </div>
        <div v-for="commentChild1 in commentParent.comments" :key="commentChild1.id" class="comment-2ndlayout-wrapper">
          <div class="user-comment">
            <p class="username">{{ commentChild1.user.name }}<span class="time-comment-cal">4 hours ago</span></p>
            <p class="comment-content">
              {{ commentChild1.body }}
            </p>
            <div
              v-for="commentChild2 in commentChild1.comments"
              :key="commentChild2.id"
              class="comment-3rdlayout-wrapper"
            >
              <div class="user-comment">
                <p class="username">{{ commentChild2.user.name }}<span class="time-comment-cal">4 hours ago</span></p>
                <p class="comment-content">
                  {{ commentChild2.body }}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<!-- <template>
  <div class="comment-box content-fix">
    <div v-for="commentParent in comments" :key="commentParent.id">
      <p>{{ commentParent.user.name }}: {{ commentParent.body }}</p>
      <div v-for="commentChild1 in commentParent.comments" :key="commentChild1.id">
        <p>--------{{ commentChild1.user.name }}: {{ commentChild1.body }}</p>
        <div v-for="commentChild2 in commentChild1.comments" :key="commentChild2.id">
          <p>--------------{{ commentChild2.user.name }}: {{ commentChild2.body }}</p>
        </div>
      </div>
    </div>
  </div>
</template> -->

<script>
import axios from '@/axios/axios';
export default {
  data() {
    return {
      comments: {},
    };
  },
  async created() {
    await axios.get('/user1/posts/1').then((res) => {
      console.log(res.data.comments);
      this.comments = res.data.comments;
    });
  },
};
</script>

<style>
</style>