import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import vuetify from './plugins/vuetify'
import axios from 'axios'
import VueAxios from 'vue-axios'
import VueRouter from 'vue-router'
import User from './model/user';
import CKEditor from '@ckeditor/ckeditor5-vue2';
import vuetifyAudio  from "vuetify-audio";

Vue.config.productionTip = false
Vue.use(VueRouter)
Vue.use(VueAxios, axios)
Vue.use( CKEditor );
Vue.use(vuetifyAudio)


import VueGlobalVariable from "vue-global-var";

Vue.use(VueGlobalVariable, {
  globals: {
    $user: new User("user1")
  }
});
window.$ = window.jQuery = require('jquery');

export const eventBus = new Vue ({
  methods:{
    signedIn: function () {
      this.$root.$emit('signedIn')
      this.$emit('signedIn');
    }

  },

  store,

  data:function(){
    return {
      authenticated:false

    }
  }
})

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
