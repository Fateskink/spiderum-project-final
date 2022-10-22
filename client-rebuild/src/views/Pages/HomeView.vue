<template>
  <div>
    <TopBanner></TopBanner>
    <top-10-month></top-10-month>
    <home-content-wrapper></home-content-wrapper>
  </div>
</template>

<script>
import TopBanner from '@/components/TopBanner.vue';
import Top10Month from '@/components/HomePage/Top10Month.vue';
import HomeContentWrapper from '@/components/HomePage/HomeContentWrapper.vue';
export default {
  components: { TopBanner, Top10Month, HomeContentWrapper },
};
</script>

<style>
</style>