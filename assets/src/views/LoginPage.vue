<template>
    <div class="md-layout md-gutter md-layout-center">
        <form novalidate class="md-layout-item md-size-50 md-small-size-100" @submit.prevent="handleSubmit">
            <md-card class="">
                <md-card-header>
                    <div class="md-title">Login</div>
                </md-card-header>

                <md-card-content>
                    <div class="md-layout md-gutter">
                        <md-field>
                            <label>Username</label>
                            <md-input v-model="username"></md-input>
                            <div v-show="submitted && !username" class="invalid-feedback">Username is required</div>
                        </md-field>

                        <md-field>
                            <label>Password</label>
                            <md-input v-model="password"></md-input>
                            <div v-show="submitted && !password" class="invalid-feedback">Password is required</div>
                        </md-field>
                    </div>
                </md-card-content>

                <md-progress-bar md-mode="indeterminate" v-if="sending" />

                <md-card-actions>
                    <md-button type="submit" class="md-primary" :disabled="status.loggingIn">Login</md-button>
                    <router-link to="/user/new" class="btn btn-link">Register</router-link>
                </md-card-actions>
            </md-card>
            <md-snackbar :md-active.sync="userSaved">The user {{ lastUser }} was saved with success!</md-snackbar>
        </form>
    </div>
</template>

<script>
import Vue from 'vue'
import VueMaterial from 'vue-material'
import { mapState, mapActions } from 'vuex'
import { MdField, MdInput, MdButton } from 'vue-material/dist/components'

Vue.use(VueMaterial)

export default {
    data () {
        return {
            username: '',
            password: '',
            submitted: false
        }
    },
    computed: {
        ...mapState('account', ['status'])
    },
    created () {
        // reset login status
        this.logout();
    },
    methods: {
        ...mapActions('account', ['login', 'logout']),
        handleSubmit (e) {
            this.submitted = true;
            const { username, password } = this;
            if (username && password) {
                this.login({ username, password })
            }
        }
    }
};
</script>

<style lang="scss" scoped>
  .md-progress-bar {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
  }

  .md-layout {
      justify-content: center;
  }
</style>