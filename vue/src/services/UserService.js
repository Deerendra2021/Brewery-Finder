import axios from 'axios';

export default {

    getUserProfile(userId) {
        return axios.get(`/UserProfile/${userId}`);
    }

}