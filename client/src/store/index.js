import axios from 'axios'
import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate';

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    currentUser: {
      name: '',
      email:'',
      password: '',
      password_comfimation:'',
      token: null
    },
    blog : {
      title: '',
      content: '',
      author:'',
      categories: ''
    }
  },
  getters: {

  },
  mutations: {
    setToken(state, newToken){
      state.currentUser.token = newToken
    },
    signOut(state) {
      state.currentUser.token = null;
    },
    
  },
  actions: {
    async signIn({state, commit}) {
      // const self = this
      try {
        await axios.post('/api/v1/user1/login',{
          email: state.currentUser.email,
          password: state.currentUser.password
        }).then (
          (response) => {
            // localStorage.setItem("accessToken", response.data.token);
            console.log(response),
            // state.currentUser.token = response.data.token
            commit("setToken", response.data.token);
            state.currentUser.email='',
            state.currentUser.password=''
            // self.$router.push('/discuss')
            alert('Dang nhap thanh cong')
          }
        )
      } catch (error) {
        console.log(error)
      }
    },

    async upPost({state}) {
      try {
        await axios.post('/api/v1/user1/posts', {
          title: state.blog.title,
          content: state.blog.content,
          id: 1
        }).then (
          (response) => {console.log(response)}
        )
      } catch (error) {
        console.log(error)
      }
    },
    async showBlog () {
      try {
        await axios.get('/api/v1/user1/posts',{

        }).then (
          (response) => {console.log(response)}
        ) 
      } catch (error) {
        console.log(error)
      }
    }
  
  },
  plugins: [createPersistedState()],
  modules: {
  }
})
