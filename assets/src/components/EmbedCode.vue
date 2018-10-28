
<template>
  <div>
    <!-- Trigger/Open The Modal -->
    <button ref="embedButton" @click="buttonClick" class="embed-button">Get Embed Code</button>

    <!-- The Modal -->
    <div class="modal" ref="embedModal" :style="{display: modalVisible ? 'block' : 'none'}">
      <!-- Modal content -->
      <div class="modal-content">
          Embed Video
          <span class="close" @click="closeClick">&times;</span>
          <textarea readonly @focus="selectAll">
<iframe width="560" height="315" src={{videoUrl}} frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
          </textarea>
      </div>
    </div>
  </div>
</template>

<script>
import config from '../config';

export default {
  name: 'embed-code',
  props: {
    videoId: Number,
  },
  mounted() {
    window.addEventListener('click', this.clickOutside);
  },
  beforeDestroy() {
    window.removeEventListener('click', this.clickOutside);
  },
  data() {
    return {
      modalVisible: false,
    };
  },
  computed: {
    videoUrl() {
      return `${config.apiUrl}/embed/${this.videoId}`;
    },
  },
  methods: {
    clickOutside(event) {
      if (event.target == this.$refs.embedModal) {
        this.modalVisible = false;
      }
    },
    buttonClick() {
      this.modalVisible = true;
    },
    closeClick() {
      this.modalVisible = false;
    },
    selectAll(event) {
      event.target.select();
    },
  },
};
</script>

<style scoped lang="scss">

.embed-button {
  border-radius: 4px;
  border: solid 1px #177E89;
  background-color: #177E89;
  padding: 10px 15px;
  transition: background .2s;
  width: auto;
  color: white;
  font-size: 14px;
  position: absolute;
  top: 20px;
  right: 20px;

  &:hover {
    background-color: #269aa7;
    border-color: #269aa7;
    cursor: pointer;
  }
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 100; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 15% auto; /* 15% from the top and centered */
  padding: 20px;
  border: 1px solid #888;
  width: 30em; /* Could be more or less, depending on screen size */

  textarea {
    width: 30em;
    height: 10em;
    font-size: 14px;
  }
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
</style>
