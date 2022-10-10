import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';
import HeaderView from '@/components/HeaderView';
import DiscussView from '@/components/DiscussView';
import NotifView from '@/components/NotifView';
import LoginView from '@/views/LoginView';
import VueResource from 'vue-resource';
import topAuthor from '@/components/topAuthor';
import '@/axios';

Vue.use(VueResource);

Vue.component('app-header', HeaderView);
Vue.component('app-discuss', DiscussView);
Vue.component('app-login', LoginView);
Vue.component('app-notif', NotifView);
Vue.component('app-topauthor', topAuthor);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
