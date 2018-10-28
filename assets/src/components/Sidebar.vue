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
    </ul>
  </div>
</template>

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