<template>
  <div class="home">
    <HoneystreamVideo msg="Welcome to Honeystream" />
  </div>
</template>

<script>
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';

export default {
  name: 'home',
  components: {
    HoneystreamVideo,
  },
};
</script>

<style scoped lang="scss">
  .home {
    text-align: center;
  }
</style>
