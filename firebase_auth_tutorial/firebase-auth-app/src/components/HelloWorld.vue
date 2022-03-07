<template>
  <div>
    <button @click="firebaseAuth">Google Sign In</button>
  </div>
</template>

<script>
import { auth, signInProvider } from '@/firebase/init.js'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  methods: {
    // Activate Firebase Auth
    firebaseAuth(){
      auth.signInWithPopup(signInProvider)
    },
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
