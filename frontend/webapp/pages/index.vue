<template>
  <div class="wrapper container">
    <h1>Hello VueJS</h1>
    <p>I'm a new member of Nuxt/Vue</p>
    <button type="button" class="btn btn-primary" @click="showMessage()">
      Click Me
    </button>
  </div>
</template>

<script>
export default {
  name: 'IndexPage',
  methods: {
    showMessage() {
      alert('clicked')
    },
  },
}
</script>

<style scoped>
</style>
