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
    clearComment(state) {
      state.currentComment = '0';
    },
  },
  actions: {
    async createComment({ state, commit }) {
      await axios
        .post(`user1/posts/${state.id}/comments`, {
          body: state.currentComment,
        })
        .then((response) => console.log(response), commit('clearComment'));
      await axios.get(`/user1/posts/${state.id}`).then((res) => {
        console.log(res.data.comments);
        this.comments = res.data.comments;
      });
    },
  },
};
