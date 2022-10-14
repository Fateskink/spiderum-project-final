import axios from '@/axios/axios';
import router from '@/router';

export default {
  namespaced: true,
  state() {
    return {
      currentUser: {},
      loginform: {
        email: '',
        password: '',
      },
      registerForm: {
        name: '',
        email: '',
        password: '',
        password_confirmation: '',
      },
    };
  },
  getters: {},
  mutations: {
    setUserToken(state, newToken) {
      state.currentUser.token = newToken;
    },
    setUserName(state, newName) {
      state.currentUser.name = newName;
    },
    clearUserInfo(state) {
      (state.currentUser.token = null), (state.currentUser.name = '');
    },
    clearUserRegisterInfo(state) {
      state.registerForm = {};
    },
  },
  actions: {
    async signIn({ state, commit }) {
      await axios
        .post('user1/login', {
          email: state.loginform.email,
          password: state.loginform.password,
        })
        .then((response) => {
          console.log(response);
          commit('setUserToken', response.data.token);
          commit('setUserName', response.data.user.name);
          alert('Đăng nhập thành công!');
          router.push('/');
        })
        .catch((error) => {
          console.log(error);
        });
    },

    signOut({ commit }) {
      commit('clearUserInfo');
      router.push('/');
    },

    async register({ state, commit }) {
      await axios
        .post('/user1/signup', {
          name: state.registerForm.name,
          email: state.registerForm.email,
          password: state.registerForm.password,
          password_confirmation: state.registerForm.password_confirmation,
        })
        .then((response) => {
          console.log(response);
          alert('Vui lòng kiểm tra email kích hoạt');
          commit('clearUserRegisterInfo');
        })
        .catch((error) => console.log(error));
    },
  },
  modules: {},
};
