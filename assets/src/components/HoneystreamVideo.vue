<template>
  <div>
    <h1>{{ msg }}</h1>
    <div>
      <ul>
        <li>Preview duration: {{previewDuration}}</li>
        <li>Current time {{currentTime}}</li>
      </ul>
    </div>
    <div class="video-container">
      <video width="800" height="600" :controls="!previewEnded" ref="player">
        <source :src="videoUrl" type="video/webm" />
        Your browser does not support the video tag.
      </video>
      <div v-if="previewEnded" class="paywall">
        <div>PAAY NOOOW!</div>
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
  </div>
</template>

<script>

import Vue from 'vue';
import MoneyButton from 'vue-money-button';

Vue.use(MoneyButton);

export default {
  components: {
    MoneyButton,
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
    };
  },
  mounted() {
    this.$refs.player.ontimeupdate = this.checkPreviewEnded;
    this.$refs.player.onplay = this.onPlay;
  },
  computed: {
    videoUrl: function () {
      if (!this.purchased) {
        return "http://localhost:4000/watch/" + this.videoId;
      }
      else {
        return "http://localhost:4000/watch/" + this.videoId + '/high';
      }
    }
  },
  methods: {
    onPlay(event) {
      if (this.previewEnded && !purchased) {
        event.preventDefault();
      }
    },
    checkPreviewEnded() {
      this.currentTime = this.$refs.player.currentTime;
      if (this.currentTime > this.previewDuration) {
        this.$refs.player.pause();
        this.previewEnded = true;
      }
    },
    handlePayment() {
      this.purchased = true;
      
      this.$refs.player.pause();
      const currTime = this.$refs.player.currentTime;

      this.$refs.player.load();
      this.$refs.player.currentTime = currTime;
      this.$refs.player.play();
    },
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}

.video-container {
  width: 800px;
  height: 600px;
  position: relative;

  .paywall {
    position: absolute;
    background-color: rgba(200, 232, 10, 0.8);
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

</style>
