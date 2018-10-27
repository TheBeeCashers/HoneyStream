import Vue from 'vue';
import Vuex from 'vuex';

import { alert } from './_store/alert.module';
import { account } from './_store/account.module';
import { users } from './_store/users.module';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    alert,
    account,
    users
  },
  state: {

  },
  mutations: {

  },
  actions: {

  },
});
