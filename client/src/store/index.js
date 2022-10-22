import axios from 'axios';
import Vue from 'vue';
import Vuex from 'vuex';
import createPersistedState from 'vuex-persistedstate';
import router from '@/router';

Vue.use(Vuex);

import auth from '@/store/modules/auth.js';

// const dataState = createPersistedState({
//   paths: ['currentUser.token','currentUser.name']
// })

// function navigate (url) {
//   this.$router.push(url)
// }

export default new Vuex.Store({
  modules: {
    auth,
  },
  namespaced: true,
  state: {
    currentUser: {
      name: '',
      email: '',
      password: '',
      password_comfimation: '',
      token: null,
    },
    blog: {
      title: '',
      content: '',
      author: '',
      category: {},
      id: '',
      nametag: '',
    },
    notification: {
      status: false,
      notification_lists: [],
    },
  },
  getters: {},
  mutations: {},
  actions: {
    async upPost({ state }) {
      try {
        await axios
          .post(
            '/api/v1/user1/posts',
            {
              title: state.blog.title,
              content: state.blog.content,
              tag_id: state.blog.category,
            },
            {
              headers: {
                Authorization: `Bearer ${this.state.auth.currentUser.token}`,
              },
            },
          )
          .then(
            (response) => {
              console.log(response);
            },
            (state.blog.title = ''),
            (state.blog.content = ''),
            router.push('/showblog'),
          );
      } catch (error) {
        console.log(error);
      }
    },
    // async upPost({state}) {
    //   try {
    //     await axios.post('/api/v1/user1/posts', {
    //       title: state.blog.title,
    //       content: state.blog.content,
    //       tag_id: state.blog.category
    //       // tag_id: 1
    //     },{
    //       headers : {
    //         Authorization: `Bearer ${this.state.currentUser.token}`
    //       }
    //     }).then (
    //       (response) => {console.log(response)},
    //       state.blog.title = '',
    //       state.blog.content = '',
    //       router.push('/showblog')
    //     )
    //   } catch (error) {
    //     console.log(error)
    //   }
    // },
    async showBlog() {
      try {
        await axios
          .get('/api/v1/user1/posts', {
            headers: {
              Authorization: `Bearer ${this.state.currentUser.token}`,
            },
          })
          .then((response) => {
            console.log(response);
          });
      } catch (error) {
        console.log(error);
      }
    },
    // async signOut () {
    //   try {
    //     await axios.delete('')
    //   } catch (error) {
    //     console.log(error)
    //   }
    // }

    // singleBlog () {
    //   try {
    //     await axios.get('/api/v1/user1/posts/'+this.id)
    //   } catch (error) {
    //     console.log(error)
    //   }
    // }
  },
  plugins: [createPersistedState()],
  // plugins: [dataState],
});
