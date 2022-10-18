import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

import HeaderView from '@/components/HeaderView.vue';
import FooterView from '@/components/FooterView.vue';
import SideBanner from '@/components/SideBanner.vue';
import TopBanner from '@/components/TopBanner.vue';
import TopTenMonth from '@/components/HomePage/Top10Month.vue';
import TopAuthor from '@/components/HomePage/HomeContentWrapper/TopAuthor.vue';
import TopPostOptions from '@/components/PostViaCatagories/TopPostViaOption.vue';
import FollowBanner from '@/components/PostViaCatagories/FollowBanner.vue';
import RandomPost from '@/components/PostViaCatagories/RandomPost.vue';
import RulesView from '@/components/PostViaCatagories/RulesView.vue';
import CommentsBox from '@/components/ShowPost/CommentsBox.vue';
import ContentView from '@/components/ShowPost/ContentView.vue';
import OtherPost from '@/components/ShowPost/OtherPost.vue';
import OwnerPost from '@/components/UserProfile/PostList/OwnerPost';
import SavedPost from '@/components/UserProfile/PostList/SavedPost.vue';
import BackGroundImg from '@/components/UserProfile/BackgroundUserImg.vue';
import InfoBox from '@/components/UserProfile/InfoBox.vue';
import UserPostRelevant from '@/components/UserProfile/UserPostsRelevant.vue';
import CreatePost from '@/components/CreatePost/ContentForm.vue';
import HomeContentWraper from '@/components/HomePage/HomeContentWrapper.vue';

Vue.config.productionTip = false;

Vue.component('header-view', HeaderView);
Vue.component('footer-view', FooterView);
Vue.component('side-banner', SideBanner);
Vue.component('top-banner', TopBanner);
Vue.component('content-wrapper', HomeContentWraper);
//HomePage
Vue.component('top-10-month', TopTenMonth);
Vue.component('top-author', TopAuthor);
Vue.component('top-post-option', TopPostOptions);
//PostCategories
Vue.component('follow-banner', FollowBanner);
Vue.component('random-post', RandomPost);
Vue.component('rule-view', RulesView);
//ShowPost
Vue.component('comments-box', CommentsBox);
Vue.component('content-view', ContentView);
Vue.component('other-post', OtherPost);
//UserProfile
Vue.component('owner-post', OwnerPost);
Vue.component('saved-post', SavedPost);
Vue.component('background-img', BackGroundImg);
Vue.component('info-box', InfoBox);
Vue.component('user-post-relevant', UserPostRelevant);
//CreatePost
Vue.component('create-post', CreatePost);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
