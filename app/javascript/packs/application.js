import Vue from 'vue'
import App from './app.vue'
import VueResource from 'vue-resource';
import TurbolinksAdapter from 'vue-turbolinks';
 
Vue.use(VueResource);
Vue.use(TurbolinksAdapter);
 
let meta_element = document.getElementsByName("csrf-token")[0]
Vue.http.headers.common['X-CSRF-Token'] = meta_element.getAttribute("content")
 
document.addEventListener('turbolinks:load', () => {
	if(document.getElementById("portfolio-edit")){
		const app = new Vue({
			el: '#portfolio-edit',
			render: h => h(App)
		})
	}
})
