import Vue from 'vue';
import App from './App.vue';
import Embed from './Embed.vue';
import { router } from './router';
import store from './store';

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');

new Vue({
  store,
  render: h => h(Embed),
}).$mount('#embed');