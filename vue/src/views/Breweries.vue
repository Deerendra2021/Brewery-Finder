<template>
 <div class="breweries">
    <ul>
            <brewery-list-item
                v-for="brewery of breweries"
                v-bind:key="brewery.brewery_id"
                v-bind:brewery="brewery"
                />
    </ul>

  </div>
</template>

<script>

import BreweryListItem from '../components/BreweryListItem';
import BreweryService from '../services/BreweryService';

export default {
  
  name: "breweries",

  computed: {
      breweries() {
          return this.$store.state.breweries;
      }
  },

  components: 
  {BreweryListItem},

    created(){
      BreweryService.getAllBreweries()
      .then(response => {

        console.log(response);

        this.$store.commit('BREWERIES_LOADED', response.data);
      })
      .catch(error => {

        console.error("Could not get all Breweries", error.data);
      });   
  }  
};
</script>

<style>

</style>