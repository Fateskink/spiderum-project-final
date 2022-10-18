<template>
  <div class="content-fix">
    <follow-banner></follow-banner>
    <TopBanner></TopBanner>
    <div class="flex">
      <div>
        <random-post></random-post>
        <TopPostOption></TopPostOption>
      </div>
      <div>
        <rules-view></rules-view>
        <side-banner></side-banner>
      </div>
    </div>
  </div>
</template>

<script>
import FollowBanner from '@/components/PostViaCatagories/FollowBanner.vue';
import TopBanner from '@/components/TopBanner.vue';
import RandomPost from '@/components/PostViaCatagories/RandomPost.vue';
import TopPostOption from '@/components/HomePage/HomeContentWrapper/TopPostViaOption.vue';
import RulesView from '@/components/PostViaCatagories/RulesView.vue';
import SideBanner from '@/components/SideBanner.vue';

export default {
  components: {
    FollowBanner,
    TopBanner,
    RandomPost,
    TopPostOption,
    RulesView,
    SideBanner,
  },
};
</script>

<style>
</style>