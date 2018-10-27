<template>
  <div class="other-video" @click="loadVideo">
    <div class="video-thumbnail" :style="{ backgroundImage: url(thumbnail_url) }" />
    <h4>{{title}}</h4>
    <div>By Parov Stelar</div>
  </div>
</template>

<script>
import { mapActions } from 'vuex';

export default {
  components: {
  },
  name: 'videoThumb',
  props: {
    title: String,
    content_type: String,
    id: Number,
    thumbnail_url: String,
  },
  data() {
    return {
      
    };
  },
  mounted() {
  },
  computed: {
  },
  methods: {
    ...mapActions('videos', ['setCurrent']),
    loadVideo() {
      this.setCurrent(this.id);
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