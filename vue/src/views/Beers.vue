<template>
  <div class="beers">
    <ul class="d-inline-flex">
            <beer-list-item 
                v-for="beer of beers"
                v-bind:key="beer.id"
                v-bind:beer="beer"
                />
    </ul>
  </div>
</template>

<script>
import BeerListItem from '../components/BeerListItem.vue';
import BeerService from '../services/BeerService';

export default {
    name: "beers",

    computed: {
        beers() {
            return this.$store.state.beers;
        }
    },

    components: {
        BeerListItem
    },

    created() {
        BeerService.getAllBeers()
        .then(response => {

        console.log(response);

        this.$store.commit('BEERS_LOADED', response.data);
      })
      .catch(error => {

        console.error("Could not load beer list", error.data);
      });  
    }

}
</script>

<style>

</style>