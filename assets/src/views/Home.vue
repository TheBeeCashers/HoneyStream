<template>
  <div id="home">
    <Header />

    <Video videoId=1 />
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import Video from '@/views/Video.vue';
import Header from '@/components/Header.vue';
import VideoThumb from '@/components/VideoThumb.vue';

const uuidv4 = require('uuid/v4');

if (!localStorage.getItem('hs-uuid')) {
  localStorage.setItem('hs-uuid', uuidv4())
}

export default {
  name: 'home',
  components: {
    Header,
    Video,
    VideoThumb,
  },
  computed: {
  },
  methods: {
  },
};
</script>

<style scoped lang="scss">
#home {
  flex: 1;
}
</style>