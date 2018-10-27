<template>
  <div>
    <h1>{{ msg }}</h1>
    <video width="800" height="600" controls id="player" ref="player">
      <source :src="videoId" type="video/webm">
      Your browser does not support the video tag.
    </video>
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
</template>

<script>

import Vue from 'vue'
import MoneyButton from 'vue-money-button'

Vue.use(MoneyButton)

export default {
  components: {
    MoneyButton
  },
  name: 'Dashboard',
  props: {
    msg: String,
  },
  data () {
    return {
      videoId: "videos/low.webm"
    }
  },
  created() {

  },
  methods: {
    handlePayment() {
      console.log("payment");
      this.$refs.player.pause();
      const currTime = this.$refs.player.currentTime;
      console.log(currTime);
      this.videoId = "videos/high.webm";
      this.$refs.player.load()
      this.$refs.player.currentTime = currTime;
      this.$refs.player.play()
    },
    onClick() {
      this.$refs.player.pause();
      const currTime = this.$refs.player.currentTime;
      console.log(currTime);
      this.videoId = "videos/high.webm";
      this.$refs.player.load()
      this.$refs.player.currentTime = currTime;
      this.$refs.player.play()
    }
  }
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
</style>
