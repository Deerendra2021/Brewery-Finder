import axios from 'axios';

export default {

    getAllBreweries() {
        return axios.get('/Brewery');
    },
    getBreweryById(id) {
        return axios.get(`/Brewery/${id}`);
    }

}