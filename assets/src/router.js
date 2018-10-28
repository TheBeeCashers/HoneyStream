import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import User from './views/User.vue';
import Browse from './views/Browse.vue';
import Upload from './views/Upload.vue';

Vue.use(Router);

export const router = new Router({
  base: process.env.BASE_URL,
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'home',
      component: Browse,
    },
    {
      path: '/video/:video_id',
      name: 'video',
      component: Home,
      props: true,
    },
    {
      path: '/user',
      name: 'user',
      component: User,
    },
    {
      path: '/upload',
      name: 'upload',
      component: Upload,
    },
  ],
});
