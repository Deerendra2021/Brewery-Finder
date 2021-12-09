<template>
  <div class="beers container">
    <table class="beerTable table-hover">
      <thead>
      <tr>
        <th>Beer Name</th>
        <th>ABV</th>
        <th>Beer Style</th>
        <th>Availability</th>
      </tr>
      </thead>
      <tbody>
      <tr v-for="beer in beers" v-bind:key="beer.id">
        <td>{{beer.name}}</td>
        <td>{{beer.abv}}</td>
        <td>{{beer.style}}</td>
        <td>{{beer.availability}}</td>
      </tr>
      </tbody>
    <beer-list-item />
    </table>
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