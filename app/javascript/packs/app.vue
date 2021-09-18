<template>
  <div>
    <portfolio></portfolio>
    <block></block>
  </div>
</template>
 
<script>
  import Portfolio from './components/portfolio';
  import Block from './components/block';
 
  export default {
    data() {
      return { }
    },
    components: {
      Portfolio,
      Block
    }
  }
</script>
