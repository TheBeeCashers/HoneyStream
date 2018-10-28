<template>
  <a class="other-video" @click="loadVideo">
    <div class="video-thumbnail" :style="{ backgroundImage: 'url('+thumbnailUrl+')' }" />
    <h4>{{title}}</h4>
    <div>By Parov Stelar</div>
  </a>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  name: 'VideoThumb',
  props: {
    title: String,
    id: Number,
    thumbnailUrl: String,
  },
  methods: {
    ...mapActions('videos', ['getOne', 'setCurrent']),
    loadVideo() {
      this.getOne(this.id);
    }
  },
};
</script>

<style scoped lang="scss">
.other-video {
  width: 32%;

  img {
    width: 100%;
  }

  h4 {
    margin: 10px 0 5px;
    padding: 0;
  }

  div {
    font-size: 14px;
  }

  .video-thumbnail {
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
    width: 100%;
    padding-bottom: 50%;
  }
}
</style>