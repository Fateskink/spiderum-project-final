<template>
  <div id="app">
    <app-header></app-header>
    <Transition name="viewfade">
      <router-view></router-view>
    </Transition>
    <app-footer></app-footer>
    <div class="bubble-chat" v-on:click="chat=!chat">Chat</div>
    <Transition name="boxchat-fade">
      <div class="boxchat" v-show="chat">
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
    <Transition name="boxchat-fade">
      <NotifView v-show="notification.status"></NotifView>
    </Transition>
  </div>
</template>

<script>
import { mapState } from 'vuex';
// import HeaderViewVue from "./components/HeaderView.vue";
import FooterViewVue from "./components/FooterView.vue";
import NotifView from "./components/NotifView.vue";

export default {
  components: {
    // 'app-header': HeaderViewVue,
    "app-footer": FooterViewVue,
    NotifView,
},
  data () {
    return {
      chat: false,
      notifStatus: false
    }
  },
  computed:{
    ...mapState(['notification'])
  }
}

</script>

<style>
@import url(@/assets/css/style.css);
@import url(@/assets/css/boxchat.css);
@import url(@/assets/css/notifBox.css);
@import url(@/assets/css/mobile.css);
</style>
