import Vue from 'vue';
import Vuex from 'vuex';

import { alert } from './_store/alert.module';
import { videos } from './_store/videos.module';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    alert,
    videos,
  },
  state: {

  },
  mutations: {

  },
  actions: {

  },
});
