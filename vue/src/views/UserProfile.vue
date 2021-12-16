<template>
    <div class="container user-profile">
        <div id="user-info" v-show="showUserProfile">
            <h1>{{userProfile.firstName}} {{userProfile.lastName}}</h1>
            <p>Favorite Breweries: {{userProfile.favoriteBrewery}}</p>
            <p>Favorite Beers: {{userProfile.favoriteBeer}}</p>
        </div>
        <button type="button" v-show="showUserProfile && user.userId === this.$route.params.id"
                @click="showUserProfile = false; showUpdateForm = true;">Update Profile</button>
        
        <form id="update-form" v-show="showUpdateForm" v-on:submit.prevent="updateUserProfile()">
            <label for="first-name">First Name: </label>
            <input type="text" id="first-name" class="form-textbox" required maxlength="50" v-model="updatedProfile.firstName">
            <div>&nbsp;</div>
            
            <label for="last-name">Last Name: </label>
            <input type="text" id="last-name" class="form-textbox" required maxlength="50" v-model="updatedProfile.lastName">
            <div>&nbsp;</div>

            <label for="favorite-brewery">Favorite Breweries: </label>
            <input type="text" id="favorite-brewery" class="form-textbox" maxlength="50" v-model="updatedProfile.favoriteBrewery">
            <div>&nbsp;</div>

            <label for="favorite-beer">Favorite Beers: </label>
            <input type="text" id="favorite-beer" class="form-textbox" maxlength="50" v-model="updatedProfile.favoriteBeer">
            <div>&nbsp;</div>

            <button type="submit" @click="showUserProfile = true; showUpdateForm = false">Submit</button>

        </form>
        
        <div v-if="false" class="user-photos">
            <h2>User Photos:</h2>
        </div>
    </div>
</template>

<script>
import UserService from '../services/UserService'

export default {
    name: 'User-Profile',
    data() {
        return {
            userProfile: [],
            showUserProfile: true,
            showUpdateForm: false,
            updatedProfile: {
                userId: parseInt(this.$route.params.id),
                firstName: '',
                lastName: '',
                favoriteBrewery: '',
                favoriteBeer: ''
            }            
        }
    },

    computed: {
        user() {
            return this.$store.state.user;
        },
    },

    methods: {
        updateUserProfile() {

            UserService.updateUserProfile(parseInt(this.$route.params.id),this.updatedProfile)
            .then(response => {

                this.userProfile = response.data;
              
            })
            .catch(response => {

                console.error("Could not update user profile", response);
                
            });   
        },
        setUpdatedProfile() {
            this.updatedProfile.firstName = this.userProfile.firstName;
            this.updatedProfile.lastName = this.userProfile.lastName;
            this.updatedProfile.favoriteBrewery = this.userProfile.favoriteBrewery;
            this.updatedProfile.favoriteBeer = this.userProfile.favoriteBeer;

        }
    },

    created() {
        let userId = parseInt(this.$route.params.id);

        UserService.getUserProfile(userId)
            .then(response => {
                this.userProfile = response.data;
                this.setUpdatedProfile();
            })
            .catch(response => {
                console.error("Could not find user", response);
                this.$router.push({name: 'Home'});
            })
        }

}
</script>

<style>
    .user-profile{
        display: flex;
        align-items: center;
        flex-direction: column;

        background-color: #222222a2;
        max-height: 90%;

        row-gap: 40px;

        color: white;
        min-height: 74vh;
        margin-top: 9vh;
    }

    #user-info > h1 {
        text-align: center;
    }

    #user-info > p {
        text-align: left;
        position: relative;
        right: 1rem;
        padding-top: 1em;
    }

    #update-form {
        padding-top: 2em;
    }

    #update-form > input {
        margin-left: 1em;
    }
</style>