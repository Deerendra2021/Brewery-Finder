<template>
<div class ="beer-details">

    <h1>{{beer.name}}</h1>
    <h2>{{beer.style}}</h2>

</div>
  
</template>

<script>

import BeerService from '../services/BeerService.js';

export default {

    data(){
        return {
            beer: undefined,
        }
    },

    methods: 
    {
        created(){
            
           let beerId = parseInt(this.$route.params.id);

           BeerService.getBeerById(beerId)
           .then(response => {

               console.log(response);

               this.beer = response.data;
           })

           .catch(error => {

               console.log("Fail to load Beer", error);

           });
   
        }

    },

}
</script>

<style>

</style>