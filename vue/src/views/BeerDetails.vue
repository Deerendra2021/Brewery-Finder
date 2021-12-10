<template>
<div class ="beer-details container">

    <h1>{{beer.name}}</h1>
    <h2>{{beer.style}}</h2>
    <h2>{{beer.abv}}% ABV</h2>
    <h2>{{beer.availability}}</h2>
    <br />
    <p>____________________<p>
    <br />
    <h3>Beer Reviews</h3>
    <div class="list-group card-deck w-50" v-for="review in reviews" v-bind:key="review.id">
        <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
            <div class="d-flex w-100 justify-content-between">
                <h5 class="mb-1">{{review.name}}</h5>
                <small>{{review.rating}}/5</small>
            </div>
            <p class="mb-1">{{review.description}}</p>
        </a>
    </div>
    <form>
        <div class="form-group">
            <label for="reviewerName">Your Name: </label>
            <input type="text" class="form-control" id="reviewerName" name="reviewerName" placeholder="Your Name Here">
        </div>
        <div class="form-group">
            <label for="rating">Rate 1 through 5, 5 being the best and 1 being the worst: </label>
            <select class="form-control" id="rating">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <div class="form-group">
            <label for="reviewDescription">Add a written review: </label>
            <textarea class="form-control" id="reviewDescription" rows="4" placeholder="What did you like or dislike about this beer?"></textarea>
        </div>
    </form>

</div>
  
</template>

<script>

import BeerService from '../services/BeerService.js';
import ReviewService from '../services/ReviewService.js';

export default {

    data(){
        return {
            beer: [],
            reviews: []
        }
    },
    
        created(){
            
           let beerId = parseInt(this.$route.params.id);

           BeerService.getBeerById(beerId)
           .then(response => {

               this.beer = response.data;
           })

           .catch(error => {

               console.log("Fail to load Beer", error.response);

           });

           let reviewId = parseInt(this.$route.params.id);

           ReviewService.getReviewsById(reviewId)
           .then(response => {

               this.reviews = response.data;
           })

           .catch(error => {

               console.log("Fail to load Reviews", error.response);

           });
   
        }

}
</script>

<style>

.beer-details {
    
    color: white;

    padding-top: 30px;
    padding-bottom: 50px;

    display: flex;
    justify-content: Center;
    align-items: center;
    flex-direction: column;

    margin-top: 9vh;
    background: center, #222222a2;

}

</style>