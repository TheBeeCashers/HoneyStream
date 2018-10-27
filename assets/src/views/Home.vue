<template>
  <div class="home">
    <HoneystreamVideo msg="Welcome to Honeystream" />
    <div id="sidebar">
      <ul>
        <li v-for="video in videos">
          <VideoThumb v-bind="video" />
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';
import VideoThumb from '@/components/VideoThumb.vue';

export default {
  name: 'home',
  components: {
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
  .home {
    text-align: center;
  }
</style>
