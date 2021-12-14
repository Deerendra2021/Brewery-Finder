<template>
<div class ="beer-details container">

    <h1>{{beer.name}}</h1>
    <h2>{{beer.style}}</h2>
    <h2 v-if="beer.abv != ''">{{beer.abv}}% ABV</h2>
    <h2>{{beer.availability}}</h2>
    <br />
    <p>____________________<p>
    <br />
    <section id="reviewSection" v-if="reviews.length > 0">
        <h3>Beer Reviews</h3>
        <h5>Average Rating: {{averageRating}}</h5>
        <br />
        <div class="list-group card-deck w-100 d-flex justify-content-center" v-for="review in reviews" v-bind:key="review.id">
            <a href="#" class="list-group-item list-group-item-action flex-column align-items-start active">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">{{review.name}}</h5>
                    
                    <div>
                        <img
                            src="../img/star.png"
                            v-for="r in review.rating"
                            v-bind:key="r"
                            alt="image of a star"
                        />
                    </div>
                    
                </div>
                <p class="mb-1">{{review.description}}</p>
            </a>
        </div>
    </section>
    <section v-else>
        <h3 class="d-flex justify-content-center">No Reviews Yet</h3>
        <!-- <p class="d-flex justify-content-center">Please log in to add a new review.</p> Need this code once login is done-->           
    </section>
    <div class="d-flex justify-content-center">
        <button type="button" class="btn btn-secondary" v-on:click="showForm = true" 
                v-if="!showForm && user != true">
                Add New Reveiw</button>
    </div>
    <form v-if="showForm" v-on:submit.prevent="addNewReview(showForm=false)">
        <div class="form-group">
            <label for="reviewerName">Your Name: </label>
            <input type="text" class="form-control" id="reviewerName" name="reviewerName" placeholder="Your Name Here" v-model="newReview.name">
        </div>
        <div class="form-group">
            <label for="rating">Rate 1 through 5, 5 being the best and 1 being the worst: </label>
            <select class="form-control" id="rating" v-model.number="newReview.rating">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
            </select>
        </div>
        <div class="form-group">
            <label for="reviewDescription">Add a written review: </label>
            <textarea class="form-control" id="reviewDescription" rows="4" placeholder="What did you like or dislike about this beer?" v-model="newReview.description"></textarea>
        </div>
        <div class="d-flex justify-content-center">
            <button class="btn btn-success" type="submit">Submit Review</button>
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
            reviews: [],
            showForm: false,
            newReview: {
                beerId: parseInt(this.$route.params.id),
                userId: this.$store.state.user.userId,
                name: '',
                rating: 0,
                description: '',
            },
        }
    },

    computed: {
        user() {

            return Object.keys(this.$store.state.user).length === 0;
        },
        averageRating() {
            let sum = 0;
            this.reviews.forEach(r => {
                sum += r.rating;
            })

            return (sum / this.reviews.length).toFixed(2);
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
   
        },

    methods: {

        addNewReview(){

            ReviewService.addNewReview(this.newReview)
            .then(response => {              

                this.reviews.push(response.data);

                this.newReview = {

                    beerId: parseInt(this.$route.params.id),
                    userId: this.$store.state.user.userId,
                    name: '',
                    rating: 0,
                    description: '',
                }

            })
            .catch(error => {

                console.error("Could not save the new review", error.response);
            });

        },
    },

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

#reviewSection {
    width: 100%;
    display: flex;
    justify-content: Center;
    align-items: center;
    flex-direction: column;
}

div > img {
    height: 17px;
}

</style>