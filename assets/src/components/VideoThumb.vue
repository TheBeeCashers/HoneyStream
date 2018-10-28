<template>
  <a href="#" class="other-video" @click="loadVideo">
    <div class="video-thumbnail" :style="{ backgroundImage: 'url('+thumbnailUrl+')' }" />
    <h4>{{title}}</h4>
    <div>By Parov Stelar</div>
  </a>
</template>

<script>
export default {
  name: 'VideoThumb',
  props: {
    title: String,
    id: Number,
    thumbnailUrl: String,
  },
  methods: {
    loadVideo(e) {
      e.preventDefault()
      this.$router.push('/video/' + this.id);
    }
  },
};
</script>

<style scoped lang="scss">
.other-video {
  width: 32%;
  color: #4a4a4a;
  text-decoration: none;
  
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
    filter: grayscale(75%);
    -webkit-transition: .2s -webkit-filter linear;
    -moz-transition: .2s -moz-filter linear;
    -moz-transition: .2s filter linear;
    -ms-transition: .2s -ms-filter linear;
    -o-transition: .2s -o-filter linear;
    transition: .2s filter linear, .2s -webkit-filter linear;
  }

  &:hover {
    .video-thumbnail {
      filter: grayscale(0%);
    }
  }
}
</style>