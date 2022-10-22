import axios from '@/axios/axios';
import { getField, updateField } from 'vuex-map-fields';

export default {
  namespaced: true,
  state() {
    return {
      currentUser: {},
      currentComment: '',
      id: '',
    };
  },
  getters: {
    getField,
  },
  mutations: {
    updateField,
    setComment(state, newCommnent) {
      state.currentComment = newCommnent;
    },
    setParamId(state, newId) {
      state.id = newId;
    },
    clearCurrentComment(state) {
      state.currentComment = '';
    },
  },
  actions: {
    async createComment({ state }) {
      await axios
        .post(`user1/posts/${state.id}/comments`, {
          body: state.currentComment,
        })
        .then((response) => console.log(response)),
        alert('Bình luận đã được đăng tải');
    },
  },
};
