<template>
  <div>
    <TopBanner></TopBanner>
    <content-view></content-view>
    <other-post></other-post>
    <CommentsBox></CommentsBox>
  </div>
</template>

<script>
import TopBanner from '@/components/TopBanner.vue';
import ContentView from '@/components/ShowPost/ContentView.vue';
import OtherPost from '@/components/ShowPost/OtherPost.vue';
import CommentsBox from '@/components/ShowPost/CommentsBox.vue';

export default {
  components: { TopBanner, ContentView, OtherPost, CommentsBox },
};
</script>

<style>
</style>