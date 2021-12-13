import axios from 'axios';

export default {

    getUserData(userId) {
        return axios.get(`/User/${userId}`);
    }

}