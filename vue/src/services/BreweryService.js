import axios from 'axios';

export default {

    getAllBreweries() {
        return axios.get('/brewery');
    },

}