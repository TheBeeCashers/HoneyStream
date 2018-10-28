import Vue from 'vue';
import App from './App.vue';
import Embed from './Embed.vue';
import { router } from './router';
import store from './store';

Vue.config.productionTip = false;

if (document.getElementById('app')) {
  new Vue({
    router,
    store,
    render: h => h(App),
  }).$mount('#app');
} else if (document.getElementById('embed')) {
  new Vue({
    store,
    render: h => h(Embed),
  }).$mount('#embed');
}
