<template>
  <div @click="loadVideo">
    <span class="title">{{title}}</span>
    <span class="title">Id: {{id}}</span>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';

export default {
  components: {
  },
  name: 'VideoThumb',
  props: {
    title: String,
    content_type: String,
    id: Number,
  },
  data() {
    return {
      
    };
  },
  mounted() {
  },
  computed: {
  },
  methods: {
    ...mapActions('videos', ['setCurrent']),
    loadVideo() {
      this.setCurrent(this.id);
    }
  },
};
</script>

<style scoped lang="scss">
</style>