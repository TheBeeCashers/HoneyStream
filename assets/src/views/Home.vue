<template>
  <div id="home">
    <Header />
    <HoneystreamVideo msg="Welcome to Honeystream" />
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import Header from '@/components/Header.vue';
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';
import VideoThumb from '@/components/VideoThumb.vue';

const uuidv4 = require('uuid/v4');

if (!localStorage.getItem('hs-uuid')) {
  localStorage.setItem('hs-uuid', uuidv4())
}

export default {
  name: 'home',
  components: {
    Header,
    HoneystreamVideo,
    VideoThumb,
  },
  computed: {
    ...mapState({
      videos: state => state.videos.list,
    })
  },
  methods: {
    ...mapActions('videos', ['getAll']),
  },
  mounted() {
    // Load all videos initially.
    this.getAll();
  },
};
</script>

<style scoped lang="scss">
#home {
  flex: 1;
}
</style>