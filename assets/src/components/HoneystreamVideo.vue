<template>
  <div class="video-container">
    <ul class="video-specs">
      <li>Preview duration: {{previewDuration}}s</li>
      <li>Current time {{currentTime}}s</li>
      <li>hs_address: {{currentVideo.hs_address}}</li>
      <li>creator_address: {{currentVideo.creator_address}}</li>
    </ul>   

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
      width="600" 
      height="400" 
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
        :outputs="outputs"
        label="Send some loot"
        client-identifier="69404bf8c2d75d65dd416b377a87a1c9"
        button-id="1540631889774"
        @payment="handlePayment"
      />
    </div>
  </div>
</template>

<script>
import Vue from 'vue';
import { mapState, mapActions } from 'vuex';
import MoneyButton from 'vue-money-button';

Vue.use(MoneyButton);

export default {
  components: {
    MoneyButton,
  },
  name: 'HoneystreamVideo',
  props: {
    videoId: Number,
  },
  data() {
    return {
      previewDuration: 5,
      isPreview: true,
      currentTime: 0,
      previewEnded: false,
      purchased: false,
      player2Loaded: false,
      videoUrl: "http://localhost:4000/watch/" + this.videoId,
    };
  },
  mounted() {
    this.$refs.player.ontimeupdate = this.checkPreviewEnded;
    this.$refs.player.onplay = this.onPlay;
    this.getOne(this.videoId);
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
    }),
    outputs: function () {
      return [
        {
          to: this.currentVideo.hs_address,
          amount: 0.1,
          currency: "EUR",
        },
        {
          to: this.currentVideo.creator_address,
          amount: 0.2,
          currency: "EUR",
        }
      ];
    }
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
    ...mapActions('videos', ['getOne']),
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
.video-container {
  width: 600px;
  height: 400px;
  position: relative;

  .video-specs {
    position: absolute;
    list-style: none;
    margin: 0;
    padding: 10px 20px;
    background: rgba(255, 255, 255, 0.5);
    color: #4a4a4a;
    z-index: 2;
  }

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
</style>
