<template>
  <div>
    <h2>Other Videos</h2>

    <div v-bind:key="video.id" v-for="video in videos" class="other-videos">
      <VideoThumb v-bind="video" />
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import VideoThumb from '@/components/VideoThumb.vue';

export default {
  components: {
    VideoThumb,
  },
  name: 'otherVideos',
  props: {
    videos: Object,
  },
  computed: {
    ...mapState({
      videos: state => state.videos.list,
    }),
  },
  methods: {
    ...mapActions('videos', ['getAll']),
  },
  mounted() {
    // Load all videos initially.
    this.getAll();
  },
}
</script>

<style scoped lang="scss">
.other-videos {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
</style>