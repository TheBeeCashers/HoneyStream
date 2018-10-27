<template>
  <div>
    <h2>Other Videos</h2>
    <ul v-if="videos.length">
      <li v-bind:key="video.id" v-for="video in videos">
        <VideoThumb v-bind="video" />
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  components: {
  },
  name: 'otherVideos',
  props: {
    videos: Object
  },
}
</script>

<style scoped lang="scss">

</style>