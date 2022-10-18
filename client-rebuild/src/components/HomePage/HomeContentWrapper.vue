<template>
  <div class="flex m-t-15 content-fix">
    <top-post-option></top-post-option>
    <div>
      <top-author></top-author>
      <side-banner></side-banner>
    </div>
  </div>
</template>

<script>
import SideBanner from '../SideBanner.vue';
import TopAuthor from './HomeContentWrapper/TopAuthor.vue';
import TopPostOption from '@/components/PostViaCatagories/TopPostViaOption.vue';

export default {
  components: {
    TopAuthor,
    SideBanner,
    TopPostOption,
  },
};
</script>

<style>
</style>
