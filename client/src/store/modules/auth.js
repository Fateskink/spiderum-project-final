import axios from 'axios';
import router from '@/router';

export default {
  namespaced: true,
  state() {
    return {
      currentUser: {},
      notification: {},
    };
  },
  getters: {},
  mutations: {
    setToken(state, newToken) {
      state.currentUser.token = newToken;
    },
    clearDataAfterSignin(state, name) {
      (state.currentUser.email = ''), (state.currentUser.password = ''), (state.currentUser.name = name);
    },
    signOut(state) {
      state.currentUser.token = null;
      router.push('/discuss');
      state.notification.status = false;
    },
  },
  actions: {
    async signIn({ state, commit }) {
      try {
        await axios
          .post('/api/v1/user1/login', {
            email: state.currentUser.email,
            password: state.currentUser.password,
          })
          .then((response) => {
            console.log(response.data), commit('setToken', response.data.token);
            commit('clearDataAfterSignin', response.data.user.name);
            alert('Đăng nhập thành công');
            router.push('/discuss');
          });
      } catch (error) {
        console.log(error);
        alert('Vui lòng kiểm tra lại thông tin đăng nhập');
        return;
      }
    },
  },
};
