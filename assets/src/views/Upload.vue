<template>
  <div id="upload">
    <Header />

    <div class="upload-wrapper">
      <h1>Upload</h1>

      <form>
        <div>
          <label>Title</label>
          <input type="text" placeholder="Title" />
        </div>

        <div>
          <label>Description</label>
          <textarea placeholder="Description"></textarea>
        </div>

        <div>
          <label>Price (in US$)</label>
          <input type="number" placeholder="5" />
        </div>

        <div>
          <label>Video File</label>
          <file-pond
            name="video"
            ref="pond-video"
            label-idle="Drop file here..."
            accepted-file-types="video/*"
            server="/api"
            v-bind:files="myVideo"
            v-on:init="handleFilePondInit"
          />
        </div>

        <div>
          <label>Thumbnail</label>
          <file-pond
            name="thumb"
            ref="pond-thumb"
            label-idle="Drop file here..."
            accepted-file-types="image/*"
            server="/api"
            v-bind:files="myThumb"
            v-on:init="handleFilePondInit"
          />
        </div>

        <div class="buttons">
          <input type="button" value="Upload" class="upload-button" />
          <input type="button" value="Cancel" class="cancel-button" @click="cancel" />
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import Header from '@/components/Header.vue';
import vueFilePond from 'vue-filepond';
import FilePondPluginImagePreview from 'filepond-plugin-image-preview';
import { router } from '../router';
import 'filepond/dist/filepond.min.css';
import 'filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css';

const FilePond = vueFilePond(FilePondPluginImagePreview);

export default {
  components: {
    Header,
    FilePond,
  },
  data() {
    return { myVideo: [], myThumb: [] };
  },
  name: 'upload',
  props: {
  },
  mounted() {
  },
  computed: {
  },
  methods: {
    handleFilePondInit() {
      console.log('FilePond has initialized');
    },
    cancel(e) {
      e.preventDefault()
      router.push('/')
    },
  },
};
</script>

<style scoped lang="scss">
#upload {
  flex: 1;

  .upload-wrapper {
    padding: 20px 30px 20px 20px;

    h1 {
      margin-top: 0;
    }

    label {
      display: block;
      font-weight: bold;
      margin: 15px 0 10px;
    }

    input, textarea {
      padding: 10px 15px;
      font-size: 14px;
      width: 350px;
      border: solid 1px #e8e8e8;
      outline: 0;

      &[type=number] {
        width: 50px;
      }
    }

    textarea {
      height: 100px;
    }

    .filepond--wrapper {
      width: 385px;
    }

    .filepond--root {
      max-height: 20em;
    }

    .buttons {
      margin-top: 20px;

      .upload-button, .cancel-button {
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

      .upload-button {
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
