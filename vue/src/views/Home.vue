<template>
  <div class="home container">
    <h1 class="welcome">Welcome to Next Brew Columbus</h1>
    <p>
      Thank you for visiting us today! We are excited to welcome you to our page
      and facilitate your search for the best breweries around town. Googling can 
      be a hassle and time consuming when you want to make quick plans to get a drink. 
      We have collected the best of the best of breweries in and around Columbus, Ohio 
      and hope you enjoy visiting the facilities we know and love!
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
}

</style>
