<template>
  <div id="video-page">
    <h1>{{ currentVideo.title || 'No Title :(' }}</h1>

    <div class="video-wrapper">
      <HoneystreamVideo :videoId="videoId" />
        
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
          <p>{{currentVideo.description || 'No Description :(' }}</p>
        </div>
      </div>
    </div>

    <div id="video-related">
      <!-- <OtherVideos /> -->

      <h2>Other Videos</h2>

      <div class="other-videos">
        <div class="other-video">
          <div class="video-thumbnail" style="background-image: url('https://picsum.photos/300/150')" />
          <h4>Video Title</h4>
          <div>By Parov Stelar</div>
        </div>

        <div class="other-video">
          <div class="video-thumbnail" style="background-image: url('https://picsum.photos/300/150?random')" />
          <h4>Video Title</h4>
          <div>By Parov Stelar</div>
        </div>

        <div class="other-video">
          <div class="video-thumbnail" style="background-image: url('https://picsum.photos/300/150?random=1')" />
          <h4>Video Title</h4>
          <div>By Parov Stelar</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState, mapActions } from 'vuex';
import OtherVideos from '@/components/OtherVideos.vue';
import HoneystreamVideo from '@/components/HoneystreamVideo.vue';

export default {
  components: {
    OtherVideos,
    HoneystreamVideo,
  },
  name: 'Video',
  props: {
    videoId: Number,
    title: String,
  },
  data() {
    return {
    };
  },
  mounted() {
    this.getOne(this.videoId);
  },
  computed: {
    ...mapState({
      currentVideo: state => state.videos.currentVideo,
      videos: state => state.videos.list,
    }),
  },
  methods: {
    ...mapActions('videos', ['getAll', 'getOne']),
  },
};
</script>

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
          background: silver center center no-repeat url('https://laughloveliveitall.files.wordpress.com/2014/07/happy-person.jpg');
          background-size: cover;
        }

        .uploader-details {
          flex-direction: column;
        }
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