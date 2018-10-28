<template>
  <div>

    <h2 v-if="category === 'newest'">
      Newest Videos
    </h2>
    <h2 v-else-if="category === 'recommended'">
      Recommended Videos
    </h2>
    <h2 v-else-if="category === 'viewed'">
      Most Viewed
    </h2>
    <h2 v-else>
      Other Videos
    </h2>

    <div class="other-videos">
      <VideoThumb v-for="video in videos" 
        :key="video.id" 
        v-bind:title="video.title"
        v-bind:id="video.id"
        v-bind:thumbnailUrl="video.thumbnail_url"
        />
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
    category: String,
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