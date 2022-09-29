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
    }
  },
  actions: {
    async signIn({state, commit}) {
      try {
        await axios.post('/api/v1/user1/login',{
          email: state.currentUser.email,
          password: state.currentUser.password
        }).then (
          (response) => {
            // localStorage.setItem("accessToken", response.data.token);
            console.log(response.data.token),
            // state.currentUser.token = response.data.token
            commit("setToken", response.data.token);
            state.currentUser.email='',
            state.currentUser.password=''
          }
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
