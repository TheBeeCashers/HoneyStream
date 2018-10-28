<template>
  <a href="#" @click="linkWithMoneyButton" v-if="!isLoggedIn" class="login-button">Log in with Money Button</a>
</template>

<script>
import { MoneyButtonClient } from '@moneybutton/client';
import Cookie from 'vue-cookie';
import Vue from 'vue';
import config from '../config';

Vue.use(Cookie);

export default {
  components: {},
  name: 'user',
  props: {},
  data() {
    return {}
    // return {
    //   isLoggedIn: false,
    // }
  },
  mounted() {
    this.moneyButtonClient = new MoneyButtonClient(
      '66095b051e6b3363242ee35756c7e866'
    );
    if (
      !this.isLoggedIn &&
      this.$route.query.code !== undefined &&
      this.$route.query.state !== undefined
    ) {
      this.authorize();
    }
  },
  computed: {
    isLoggedIn: function() {
      return !!this.$cookie.get('mbuid');
    }
  },
  methods: {
    linkWithMoneyButton(event) {
      event.preventDefault()
      this.moneyButtonClient.requestAuthorization(
        'auth.user_identity:read',
        config.apiUrl + '/'
      );
    },
    async authorize() {
      await this.moneyButtonClient.handleAuthorizationResponse();
      const { id: moneyButtonId } = await this.moneyButtonClient.getIdentity();
      this.$cookie.set('mbuid', moneyButtonId, 1);
      window.location.href = '/'; // TODO
    }
  }
};
</script>

<style scoped lang='scss'>
.login-button {
  display: inline-block;
  margin-left: 20px;
  font-weight: bold;
  color: #4a4a4a;
}
</style>