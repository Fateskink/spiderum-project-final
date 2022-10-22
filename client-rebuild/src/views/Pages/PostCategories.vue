<template>
  <div class="content-fix">
    <follow-banner></follow-banner>
    <TopBanner></TopBanner>
    <div class="flex sp-between">
      <div>
        <random-post></random-post>
        <TopPostOption></TopPostOption>
        <pagination-bar></pagination-bar>
      </div>
      <div>
        <rules-view></rules-view>
        <top-author></top-author>
        <side-banner></side-banner>
      </div>
    </div>
  </div>
</template>

<script>
import FollowBanner from '@/components/PostViaCatagories/FollowBanner.vue';
import TopBanner from '@/components/TopBanner.vue';
import PaginationBar from '@/components/PaginationBar.vue';
import RandomPost from '@/components/PostViaCatagories/RandomPost.vue';
import TopPostOption from '@/components/HomePage/HomeContentWrapper/TopPostViaOption.vue';
import RulesView from '@/components/PostViaCatagories/RulesView.vue';
import SideBanner from '@/components/SideBanner.vue';
import TopAuthor from '@/components/HomePage/HomeContentWrapper/TopAuthor.vue';

export default {
  components: {
    FollowBanner,
    TopBanner,
    RandomPost,
    TopPostOption,
    RulesView,
    SideBanner,
    TopAuthor,
    PaginationBar,
  },
};
</script>

<style>
</style>