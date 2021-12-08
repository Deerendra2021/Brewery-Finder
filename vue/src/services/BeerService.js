import axios from 'axios';

export default {

    getAllBeers() {
        return axios.get('/Beer');
    },

}