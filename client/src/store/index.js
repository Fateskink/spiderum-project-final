import axios from 'axios'
import Vue from 'vue'
import Vuex from 'vuex'
import createPersistedState from 'vuex-persistedstate';
import router from "@/router"

Vue.use(Vuex)

// const dataState = createPersistedState({
//   paths: ['currentUser.token','currentUser.name']
// })

// function navigate (url) {
//   this.$router.push(url)
// }

export default new Vuex.Store({
  state: {
    currentUser: {
      name: '',
      email:'',
      password: '',
      password_comfimation:'',
      token: null,
      // remember_me: '1'
    },
    blog : {
      title: '',
      content: '',
      author:'',
      category:''
    },
    notification : {
      status : false
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
      router.push('/discuss')
    },
    
  },
  actions: {
    async signIn({state, commit}) {
      try {
        await axios.post('/api/v1/user1/login',{
          email: state.currentUser.email,
          password: state.currentUser.password,
          remember_me: 1
        }).then (
          (response) => {
            console.log(response),
            commit("setToken", response.data.token);
            state.currentUser.email='',
            state.currentUser.password='',
            state.currentUser.name = response.data.user.name
            alert('Dang nhap thanh cong')
            router.push('/discuss')
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
          tag_id: 1
        },{
          headers : {
            Authorization: `Bearer ${this.state.currentUser.token}`
          }
        }).then (
          (response) => {console.log(response)},
          state.blog.title = '',
          state.blog.content = ''
        )
      } catch (error) {
        console.log(error)
      }
    },
    async showBlog () {
      try {
        await axios.get('/api/v1/user1/posts',{
          headers: {
            Authorization: `Bearer${this.state.currentUser.token}`
          }
        }).then (
          (response) => {console.log(response)}
        ) 
      } catch (error) {
        console.log(error)
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
  modules: {
  }
})
