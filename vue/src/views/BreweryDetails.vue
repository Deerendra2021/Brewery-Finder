<template>
    <div class="brewery-details">
        <h1>{{brewery.name}}</h1>
    </div>
</template>

<script>
import BreweryService from '../services/BreweryService'

export default {
    data() {
        return {
            brewery: undefined
        }
     },
        
    created() {
        let breweryId = parseInt(this.$route.params.id);

        BreweryService.getBreweryById(breweryId)
            .then(response => {
                this.brewery = response.data;
            })
            .catch(response => {
                console.error("Could not find brewery", response);
                this.$router.push({name: 'Home'});
            })
    }
}
</script>

<style>

</style>