<template>
    <div v-if="brewery" class="container brewery-details">
        <h1>{{brewery.name}}</h1>
        <h3 class="text-center">{{brewery.address1}} 
            <br>
        {{brewery.city}}, {{brewery.state}} {{brewery.zip}}
        <br>
        {{brewery.phone}}</h3>

        <div class="mapGrid">
            <h3 class="text-center">{{brewery.description}}</h3>

            <iframe class="googleMap" width="600" height="450" style="border:0; border: 2px solid black;" loading="lazy" allowfullscreen 
            v-bind:src="`https://www.google.com/maps/embed/v1/place?q=${addressReturn}&key=${apiKey}`"></iframe>
        </div>

        <ul class="d-inline-flex">
            <beer-list-item class="beer-list"
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
            beers: [],
            apiKey: "AIzaSyA50vzmtIyrL1BsjoTQ1CBJWmdXWp9HuGU"
        }
    },

    computed: {
        brewery() {
            return this.$store.state.breweries.find(b => b.id == parseInt(this.$route.params.id));
        },
        addressReturn() {

            const addr = `${this.brewery.name}, ${this.brewery.address1}, ${this.brewery.city}, ${this.brewery.state} ${this.brewery.zip}`;

            return addr;
        }
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
                this.$router.push({name: 'Home'});
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

ul {
    flex-wrap: wrap;
    justify-content: space-around;
}

/* beer-list-item {
    display: inline;
} */

.mapGrid {
    display: grid;
    
    padding-left: 3vh;
    padding-right: 3vh;
    grid-template-columns: 1fr 1fr;
    column-gap: 50px;

    grid-template-areas: 
        "description map";

    align-items: center;    
}

.mapGrid > h3 {
    grid-area: description;
}

.mapGrid > iframe {
    grid-area: map;
    border-radius: 10px;
}

h1 {
    font-size: 42px;
    padding-top: 6vh;
}

</style>