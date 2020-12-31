<template>
  <div id="app">
    <!-- <p>{{ message }}</p> -->
    <ShortUrl></ShortUrl>
  </div>
</template>

<script>
import ShortUrl from './components/short_url'
export default {
  components: {
    ShortUrl
  },
  data: function () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
