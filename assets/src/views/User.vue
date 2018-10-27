<template>
  <div>
    <h2>User</h2>
    ID: {{uuid}}
  </div>
</template>

<script>
const uuidv4 = require('uuid/v4')

export default {
  components: {
  },
  name: 'User',
  props: {
    msg: String,
  },
  data() {
    return {
      uuid: uuidv4(),
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

<!--
buttonData={JSON.stringify({
                  userId: user.id,
                  postId: post.id
                })}
                -->