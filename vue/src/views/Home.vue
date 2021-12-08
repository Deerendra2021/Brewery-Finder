<template>
  <div class="home">
<<<<<<< HEAD
    <h1>Welcome to Next Brew Columbus</h1>
    <p>Best brews in town.</p>
=======
    <p>EVENTUALLY THERE WILL BE CONTENT HERE</p>

    <ul>
      <brewery-list-item
        v-for="brewery of breweries"
        v-bind:key="brewery.brewery_id"
        v-bind:brewery="brewery"
        />
    </ul>

>>>>>>> 631b3d4e7416e630c3835ae919d78d54fb205e7b
  </div>
</template>

<script>
export default {
  
  name: "home",

};
</script>
<style>
  .home {
    min-height: 100vh;
    color: white;
  }
</style>
