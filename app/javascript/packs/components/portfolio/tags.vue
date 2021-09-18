<template>
  <div class="row">
    <div class="input-field col s12">
      <input type="text" id="autocomplete-tags" class="autocomplete" @keydown.enter="addTag">
      <label for="autocomplete-tags">Procure uma Tag</label>
    </div>
    <div class="col s12">
      <div class="chip" v-for="tag in portfolioTags" v-bind:key="tag">
        {{ tag.title }}
        <i class="close material-icons" @click="removeTag(tag)">close</i>
      </div>
    </div>
  </div>
</template>
 
 
<script>
 
export default {
  props: ['portfolioId', 'portfolioTags'],
 
  data() {
    return {
      currentTag: "",
      tags: []
    }
  },
 
  created() {
  },
 
  mounted() {
    this.$resource('/tags').get()
        .then(response => { this.set_tags(response.body.tags) },
              response => { M.toast({ html: "Ocorreu um erro ao carregar as Tags do Portfólio", classes: "red" })
        })
  },
 
  computed: {
  },
 
  methods: {
    set_tags(tags){
      let autoCompleteTags = {}
      let elem = document.querySelectorAll('#autocomplete-tags')
      tags.forEach((tag) => { autoCompleteTags[tag.title] = null })
      this.tags = tags
      M.Autocomplete.init(elem, { data: autoCompleteTags });
    },
 
    addTag(event) {
      let tagToAdd = this.tags.find((tag) => { return tag.title == event.target.value })
      if(tagToAdd != "" && tagToAdd != null)
      {
        this.$resource('/portfolios{/portfolioId}/tags').save({ portfolioId: this.portfolioId }, { tag_id: tagToAdd.id })
            .then(
              response => {
                this.portfolioTags.push(tagToAdd)
                event.target.value = ""
              },
              response => { response.body.errors.forEach(error => { M.toast({ html: error, classes: "red" }) }) }
            )
      }
    },
 
    removeTag(tag){
      let indexToRemove = this.tags.indexOf(tag)
      this.$resource('/portfolios{/portfolioId}/tags{/tagId}').remove({ portfolioId: this.portfolioId, tagId: tag.id })
          .then(
            response => { this.portfolioTags.slice(indexToRemove, 1) },
            response => { response.body.errors.forEach(error => { M.toast({ html: error, classes: "red" }) }) }
          )
    }
  }
}
 
</script>
