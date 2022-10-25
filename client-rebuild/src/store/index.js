import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';

import auth from '@/store/modules/auth';
import createPost from '@/store/modules/createPost';
import comment from '@/store/modules/comment';
import pagy from '@/store/modules/pagy';
Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    currentUser: {
      name: '',
      token: null,
    },
  },
  getters: {},
  mutations: {},
  actions: {},
  modules: {
    auth,
    createPost,
    comment,
    pagy,
  },
  plugins: [createPersistedState()],
});
