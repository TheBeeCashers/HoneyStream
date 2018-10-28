<template>
  <div id="home">
    <Header />
    <Video :videoId="video_id" />
  </div>
</template>

<script>
import Video from "@/views/Video.vue";
import Header from "@/components/Header.vue";

const uuidv4 = require("uuid/v4");

if (!localStorage.getItem("hs-uuid")) {
  localStorage.setItem("hs-uuid", uuidv4());
}

export default {
  name: "home",
  props: ['video_id'], 
  components: {
    Header,
    Video,
  },
};
</script>

<style scoped lang="scss">
#home {
  flex: 1;
}
</style>