<template>
  <div>
    Other Videos
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
  name: 'videoSidebar',
  props: {
    videos: Object
  },
}
</script>

<style scoped lang="scss">

</style>