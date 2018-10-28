<template>
  <div class="video-container">
    <!-- <video-player 
      class="video-player-box"
      ref="videoPlayer"
      height="400"
      width="600"
      :options="playerOptions"
      :playsinline="true"
      customEventName="customstatechangedeventname"
      @ready="playerReadied">
    </video-player> -->
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

    <div :class="{ paywall: true, active: previewEnded && !purchased }">
      <div class="paywall-text">To continue watching swipe the Money Button.</div>

      <!-- <input type="submit" @click="hidePaywall" value="hide this shit" /><br/> -->

      <MoneyButton
        :outputs="outputs"
        ref="moneyButton"
        label="Send some loot"
        client-identifier="69404bf8c2d75d65dd416b377a87a1c9"
        button-id="1540631889774"
        @payment="handlePayment"
      />
    </div>
  </div>
</template>

<script>
import Vue from "vue";
import { mapState, mapActions } from "vuex";
import MoneyButton from "vue-money-button";
import config from '../config';

Vue.use(MoneyButton);

export default {
  components: {
    MoneyButton
  },
  name: "HoneystreamVideo",
  props: {
    videoId: Number
  },
  data() {
    return {
      previewDuration: 15,
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
    // whenever question changes, this function will run
    videoId: function(newId, oldId) {
      this.$refs.player.pause();
      this.previewEnded = false;
      this.getOne(this.newId);
    }
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
      purchased: state => state.videos.currentVideo.access
    }),

    videoUrl: function() {
      if (this.purchased) {
        return config.apiUrl + "/watch/" + this.videoId + "/high";
      } else {
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
      if (!this.purchased && this.currentTime > this.previewDuration) {
        this.$refs.player.pause();
        this.previewEnded = true;

        // this.$refs.moneyButton.size.width
      }
    },
    handleVideo2Loaded() {
      if (!this.player2Loaded) {
        this.$refs.player2.removeEventListener(
          "canplay",
          this.handleVideo2Loaded
        );
        this.player2Loaded = true;
        this.$refs.player2.currentTime = this.$refs.player.currentTime;
        this.$refs.player2.play();
      }
    },
    handlePayment(payment) {
      this.setPurchased(this.videoId);
      setTimeout(() => {
        this.$refs.player2.src =
          config.apiUrl + "/watch/" + this.videoId + "/high";
        this.$refs.player2.load();
        this.$refs.player2.addEventListener("canplay", this.handleVideo2Loaded);
      });
    },
    hidePaywall(e) {
      e.preventDefault();
      this.setPurchased(this.videoId);
      setTimeout(() => {
        this.$refs.player2.src =
          config.apiUrl + "/watch/" + this.videoId + "/high";
        this.$refs.player2.load();
        this.$refs.player2.addEventListener("canplay", this.handleVideo2Loaded);
      });
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
