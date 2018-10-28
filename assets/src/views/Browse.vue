<template>
  <div id="browse">
    <Header />

    <div class="browse-wrapper">
      <OtherVideos category="newest" />
      <OtherVideos category="recommended" />
      <OtherVideos category="viewed" />
    </div>

    <Footer />
  </div>
</template>

<script>
import { mapState, mapActions } from "vuex";
import OtherVideos from '@/components/OtherVideos.vue';
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';

export default {
  components: {
    OtherVideos,
    Header,
    Footer,
  },
  name: 'browse',
  computed: {
    ...mapState({
      videos: state => state.videos.list
    })
  },
  methods: {
    ...mapActions("videos", ["getAll"])
  },
  mounted() {
    // Load all videos initially.
    this.getAll();
  }
};
</script>

<style scoped lang="scss">
#browse {
  flex: 1;

  .browse-wrapper {
    padding: 0 30px 20px 20px;
  }
}
</style>