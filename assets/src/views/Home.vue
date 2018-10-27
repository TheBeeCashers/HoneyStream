<template>
  <div class="home">
    <Dashboard msg="Welcome to Tabsplit"/>
  </div>
</template>

<script>
import Dashboard from '@/components/Dashboard.vue';

export default {
  name: 'home',
  components: {
    Dashboard,
  },
};
</script>
