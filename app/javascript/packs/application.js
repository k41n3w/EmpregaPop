import Vue from 'vue'
import App from './app.vue'
import VueResource from 'vue-resource';
import TurbolinksAdapter from 'vue-turbolinks';
 
Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
 
document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '#portfolio-edit',
    render: h => h(App)
  })
})
