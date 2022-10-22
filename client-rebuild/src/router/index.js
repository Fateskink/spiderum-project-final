import Vue from 'vue';
import VueRouter from 'vue-router';

import UserProfile from '@/views/Pages/UserProfile';
import HomeView from '@/views/Pages/HomeView';
import ShowBlog from '@/views/Pages/ShowBlog';
import PostCategories from '@/views/Pages/PostCategories';
import CreatePost from '@/views/Pages/CreatePost';
import SignIn from '@/views/Pages/SignIn';
import Register from '@/views/Pages/CreateAccount';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'home',
    component: HomeView,
  },
  {
    path: '/userprofile',
    name: 'UserProfile',
    component: UserProfile,
  },
  {
    path: '/posts/:id',
    name: 'ShowBlog',
    component: ShowBlog,
  },
  {
    path: '/categories/:id',
    name: 'PostCatogories',
    component: PostCategories,
  },
  {
    path: '/createpost',
    name: 'CreatePost',
    component: CreatePost,
  },
  {
    path: '/signin',
    name: 'SignIn',
    component: SignIn,
  },
  {
    path: '/register',
    name: 'Register',
    component: Register,
  },
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
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
