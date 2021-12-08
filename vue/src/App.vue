<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app" class="main-image"> <!-- If you start to get random styling you don't like, remove container from this div -->
    <nav class="navbar navbar-inverse sticky-top bg-light">
      <a class="navbar-brand" href="" >
        <img src="./img/logo.png" alt="Next Brew logo" width="120" height=auto>
      </a>
      <ul class="nav nav-pills">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Breweries</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Beers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Map</a>
        </li>
      </ul>
      <div id="nav">
        <!--<router-link class="nav-item" v-bind:to="{ name: 'home' }">
          <i class="fas fa-home"></i> This is a font awesome icon
          Home 
        </router-link>-->
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'register' }"
          v-if="!$store.state.token">&nbsp;|&nbsp;Register</router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'login' }"
          v-if="!$store.state.token">
          &nbsp;|&nbsp;Login
        </router-link>
        <router-link
          class="nav-item"
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token">
          &nbsp;|&nbsp;Logout
        </router-link>
      </div>  
    </nav>
    <router-view />
  </div>
</template>

<script>
export default {
  
}
</script>

<!-- Application-Wide Styles go here. 
     Any valid CSS or SCSS is allowable here. See https://sass-lang.com/documentation/style-rules for info on SCSS -->
<style lang="scss">

@import './styles/colors.scss';

// Import the bootstrap styles. If you want to override Bootstrap colors, it needs to happen above this line
@import '../node_modules/bootstrap/scss/bootstrap';

// Your custom styles go below this point

.main-image {
    height: 100%;
    width: 100%;
    background-image: url('./img/beer-background.jpg');
    background-size: cover;
    background-attachment: fixed;
}

</style>