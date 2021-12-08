<template>
    <div class="brewery-details">
        <h1>{{brewery.name}}</h1>
        <h2>This is the brewery landing page</h2>
        <h3>{{this.$route.params.id}}</h3>
        <ul>
            <beer-list-item
                v-for="beer of beers"
                v-bind:key="beer.id"
                v-bind:beer="beer"
                />
    </ul>
    </div>
</template>

<script>
// import BeerService from '../services/BeerService'

export default {

    computed: {
        brewery() {
            return this.$store.state.breweries.find(b => b.id == parseInt(this.$route.params.id));
        },
        beers() {
            return this.$store.state.beers.filter(b => b.breweryId == parseInt(this.$route.params.id))
        }
    },
        
    // created() {
    //     let breweryId = parseInt(this.$route.params.id);

    //     BreweryService.getBeersByBrewery(breweryId)
    //         .then(response => {
    //             this.brewery = response.data;
    //         })
    //         .catch(response => {
    //             console.error("Could not find brewery", response);
    //             // this.$router.push({name: 'Home'});
    //         })
    // }
}
</script>

<style>
div {
    color: white;
}
</style>