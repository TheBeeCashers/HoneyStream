<template>
  <div id="video">
    <h1>{{ msg }}</h1>

    <div class="video-wrapper">
      <div class="video-container">
        <video 
          width="600" 
          height="400" 
          :controls="!previewEnded || purchased" 
          ref="player" 
          id="video"
          :class="{active: !player2Loaded, videoPlayer: true}"
          :src="videoUrl" type="video/webm">
          Your browser does not support the video tag.
        </video>
        <video
          width="400" 
          height="600" 
          :controls="!previewEnded || purchased" 
          ref="player2" 
          id="video2"
          :class="{active: player2Loaded, videoPlayer: true}"
          type="video/webm">
          Your browser does not support the video tag.
        </video>
        <div v-if="previewEnded && !purchased" class="paywall">
          <div>To continue watching swipe the Money Button...</div>
          <MoneyButton
            to="371"
            amount="0.5"
            currency="EUR"
            label="Send some loot"
            client-identifier="69404bf8c2d75d65dd416b377a87a1c9"
            button-id="1540631889774"
            @payment="handlePayment"
          />
        </div>      
      </div>

      <div class="video-sidebar">
        <div>
          <h3>Uploaded by</h3>

          <div class="uploader">
            <div class="uploader-photo" />
            <a href="#">Honey Streamer</a>
          </div>

          <ul>
            <li>Preview duration: {{previewDuration}}</li>
            <li>Current time {{currentTime}}</li>
          </ul>
        </div>
      </div>
    </div>

    <div id="video-related">
      <VideoSidebar v-bind:videos="videos" />
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import { mapState, mapActions } from 'vuex';
import MoneyButton from 'vue-money-button';
import VideoSidebar from '@/components/VideoSidebar.vue';

Vue.use(MoneyButton);

export default {
  components: {
    MoneyButton,
    VideoSidebar,
  },
  name: 'HoneystreamVideo',
  props: {
    msg: String,
  },
  data() {
    return {
      previewDuration: 5,
      isPreview: true,
      videoId: '1',
      currentTime: 0,
      previewEnded: false,
      purchased: false,
      player2Loaded: false,
      videoUrl: "http://localhost:4000/watch/" + 1,
    };
  },
  mounted() {
    this.$refs.player.ontimeupdate = this.checkPreviewEnded;
    this.$refs.player.onplay = this.onPlay;
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
      videos: state => state.videos.list,
    }),
  },
  methods: {
    onPlay(event) {
      if (this.previewEnded && !this.purchased) {
        event.preventDefault();
      }
    },
    checkPreviewEnded() {
      this.currentTime = this.$refs.player.currentTime;
      if (!this.purchased && (this.currentTime > this.previewDuration)) {
        this.$refs.player.pause();
        this.previewEnded = true;
      }
    },
    handleVideo2Loaded() {
      console.log("oncanplay")
      if (!this.player2Loaded) {
        this.$refs.player2.removeEventListener("canplay", this.handleVideo2Loaded);
        this.player2Loaded = true;
        this.$refs.player2.currentTime = this.$refs.player.currentTime;
        this.$refs.player2.play();
      }
    },
    handlePayment(payment) {
      console.log({payment})
      this.purchased = true;
      this.$refs.player2.src = "http://localhost:4000/watch/" + this.videoId + '/high';;
      this.$refs.player2.load();
      this.$refs.player2.addEventListener("canplay", this.handleVideo2Loaded);
    },
    ...mapActions('videos', ['postPayment', 'getAll']),
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
#video {
  padding: 20px;

  h1 {
    margin: 0 0 10px;
    padding: 0;
  }

  .video-wrapper {
    display: flex;

    .video-container {
      width: 600px;
      height: 400px;
      position: relative;

      .paywall {
        position: absolute;
        background-color: rgba(55, 56, 48, 0.8);
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        text-align: center;
      }
    }

    .video-sidebar {
      flex: 1;
      background: #f8f8f8;
      padding: 20px;
      
      h3 {
        margin-top: 0;
      }

      .uploader {
        display: flex;
        align-items: center;

        .uploader-photo {
          display: inline-block;
          width: 50px;
          height: 50px;
          border-radius: 100%;
          margin-right: 10px;
          background: silver;
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
