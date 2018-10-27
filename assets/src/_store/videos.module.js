import { videoService } from '../_services';

const state = {
  list: {},
  data: {},
};

const actions = {
  getAll({ commit }) {
    commit('getAllRequest');

    videoService.getAll()
      .then(
        videos => commit('getAllSuccess', videos),
        error => commit('getAllFailure', error),
      );
  },
  getOne({ commit }, {id}) {
    commit('getOneRequest', { id });

    videoService.getById(id)
      .then(
        video => commit('getOneSuccess', {id, video}),
        error => commit('getOneFailure', {id, error}),
      );
  },
};

const mutations = {
  getAllRequest(state) {
    state.list = { loading: true };
  },
  getAllSuccess(state, videos) {
    state.list = { items: videos.data };
  },
  getAllFailure(state, error) {
    state.list = { error };
  },
  getOneRequest(state, id) {
    state.data = { 
        ...state.data,
        id: { loading: true }
    };
  },
  getOneSuccess(state, {id, video}) {
    state.data = { 
      ...state.data,
      id: video
    };
  },
  getOneFailure(state, {id, error}) {
    state.data = { 
      ...state.data,
      id: error 
    };
  },
};

export const videos = {
  namespaced: true,
  state,
  actions,
  mutations,
};
