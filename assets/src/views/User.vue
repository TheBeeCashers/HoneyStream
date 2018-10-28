<template>
  <div id="user">
    <Header />

    <div class="user-wrapper">
      <h1>Settings</h1>
      
      <div v-id="uuid">
        <label>Unique ID:</label>
        {{uuid}}
      </div>

      <div v-id="user.name">
        <label>Name:</label>
        <input type="text" :value="user.name" />
      </div>

      <div v-id="user.id">
        <label>Money Button UID:</label>
        <input type="number" :value="user.id" />
      </div>

      <div v-id="user.wid">
        <label>Money Button Wallet ID:</label>
        <input type="number" :value="user.wid" />
        <label class="radio-label"><input type="radio" name="default" /> Default Payment Method</label>
      </div>
      
      <div>
        <label>Bitcoin Cash Address:</label>
        <input type="text" value="bitcoincash:qp8w68rkl9cj6tpzhwljk58mruy2lwu3lqas5zuu9m" />
        <label class="radio-label"><input type="radio" name="default" checked /> Default Payment Method</label>
      </div>

      <div class="buttons">
        <input type="button" value="Save Changes" class="save-button" />
        <input type="button" value="Cancel" class="cancel-button" @click="cancel" />
      </div>
    </div>

    <Footer />
  </div>
</template>

<script>
import { MoneyButtonClient } from '@moneybutton/client';
import Header from '@/components/Header.vue';
import Footer from '@/components/Footer.vue';
import { router } from '../router';

export default {
  components: {
    Header,
    Footer,
  },
  name: 'user',
  props: {},
  data() {
    const hsUser = localStorage.getItem('hs-user');
    const parsedUser = hsUser && JSON.parse(hsUser) || {};
    return {
      uuid: localStorage.getItem('hs-uuid') || 'anon',
      user: parsedUser
    };
  },
  mounted() {},
  computed: {},
  methods: {
    cancel(e) {
      e.preventDefault()
      router.push('/')
    },
  },
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

    label {
      display: block;
      font-weight: bold;
      margin: 15px 0 10px;

      &.radio-label {
        display: inline-block;
        margin: 0 0 0 10px;
      }
    }
    
    input, textarea {
      padding: 10px 15px;
      font-size: 14px;
      width: 370px;
      border: solid 1px #e8e8e8;
      outline: 0;

      &[type=number] {
        width: 60px;
      }

      &[type=radio] {
        width: auto;
      }
    }

    .buttons {
      margin-top: 20px;

      .save-button, .cancel-button {
        border-radius: 4px;
        border: solid 1px #e67e22;
        background-color: #e67e22;
        padding: 10px 20px;
        transition: background .2s;
        width: auto;

        &:hover {
          background-color: #d35400;
          border-color: #d35400;
          cursor: pointer;
        }
      }

      .save-button {
        color: white;
      }

      .cancel-button {
        background-color: white;
        border: solid 1px #ddd;
        margin-left: 10px;

        &:hover {
          background-color: #fafafa;
          border-color: #ccc;
          cursor: pointer;
        }
      }
    }
  }
}
</style>