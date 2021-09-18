<template>
  <div class="row">
    <div class="col m10 offset-m1 s12">
      <h5 class="custom-grey-text page-title">Configure seu Portfolio</h5>
      <div class="card-panel">
        <form>
          <div class="row">
            <div class="input-field col l4 m6 s12">
              <input name="portfolio[slug]" v-model="portfolio.slug" @change="update()" />
              <input name="portfiolio[public_url]" :value="public_url" type="hidden" />
              <label class="active font_20 custom-grey-text text-darken-1">Slug <i class="fa fa-info-circle tooltipped" data-tooltip="Nome que vai aparecer na URL"></i></label>
            </div>
            <div class="col l2 m2 s12 slug-actions hide-on-small-and-down">
              <i class="far fa-copy element tooltipped" data-tooltip="Copiar para o Clipboard" @click="copyToClipboard()"></i>
              <a :href="`/portfolios/${ portfolio.id }`" data-tooltip="Visualizar" class="fa fa-external-link-square-alt element tooltipped"></a>
            </div>

            <div class="col offset-l2 l2 m2 s6 center">
              <label class="font_16 custom-grey-text text-darken-1">Ativo <i class="fa fa-info-circle tooltipped" data-position="bottom" data-tooltip="Pode ser encontrado pela URL"></i></label>
              <div class="switch">
                <label>
                  <input name="portfolio[active]" v-model="portfolio.active" type="checkbox" @change="update()" />
                  <span class="lever"></span>
                </label>
              </div>
            </div>

            <div class="col l2 m2 s6 center">
              <label class="font_16 custom-grey-text text-darken-1">Listado <i class="fa fa-info-circle tooltipped"data-tooltip="Aparece nas pesquisas por candidatos"></i></label>
              <div class="switch">
                <label>
                  <input name="portfolio[listed]" v-model="portfolio.listed" type="checkbox" @change="update()" />
                  <span class="lever"></span>
                </label>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col l4 m8 s8">
              <Tags :portfolio-id="portfolio.id" :portfolio-tags="portfolio.tags" />
            </div>
            <div class="input-field col l2 offset-m1 m4 offset-s4 s4">
              <label>
                <input name="portfolio[remote_ok]" v-model="portfolio.remote_ok" type="checkbox" class="filled-in" @change="update()" />
                <span>Atende a domicilio?</span>
              </label>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>


<script>

const url = new URL(document.location)

import Tags from './tags.vue'

export default {
  components: { Tags },

  data() {
    return {
      portfolio: {}
    }
  },

  created() {
    this.portfolio.id = $("#portfolio-edit").data("portfolio");
    this.$resource('/portfolios{/id}').get({ id: this.portfolio.id })
        .then(response => { this.portfolio = response.body.portfolio},
              response => { M.toast({ html: "Ocorreu um erro ao tentar carregar o Portfólio", classes: "red" })
        })
  },

  computed: {
    public_url: function(){
      let url_port = (url.port == "" ? "" : `:${url.port}`)
      return `${url.protocol}//${url.hostname}${url_port}/${this.portfolio.slug}`
    }
  },

  methods: {
    update() {
      this.$resource('/portfolios{/id}').update({ id: this.portfolio.id }, { portfolio: this.portfolio })
          .then({}, response => {
            this.portfolio = response.body.portfolio
            response.body.errors.forEach(error => { M.toast({ html: error, classes: "red" }) })
          })
    },

    copyToClipboard(){
      let url_element = document.createElement('textarea')
      url_element.value = this.public_url
      document.body.appendChild(url_element)
      url_element.select()
      document.execCommand("copy")
      document.body.removeChild(url_element)
    }
  }
}

</script>
