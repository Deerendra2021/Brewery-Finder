<template>
  <div class="home container">
    <h1 class="welcome">Welcome to Next Brew Columbus</h1>
    <p class="welcomeText">
      Thank you for visiting us today! 
      <br/>
      <br/>
      We are excited to welcome you to our page
      and facilitate your search for the best breweries around town. Googling
      can be a hassle and time consuming when you want to make quick plans to
      get a drink. We have collected the best of the best of breweries in and
      around Columbus, Ohio and hope you enjoy visiting the facilities we know
      and love! We want to make searching for that pub down the street or that 
      microbrewery everyone has been talking about easier than ever.
      <br/>
      <br/>
      ____________________
    </p>
    <h4>Why use Next Brew?</h4>
    <div class="quotes">
    <blockquote>
      <q><em>
          Next Brew helped me find a happy hour location in the matter of
          minutes! I normally spend a good chunk of time researching the best
          options on Google that appeal to everyone in my group. This made it so much
          easier!
      </em></q><br/>
      - Tweedle Dee
    </blockquote>
    <blockquote>
      <q><em>
          I love Next Brew! I have been going through and visiting the breweries on 
          their list and I love that I can go and check out the beer list online 
          to see if they offer the styles of beer that I like! It's so much easier to 
          navigate one website than Google searching for breweries near me and trying 
          to navigate every individual brewery's website for beer lists. Thank you for 
          making my life easy!
      </em></q><br/>
      - Tweedle Dum
    </blockquote>
    </div>
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
  min-height: 74vh;
  margin-top: 9vh;
}

.welcome {
  text-align: center;
  font-size: 60px;
  font-weight: bold;
}

.welcomeText {
  text-align: center;
  font-size: 18px;
}

.quotes {
  margin-left: 12vh;
  margin-right: 12vh;
  max-width: 1fr;
  text-align: center;
}

</style>
