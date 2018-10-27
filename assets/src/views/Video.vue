<template>
  <div id="video-page">
    <h1>{{ msg }}</h1>

    <div class="video-wrapper">
      <HoneystreamVideo />
        
      <div class="video-sidebar">
        <div>
          <h3>Uploaded by</h3>

          <div class="uploader">
            <div class="uploader-photo" />
            <div class="uploader-details">
              <a href="#">Honey Streamer</a><br/>
              <small>October 27th, 2018</small>
            </div>
          </div>

          <h4>Description</h4>
          
          <p>
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer a sem ac nunc volutpat rhoncus lacinia volutpat magna. Proin venenatis, purus id mollis molestie, ex arcu gravida lectus, vel bibendum leo nunc sit amet justo. Aliquam erat volutpat. Praesent dignissim, leo sit amet efficitur tempor, nisl sem dignissim justo, nec luctus justo odio a augue. Sed venenatis ligula nec faucibus feugiat. Fusce ornare convallis condimentum. 
          </p>
        </div>
      </div>
    </div>

    <div id="video-related">
      <OtherVideos v-bind:videos="videos" />
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import OtherVideos from '@/components/OtherVideos.vue';
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';

export default {
  components: {
    OtherVideos,
    HoneystreamVideo,
  },
  name: 'Video',
  props: {
    msg: String,
  },
  data() {
    return {
    };
  },
  mounted() {
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
      videos: state => state.videos.list,
    }),
  },
  methods: {
    ...mapActions('videos', ['getAll']),
  },
};
</script>

<style scoped lang="scss">
#video-page {
  padding: 20px;

  h1 {
    margin: 0 0 10px;
    padding: 0;
  }

  .video-wrapper {
    display: flex;

    .video-sidebar {
      flex: 1;
      background: #f8f8f8;
      padding: 20px;
      
      h3 {
        margin-top: 0;
      }

      h4 {
        margin-bottom: 0;
      }

      .uploader {
        display: flex;
        align-items: center;

        a {
          color: #4a4a4a;
          text-decoration: none;
          font-weight: bold;
          transition: color .2s;

          &:hover {
            color: #efa348;
          }
        }

        .uploader-photo {
          display: inline-block;
          width: 50px;
          height: 50px;
          border-radius: 100%;
          margin-right: 10px;
          background: silver center center no-repeat url('https://laughloveliveitall.files.wordpress.com/2014/07/happy-person.jpg');
          background-size: cover;
        }

        .uploader-details {
          flex-direction: column;
        }
      }
    }
  }

  .videoPlayer {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;

    opacity: 0;
    z-index: 0;

    &.active {
      z-index: 1;
      opacity: 1;
    }
  }
}

</style>