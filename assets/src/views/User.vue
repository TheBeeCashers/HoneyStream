<template>
  <div id="user">
    <Header />

    <div class="user-wrapper">
      <h1>Settings</h1>
      ID: {{uuid}}<br/>
      Money Button UID: <br/>
      Name: <br/>
    </div>
  </div>
</template>

<script>
import { MoneyButtonClient } from '@moneybutton/client';
import Header from '@/components/Header.vue';

export default {
  components: {
    Header,
  },
  name: 'user',
  props: {},
  data() {
    return {
      uuid: localStorage.getItem('hs-uuid') || 'anon'
    };
  },
  mounted() {},
  computed: {},
  methods: {}
};
</script>

<style scoped lang="scss">
#user {
  flex: 1;

  .user-wrapper {
    padding: 20px 30px 20px 20px;

    h1 {
      margin-top: 0;
    }
  }
}
</style>