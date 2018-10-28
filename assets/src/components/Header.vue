<template>
  <div id="header">
    <div class="search-box">
      <input type="text" class="search-field" placeholder="Search..." />
    </div>

    <div class="icons">
      <router-link to="/upload" v-if="userName">Upload</router-link>
      <span ref="userData" class="userName" v-if="userName">{{userName}}</span>
      <Login />
    </div>
  </div>
</template>

<script>
import fetch from 'isomorphic-fetch'
import Login from './Login'

export default {
  name: 'header',
  components: {
    Login,
  },
  data() {
    const hsUser = localStorage.getItem('hs-user');
    const parsedUser = hsUser && JSON.parse(hsUser) || {};
    return {
      userName: parsedUser.name || ''
    }
  },
  async mounted() {
    const token = localStorage.getItem('mb_js_client:oauth_access_token');
    const hsUser = localStorage.getItem('hs-user');
    if (token) {
      const res = await fetch('https://www.moneybutton.com/api/v1/auth/user_identity', {
        method: 'get',
        headers: {
          'Accept': 'application/vnd.api+json',
          'Content-Type': 'application/vnd.api+json',
          'Authorization': 'Bearer ' + token,
        }
      })
      if (res.status >= 200 || res.status < 300) {
        if (!hsUser) {
          const user = await res.json();
          const id = user.data.attributes.id;
          const name = user.data.attributes.name;
          localStorage.setItem('hs-user', '{ "id": "' + id + '", "name": "' + name + '" }')
          this.userName = name
        }
      }
      else {
        localStorage.removeItem('hs-user');
        localStorage.removeItem('mb_js_client:oauth_access_token');
        localStorage.removeItem('mb_js_client:oauth_expiration_time');
        localStorage.removeItem('mb_js_client:oauth_redirect_uri');
        localStorage.removeItem('mb_js_client:oauth_refresh_token');
        localStorage.removeItem('mb_js_client:oauth_state');
        this.$cookie.delete('mbuid');
        window.location.reload();
      }
    }
  },
}
</script>

<style scoped lang="scss">
#header {
  padding: 10px 30px 10px 20px;
  border-bottom: solid 1px #ececec;
  display: flex;
  flex-direction: row;
  align-items: center;

  .search-box {
    flex: 1;
    text-align: center;

    .search-field {
      padding: 10px;
      width: 200px;
      transition: width 0.2s;
      outline: none;
      border-radius: 4px;
      border: solid 1px #ececec;

      &:focus {
        width: 300px;
        border-color: #ddd;
      }
    }
  }

  .icons {
    a {
      color: #efa348;
      text-decoration: none;
      font-weight: bold;
      transition: .2s;

      &:hover {
        color: #efca60;
      }
    }

    .userName {
      display: inline-block;
      margin-left: 20px;
      font-weight: bold;
      color: #4a4a4a;
    }
  }
}
</style>