<template>
  <div id="video-page">

    <h1>{{ currentVideo.title || 'Very Creative Title (not set)' }}</h1>

    <div class="video-wrapper">
      <HoneystreamVideo :videoId=currentVideo.id embedded=false />

      <div class="video-sidebar">
        <div>
          <h3>Uploaded by</h3>

          <div class="uploader">
            <div class="uploader-photo" />
            <div class="uploader-details">
              <a href="#">Parov Stelar</a><br/>
              <small>October 27th, 2018</small>
            </div>
          </div>

          <h4>Description</h4>
          <p class="video-description" v-html="currentVideo.description" />

          <EmbedCode :videoId=currentVideo.id />
        </div>
      </div>
    </div>

    <div id="video-related">
      <OtherVideos />
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import OtherVideos from '@/components/OtherVideos.vue';
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';
import Footer from '@/components/Footer.vue';
import EmbedCode from '@/components/EmbedCode';

export default {
  components: {
    OtherVideos,
    HoneystreamVideo,
    Footer,
    EmbedCode,
  },
  name: 'Video',
  props: {
    videoId: String,
    title: String,
  },
  watch: {
    // whenever video changes, this function will run
    videoId(newId, oldId) {
      this.getOne(this.videoId);
    },
  },
  mounted() {
    this.getOne(this.videoId);
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
    }),
  },
  methods: {
    ...mapActions('videos', ['getOne']),
  },
};
</script>

<style>
.video-description a {
  color: #eaad4d !important;
  text-decoration: none !important;
  transition: color .2s;
}
.video-description a:hover {
  color: #efca60 !important;
}
</style>

<style scoped lang="scss">
#video-page {
  padding: 20px 30px 20px 20px;

  h1 {
    margin: 0 0 10px;
    padding: 0;
  }

  .video-wrapper {
    display: flex;

    .video-sidebar {
      flex: 1;
      background: #f8f8f8;
      padding: 20px;

      h3 {
        margin-top: 0;
      }

      h4 {
        margin-bottom: 0;
      }

      .uploader {
        display: flex;
        align-items: center;

        a {
          color: #4a4a4a;
          text-decoration: none;
          font-weight: bold;
          transition: color .2s;

          &:hover {
            color: #efa348;
          }
        }

        .uploader-photo {
          display: inline-block;
          width: 50px;
          height: 50px;
          border-radius: 100%;
          margin-right: 10px;
          background: silver center center no-repeat url('http://electroniccolorado.com/wp-content/uploads/2016/04/parov.jpg');
          background-size: cover;
        }

        .uploader-details {
          flex-direction: column;
        }
      }

      .video-description {
        line-height: 1.7em;
      }
    }
  }

  #video-related {
    h2 {
      margin-bottom: 10px;
    }

    .other-videos {
      display: flex;
      flex-direction: row;
      justify-content: space-between;
    }

    .other-video {
      width: 32%;

      .video-thumbnail {
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;
        width: 100%;
        padding-bottom: 50%;
      }

      img {
        width: 100%;
      }

      h4 {
        margin: 10px 0 5px;
        padding: 0;
      }

      div {
        font-size: 14px;
      }
    }
  }
}
</style>
