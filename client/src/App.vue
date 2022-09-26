<template>
  <div>
    <app-header></app-header>
    <router-view></router-view>
    <app-footer></app-footer>
    <div class="bubble-chat" v-on:click="chat=!chat">Chat</div>
    <Transition name="boxchat-fade">
      <div class="boxchat" v-if="chat">
        <div class="boxchat-header flex sp-between">
            <div class="boxchat-username">Khoa Tran</div>
            <img v-on:click="chat=!chat" src="@/assets/img/boxchat/icons8-xbox-x-30.png" alt="">
        </div>
        <div class="boxchat-output">
            
        </div>
        <div class="boxchat-input flex">
            <input type="text" placeholder="...">
            <img class="boxchat-send" src="@/assets/img/boxchat/icons8-email-send-48.png" alt="">
        </div>
      </div>
    </Transition>
  </div>
</template>

<script>
// import HeaderViewVue from "./components/HeaderView.vue";
import FooterViewVue from "./components/FooterView.vue";

export default {
  components: {
    // 'app-header': HeaderViewVue,
    'app-footer': FooterViewVue
  },
  data () {
    return {
      chat: false
    }
  },
}

</script>

<style>
@import url(@/assets/css/style.css);
@import url(@/assets/css/boxchat.css);
</style>
