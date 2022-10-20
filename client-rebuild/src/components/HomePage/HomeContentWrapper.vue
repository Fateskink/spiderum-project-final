<template>
  <div class="flex m-t-15 content-fix">
    <new-feed></new-feed>
    <div>
      <top-author></top-author>
      <side-banner></side-banner>
    </div>
  </div>
</template>

<script>
import SideBanner from '../SideBanner.vue';
import TopAuthor from './HomeContentWrapper/TopAuthor.vue';
import NewFeed from './NewFeed.vue';

export default {
  components: {
    TopAuthor,
    SideBanner,
    NewFeed,
  },
};
</script>

<style>
</style>
