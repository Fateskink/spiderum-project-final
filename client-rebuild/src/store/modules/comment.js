import axios from '@/axios/axios';

export default {
  namespaced: true,
  state() {
    return {
      currentUser: {},
      currentComment: '',
      id: '',
    };
  },
  getters: {},
  mutations: {
    setComment(state, newCommnent) {
      state.currentComment = newCommnent;
    },
    setParamId(state, newId) {
      state.id = newId;
    },
  },
  actions: {
    async createComment({ state }) {
      await axios
        .post(`user1/posts/${state.id}/comments`, {
          body: state.currentComment,
        })
        .then((response) => console.log(response));
    },
  },
};
