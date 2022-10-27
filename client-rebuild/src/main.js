import Vue from 'vue';
import App from './App.vue';
import router from './router';
import store from './store';

import HeaderView from '@/components/HeaderView.vue';
import NotifView from '@/components/notificaton/NotifView';
import FooterView from '@/components/FooterView.vue';
import SideBanner from '@/components/SideBanner.vue';
import TopBanner from '@/components/TopBanner.vue';
import TopTenMonth from '@/components/HomePage/Top10Month.vue';
import NewFeed from '@/components/HomePage/NewFeed.vue';
import AllPost from '@/components/HomePage/AllPost.vue';
import TopAuthor from '@/components/HomePage/HomeContentWrapper/TopAuthor.vue';
import TopPostOptions from '@/components/HomePage/HomeContentWrapper/TopPostViaOption.vue';
import FollowBanner from '@/components/PostViaCatagories/FollowBanner.vue';
import RandomPost from '@/components/PostViaCatagories/RandomPost.vue';
import RulesView from '@/components/PostViaCatagories/RulesView.vue';
import VotesBox from '@/components/ShowPost/VotesBox.vue';
import CommentsBox from '@/components/ShowPost/CommentsBox.vue';
import ShowComments from '@/components/ShowPost/ShowComments.vue';
import ContentView from '@/components/ShowPost/ContentView.vue';
import OtherPost from '@/components/ShowPost/OtherPost.vue';
import OwnerPost from '@/components/UserProfile/PostList/OwnerPost';
import SavedPost from '@/components/UserProfile/PostList/SavedPost.vue';
import BackGroundImg from '@/components/UserProfile/BackgroundUserImg.vue';
import InfoBox from '@/components/UserProfile/InfoBox.vue';
import UserPostRelevant from '@/components/UserProfile/UserPostsRelevant.vue';
import CreatePost from '@/components/CreatePost/ContentForm.vue';
import HomeContentWraper from '@/components/HomePage/HomeContentWrapper.vue';
import PaginationBar from '@/components/PaginationBar.vue';
import Paginate from 'vuejs-paginate';
/* eslint-disable */
Vue.config.productionTip = false;
Vue.component('paginate', Paginate);
Vue.component('pagy-bar', PaginationBar);
Vue.component('header-view', HeaderView);
Vue.component('footer-view', FooterView);
Vue.component('side-banner', SideBanner);
Vue.component('top-banner', TopBanner);
Vue.component('content-wrapper', HomeContentWraper);
//HomePage
Vue.component('top-10-month', TopTenMonth);
Vue.component('new-feed', NewFeed);
Vue.component('all-post', AllPost);
Vue.component('top-author', TopAuthor);
Vue.component('top-post-option', TopPostOptions);
//PostCategories
Vue.component('follow-banner', FollowBanner);
Vue.component('random-post', RandomPost);
Vue.component('rule-view', RulesView);
//ShowPost
Vue.component('comments-box', CommentsBox);
Vue.component('votes-box', VotesBox);
Vue.component('content-view', ContentView);
Vue.component('other-post', OtherPost);
Vue.component('show-comment', ShowComments);
//UserProfile
Vue.component('owner-post', OwnerPost);
Vue.component('saved-post', SavedPost);
Vue.component('background-img', BackGroundImg);
Vue.component('info-box', InfoBox);
Vue.component('user-post-relevant', UserPostRelevant);
//CreatePost
Vue.component('create-post', CreatePost);
//Notif
Vue.component('notif-view', NotifView);

new Vue({
  router,
  store,
  render: (h) => h(App),
}).$mount('#app');
