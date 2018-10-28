<template>
  <div id="app">
    <Sidebar />
    <router-view />
  </div>
</template>

<script>
import Sidebar from '@/components/Sidebar.vue';

export default {
  name: 'app',
  components: {
    Sidebar,
  },
};
</script>

<style lang="scss">
html, body {
  margin: 0;
  padding: 0;
  height: 100vh;
  min-height: 100vh;
}

body {
  font-size: 14px;
  letter-spacing: .01em;
}

main {
  height: 100vh;
}

#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;

  display: flex;
  flex-direction: row;
  min-height: 100%;

  h1 {
    font-size: 2em;
  }

  h2 {
    font-size: 1.8em;
    margin-block-end: 17px;
  }
}
</style>
