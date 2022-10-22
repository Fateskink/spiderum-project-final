<template>
  <div class="flex m-t-15 content-fix">
    <new-feed v-if="currentUser.token != null"></new-feed>
    <all-post v-else></all-post>
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
import AllPost from './AllPost.vue';
import { createNamespacedHelpers } from 'vuex';
const { mapState } = createNamespacedHelpers('auth');
export default {
  components: {
    TopAuthor,
    SideBanner,
    NewFeed,
    AllPost,
  },
  data() {
    return {};
  },
  computed: {
    ...mapState(['currentUser']),
  },
};
</script>

<style>
</style>
