<template>
  <div>
    <span class="title">{{title}}</span>
    <span class="title">Id: {{id}}</span>
  </div>
</template>

<script>
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
    
  },
};
</script>

<style scoped lang="scss">
</style>