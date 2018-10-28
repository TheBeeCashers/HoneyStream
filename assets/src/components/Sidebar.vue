<template>
  <div id="sidebar">
    <div class="logo">
      <img src="https://www.svgrepo.com/show/11281/honey.svg" />
    </div>

    <ul class="main-menu">
      <li><router-link to="/">Home</router-link></li>
      <li><router-link to="/browse">Browse</router-link></li>
      <li class="separator" />
      <li><router-link to="/library">Your Videos</router-link></li>
      <li><router-link to="/purchases">Your Purchases</router-link></li>
      <li><router-link to="/user">Settings</router-link></li>
      <li v-if="!isLoggedIn"><a @click="linkWithMoneyButton">Log in with Money Button</a></li>
    </ul>
  </div>
</template>

<script>
import { MoneyButtonClient } from "@moneybutton/client";
import Cookie from "vue-cookie";
import Vue from "vue";
import config from '../config';

Vue.use(Cookie);

export default {
  components: {},
  name: "user",
  props: {},
  data() {},
  mounted() {
    this.moneyButtonClient = new MoneyButtonClient(
      "66095b051e6b3363242ee35756c7e866"
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
      return !!this.$cookie.get("mbuid");
    }
  },
  methods: {
    linkWithMoneyButton(event) {
      this.moneyButtonClient.requestAuthorization(
        "auth.user_identity:read",
        config.apiUrl + "/"
      );
    },
    async authorize() {
      await this.moneyButtonClient.handleAuthorizationResponse();
      const { id: moneyButtonId } = await this.moneyButtonClient.getIdentity();
      this.$cookie.set("mbuid", moneyButtonId, 1);
      window.location.href = "/"; // TODO
    }
  }
};
</script>


<style scoped lang="scss">
#sidebar {
  background: #f8f8f8;
  width: 200px;

  .logo {
    text-align: center;
    margin: 20px 0 5px;

    img {
      height: 100px;
    }
  }

  .main-menu {
    margin: 0;
    padding: 0;

    li {
      padding: 10px 0;

      &.separator {
        height: 0;
        border-top: solid 1px #ececec;
        margin-top: 10px;
        padding-bottom: 2px;
      }

      a {
        display: block;
        padding: 0 20px;
        color: #4a4a4a;
        text-decoration: none;
        font-weight: bold;
        border-left: solid 4px #f8f8f8;
        transition: border-color 0.2s;

        &:hover {
          border-left: solid 4px #efca60;
        }

        &.router-link-exact-active {
          border-left: solid 4px #efa348;
        }
      }
    }
  }
}
</style>