import axios from 'axios';

export default {

    getUserProfile(userId) {
        return axios.get(`/UserProfile/${userId}`);
    },

    updateUserProfile(userId, userProfile) {
        return axios.put(`/UserProfile/${userId}`, userProfile);
    }

}