import axios from '@/axios/axios';

export default {
  namespaced: true,
  state() {
    return {
      currentUser: {},
      contentForm: {
        title: '',
        content: '',
        tagid: '',
      },
    };
  },
  getters: {},
  mutations: {},
  actions: {
    async createPost({ state }) {
      await axios
        .post('/user1/posts', {
          title: state.contentForm.title,
          content: state.contentForm.content,
          tag_id: state.contentForm.tagid,
        })
        .then((response) => console.log(response), (state.contentForm.title = ''), (state.contentForm.content = ''))
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
