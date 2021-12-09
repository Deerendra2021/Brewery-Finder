<template>
    <div class="container brewery-details">
        <h1>{{brewery.name}}</h1>
        <h3>{{brewery.address1}} 
            <br>
        {{brewery.city}}, {{brewery.state}} {{brewery.zip}}
        <br>
        {{brewery.phone}}</h3>
        <h3>{{brewery.description}}</h3>
        <ul>
            <beer-list-item tag="span" class="d-flex flex-wrap"
                v-for="beer of beers"
                v-bind:key="beer.id"
                v-bind:beer="beer"
                />
    </ul>
    </div>
</template>
<script>
import BeerService from '../services/BeerService'
import BeerListItem from '../components/BeerListItem'

export default {
    data() {
        return {
            beers: []
        }
    },

    computed: {
        brewery() {
            return this.$store.state.breweries.find(b => b.id == parseInt(this.$route.params.id));
        },
    },

    components: {
        BeerListItem
    },

    created() {
        let breweryId = parseInt(this.$route.params.id);

        BeerService.getBeersByBrewery(breweryId)
            .then(response => {
                this.beers = response.data;
            })
            .catch(response => {
                console.error("Could not find beers", response);
                // this.$router.push({name: 'Home'});
            })
    }
}
</script>

<style>
div {
    color: white;
}

.brewery-details {
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

/* beer-list-item {
    display: inline;
} */
</style>