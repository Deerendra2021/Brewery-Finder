<template>
    <div class="container user-profile">
        <div id="user-info" v-show="showUpdateFormButton">
            <h1>{{userProfile.firstName}} {{userProfile.lastName}}</h1>
            <p>Favorite Breweries: {{userProfile.favoriteBrewery}}</p>
            <p>Favorite Beers: {{userProfile.favoriteBeer}}</p>
        </div>
        <button type="button" v-show="showUpdateFormButton && user.userId === this.$route.params.id">Update Profile</button>
        <div class="user-photos">
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
            showUpdateFormButton: true,
            showUpdateForm: false
        }
    },

    computed: {
        user() {
            return this.$store.state.user;
        },
    },

    created() {
        let userId = parseInt(this.$route.params.id);

        UserService.getUserProfile(userId)
            .then(response => {
                this.userProfile = response.data;
            })
            .catch(response => {
                console.error("Could not find user", response);
                this.$router.push({name: 'Home'});
            })    }

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
</style>