import Vue from 'vue';
import Router from 'vue-router';
import Home from './views/Home.vue';
import CreateAccount from './views/CreateAccount.vue';
import LoginPage from './views/LoginPage.vue';

Vue.use(Router);

export const router = new Router({
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/user/new',
      name: 'Create account',
      component: CreateAccount,
    },
    {
      path: '/user/login',
      name: 'Login',
      component: LoginPage,
    },
  ],
});

router.beforeEach((to, from, next) => {
  // redirect to login page if not logged in and trying to access a restricted page
  const publicPages = ['/user/login', '/user/new'];
  const authRequired = !publicPages.includes(to.path);
  const loggedIn = localStorage.getItem('user');

  if (authRequired && !loggedIn) {
    return next('/user/login');
  }

  next();
})
