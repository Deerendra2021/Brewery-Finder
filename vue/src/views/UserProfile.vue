<template>
    <div class="container user-profile">
        <h1>{{user.username}}</h1>
    </div>
</template>

<script>
import UserService from '../services/UserService'

export default {
    data() {
        return {
            user: []
        }
    },

    computed: {
        
    },

    created() {
        let userId = parseInt(this.$route.params.id);

        UserService.getUserData(userId)
            .then(response => {
                this.user = response.data;
            })
            .catch(response => {
                console.error("Could not find beers", response);
                this.$router.push({name: 'Home'});
            })    }

}
</script>

<style>
    .user-profile{
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
</style>