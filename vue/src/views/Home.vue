<template>
  <div class="home container">
    <h1 class="welcome">Welcome to Next Brew Columbus</h1>
    <p>
      Thank you for visiting us today! We are excited to welcome you to our page
      and facilitate your search for the best breweries around town.
    </p>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style>
.home {
  display: flex;
  justify-content: Center;
  align-items: center;
  flex-direction: column;

  background-color: #222222a2;    
  max-height: 90%;

  row-gap: 40px;

  color: white;
  min-height: 50vh;
  margin-top: 10vh;

}

</style>
