<template>
  <div>
    <h2>User</h2>
    ID: {{uuid}}
  </div>
</template>

<script>
import { MoneyButtonClient } from "@moneybutton/client";

export default {
  components: {},
  name: "user",
  props: {},
  data() {
    return {
      uuid: localStorage.getItem("hs-uuid") || "anon"
    };
  },
  mounted() {},
  computed: {},
  methods: {}
};
</script>

<style scoped lang="scss">
</style>