<!-- Main Application Template. 
     Note that you have classes from bootstrap available to you.
     See https://getbootstrap.com/docs/4.5/getting-started/introduction/ for reference on bootstrap -->
<template>
  <div id="app" class="main-image"> <!-- If you start to get random styling you don't like, remove container from this div -->
    <nav class="navbar navbar-inverse sticky-top bg-light">
      <router-link tag="a" class="navbar-brand"
            v-bind:to="{ name: 'home' }">
        <img src="./img/NextBrewLogoBlack.png" alt="Next Brew logo" width="120" height=auto>
      </router-link>
      <ul class="nav nav-pills">
        <li class="nav-item">
          <router-link tag="a" class="nav-link" 
            v-bind:class="{' active': $route.path == '/' }" 
            v-bind:to="{ name: 'home' }">
            Home</router-link>
        </li>
        <li class="nav-item">
            <router-link tag="a" class="nav-link"
            v-bind:class="{' active': $route.path == '/breweries' }" 
            v-bind:to="{ name: 'breweries' }">
            Breweries</router-link>
        </li>
        <li class="nav-item">
          <router-link tag="a" class="nav-link"
            v-bind:class="{' active': $route.path == '/beers' }" 
            v-bind:to="{ name: 'beers' }">
            Beers</router-link>
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
          v-if="!$store.state.token">Register</router-link>
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
          Logout
        </router-link>
      </div>  
    </nav>
    <router-view />
    <footer class="footerText">
      <small>
        By visiting this page, you agree that you are at least 21 years old and of legal drinking age. Please drink responsibly.
      </small>
    </footer>
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
    background: url('./img/beer-background.jpg') no-repeat center center fixed;
    background-size: cover;
}

#app {
  min-height: 100vh;
  font-family:-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
}

.footerText {
  height: 40px;
  padding-bottom: 10px;
  padding-left: 15px;
  text-align: center;
  color:#a55000a8;
}

</style>