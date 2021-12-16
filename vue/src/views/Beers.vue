<template>
  <div class="beers container">
    <table class="beerTable container table-hover">
      <thead>
      <tr class="tableHeading">
        <th>Beer Name</th>
        <th>Beer Style</th>
        <th>Availability</th>
        <th>ABV</th>
      </tr>
      </thead>
      <br />
      <tbody>
      <router-link tag="tr" v-for="beer in beers" v-bind:key="beer.id" v-bind:to="{name: 'BeerDetails', params: {id: beer.id}}">
        <td>{{beer.name}}</td>
        <td>{{beer.style}}</td>
        <td>{{beer.availability}}</td>
        <td>{{beer.abv}}</td>
      </router-link>
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

.beers {
  padding-top: 10vh;
}

.beerTable {
  background-color: #222222a2;
  text-align: center;
  table-layout: default;
  padding: 15px;
}

.tableHeading {
  font-size: 24px;
  color: #21646e;
  background-color: #ffecd1bb;
}

.table-hover tbody tr:hover td{
  background-color: #15616d8c;
}

</style>