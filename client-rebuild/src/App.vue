<template>
  <div id="app">
    <HeaderView></HeaderView>
    <Transition name="viewfade">
      <router-view></router-view>
    </Transition>
    <FooterView></FooterView>
  </div>
</template>

<script>
import HeaderView from './components/HeaderView.vue';
import FooterView from './components/FooterView.vue';

export default {
  components: {
    HeaderView,
    FooterView,
  },
};
</script>

<style>
@import url('@/assets/css/style.css');
@import url('@/assets/css/mobile.css');
@import url('@/assets/css/notifBox.css');
@import url('@/assets/css/boxchat.css');
</style>
