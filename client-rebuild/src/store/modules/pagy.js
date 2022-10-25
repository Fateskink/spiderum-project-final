export default {
  namespaced: true,
  state() {
    return {
      metaPages: [],
      currentPage: 1,
    };
  },
  getters: {},
  mutations: {
    setPage(state, payload) {
      state.metaPages = payload;
    },
    nextPage(state) {
      state.currentPage++;
    },
    prevPage(state) {
      state.currentPage--;
    },
  },
  actions: {},
};
