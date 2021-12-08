<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app" class="main-image"> <!-- If you start to get random styling you don't like, remove container from this div -->
    <nav class="navbar navbar-inverse sticky-top bg-light">
      <a class="navbar-brand" href="" >
        <img src="./img/NextBrewLogoBlack.png" alt="Next Brew logo" width="120" height=auto>
      </a>
      <ul class="nav nav-pills">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item">
            <router-link tag="a" class="nav-link"
            v-bind:to="{ name: 'breweries' }">
            Breweries</router-link>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Beers</a>
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
    min-height: 100vh;
    background: url('./img/beer-background.jpg') no-repeat center center fixed;
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
}

#app {
  min-height: 100vh;
}

</style>