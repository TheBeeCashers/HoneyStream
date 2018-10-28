<template>
  <div id="embed">
    <HoneystreamVideo :videoId=videoId embedded=true />
  </div>
</template>

<script>

import HoneystreamVideo from '@/components/HoneystreamVideo.vue';

export default {
  name: 'embedded-video',
  components: {
    HoneystreamVideo,
  },
  data() {
    return {
      videoId: 1,
    };
  },
  created() {
    const last = window.location.pathname.split('/').slice(-1);
    this.videoId = parseInt(last, 10);
  },
};
</script>

<style lang="scss">

</style>
