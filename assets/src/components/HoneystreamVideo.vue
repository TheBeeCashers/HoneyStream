<template>
  <div class="video-container">
    <ul v-if="0" class="video-specs">
      <li>Preview duration: {{previewDuration}}s</li>
      <li>Current time {{currentTime}}s</li>
      <li>hs_address: {{currentVideo.hs_address}}</li>
      <li>creator_address: {{currentVideo.creator_address}}</li>
      <li>paywall_type: {{currentVideo.paywall_type}}</li>
      <li>purchased: {{currentVideo.access}}</li>
    </ul>   

    <video 
      width="600" 
      height="400" 
      :controls="!previewEnded || purchased" 
      ref="player" 
      id="video"
      :class="{active: !player2Loaded, videoPlayer: true}"
      :src="videoUrl" type="video/webm"
      :autoplay="{autoplay: !embedded}">
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

    <div v-if="currentVideo.paywall_type === 'preview'" 
      :class="{ paywall: true, active: previewEnded && !purchased }">
      <div class="paywall-text">To continue watching swipe the Money Button.</div>
      <MoneyButton
        :outputs="outputs"
        ref="moneyButton"
        label="Send some loot"
        client-identifier="69404bf8c2d75d65dd416b377a87a1c9"
        button-id="1540631889774"
        @payment="handlePayment"
      />
    </div>

    <div v-if="currentVideo.paywall_type === 'quality'"
      :class="{ miniPaywall: true, active: !purchased && currentVideo.paywall_type === 'quality' }">
      <div class="paywall-text">Swipe the Money Button to watch in HQ.</div>
      <MoneyButton
        :outputs="outputs"
        ref="moneyButton"
        label="Send some loot"
        client-identifier="330853c971200ab083ed694b989f655f"
        button-id="1540631889774"
        :button-data="btnData"
        @payment="handlePayment"
      />
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import { mapState, mapActions } from "vuex";
import MoneyButton from "vue-money-button";
import config from "../config";

Vue.use(MoneyButton);

export default {
  components: {
    MoneyButton
  },
  name: "HoneystreamVideo",
  props: {
    videoId: Number,
    embedded: Boolean,
  },
  data() {
    return {
<<<<<<< HEAD
      previewDuration: 5,
=======
      previewDuration: 10,
>>>>>>> Standalone video page with autoplay.
      isPreview: true,
      currentTime: 0,
      previewEnded: false,
      player2Loaded: false
    };
  },
  mounted() {
    this.$refs.player.ontimeupdate = this.checkPreviewEnded;
    this.$refs.player.onplay = this.onPlay;
    this.getOne(this.videoId);
  },
  watch: {
    // whenever video changes, this function will run
    videoId: function(newId, oldId) {
      this.$refs.player.pause();
      this.previewEnded = false;
      this.$refs.player2.pause();
      this.$refs.player2.src = "";
      this.player2Loaded = false;
      this.getOne(this.newId);
    }
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
      purchased: state => state.videos.currentVideo.access
    }),
    videoUrl: function() {
      if (this.purchased || this.currentVideo.paywall_type === 'preview') {
        return config.apiUrl + "/watch/" + this.videoId + "/high";
      } 
      else {
        return config.apiUrl + "/watch/" + this.videoId;
      }
    },
    outputs: function() {
      return [
        {
          to: this.currentVideo.hs_address,
          amount: 0.01,
          currency: "USD"
        },
        {
          to: this.currentVideo.creator_address,
          amount: 0.02,
          currency: "USD"
        }
      ];
    },
    btnData: function() {
      return JSON.stringify({ video_id: this.videoId });
    }
  },
  methods: {
    onPlay(event) {
      if (this.previewEnded && !this.purchased) {
        event.preventDefault();
      }
    },
    checkPreviewEnded() {
      if (this.currentVideo.paywall_type === 'preview') {
        this.currentTime = this.$refs.player.currentTime;
        if (!this.purchased && (this.currentTime > this.previewDuration)) {
          this.$refs.player.pause();
          this.previewEnded = true;
        }
      }
    },
    handleVideo2Loaded() {
      if (!this.player2Loaded) {
        this.$refs.player2.removeEventListener(
          "canplay",
          this.handleVideo2Loaded
        );
        this.player2Loaded = true;

        // When the second player is loaded set the previously
        // market timestamp and continue playing.
        this.$refs.player2.currentTime = this.currentTime;
        this.$refs.player2.play();
      }
    },
    handlePayment(payment) {
      this.setPurchased(this.videoId);
      if (this.currentVideo.paywall_type === 'quality') {
        // Pause the first player and mark the timestamp.
        this.$refs.player.pause();
        this.currentTime = this.$refs.player.currentTime;

        // Load the new video in a new player and set-up an
        // event listener to check when the video is loaded.
        this.$refs.player2.src =
          config.apiUrl + "/watch/" + this.videoId + "/high";
        this.$refs.player2.load();
        this.$refs.player2.addEventListener("canplay", this.handleVideo2Loaded);
      }
      else {
        // Continue playing where we left.
        this.$refs.player.play();
      }
    },
    ...mapActions("videos", ["getOne", "setPurchased"])
  }
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
    background: rgba(0, 0, 0, 0.75);
    color: #fff;
    z-index: 2;
    width: 100%;
    box-sizing: border-box;
  }

  .video-js {
    width: 600px;
    height: 400px;
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
    z-index: 3;

    visibility: hidden;
    opacity: 0;
    transition: visibility 0s 0.75s, opacity 0.75s linear;

    &.active {
      visibility: visible;
      opacity: 1;
      transition: opacity 1s linear;
    }

    .paywall-text {
      margin-bottom: 15px;
      font-size: 16px;
      color: white;
      font-weight: bold;
    }
  }
}

.miniPaywall {
  position: absolute;
  background-color: rgba(55, 56, 48, 0.8);
  top: 0;
  left: 0;
  z-index: 3;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
  z-index: 3;

  visibility: hidden;
  opacity: 0;
  transition: visibility 0s 0.75s, opacity 0.75s linear;

  &.active {
    visibility: visible;
    opacity: 1;
    transition: opacity 1s linear;
  }

  .paywall-text {
    display: inline-block;
    font-size: 14px;
    color: white;
    font-weight: bold;
    padding-left: 5px;
    padding-right: 10px;
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
