<template>
  <div id="browse">
    <Header />

    <div class="browse-wrapper">
      <OtherVideos category="newest" />
      <OtherVideos category="recommended" />
      <OtherVideos category="viewed" />
    </div>
  </div>
</template>

<script>
import OtherVideos from '@/components/OtherVideos.vue';
import Header from '@/components/Header.vue';

export default {
  components: {
    OtherVideos,
    Header,
  },
  name: 'browse',
  props: {
  },
  data() {
    return {
    }
  },
  mounted() {
  },
  computed: {
  },
  methods: {
  },
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