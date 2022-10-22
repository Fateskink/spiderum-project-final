import Vue from 'vue';
import VueRouter from 'vue-router';
// import HomeView from '../views/HomeView.vue'
import LoginView from '@/views/LoginView.vue';
import DiscussView from '@/views/DiscussView';
import AddPostView from '@/views/AddPostView';
import showBlog from '@/views/showBlog';
import singleBlog from '@/views/singleBlog';
import NotFound from '@/components/NotFound';
import RegisterView from '@/views/RegisterView';
import UserProfile from '@/views/UserProfile';
import EditPost from '@/views/editPost';
import SciencePosts from '@/views/sciencePosts';
import InspirePosts from '@/views/inspirePosts';

Vue.use(VueRouter);

const routes = [
  // {
  //   path: '/',
  //   name: 'home',
  //   component: HomeView
  // },
  // {
  //   path: '/about',
  //   name: 'about',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/AboutView.vue')
  // }
  {
    path: '/login',
    name: '/login',
    component: LoginView,
  },
  {
    path: '/discuss',
    name: '/discuss',
    component: DiscussView,
  },
  {
    path: '/addpost',
    name: '/addpost',
    component: AddPostView,
  },
  {
    path: '/showblog',
    name: '/showblog',
    component: showBlog,
  },
  {
    path: '/showblog/singleBlog/:id',
    name: '/showblog/singleBlog',
    component: singleBlog,
  },
  {
    path: '/register',
    name: '/register',
    component: RegisterView,
  },
  {
    path: '/userprofile',
    name: '/userprofile',
    component: UserProfile,
  },
  {
    path: '/editpost/:id',
    name: '/editpost',
    component: EditPost,
  },
  {
    path: '/science',
    name: '/science',
    component: SciencePosts,
  },
  {
    path: '/inspire',
    name: '/inspire',
    component: InspirePosts,
  },
  {
    path: '/:catchAll(.*)',
    name: NotFound,
    component: NotFound,
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
