import axios from 'axios';

export default {

    getAllBeers() {
        return axios.get('/Beer');
    },
    getBeersByBrewery(id) {
        return axios.get(`/Brewery/${id}`);
    },
    getBeerById(id){
        return axios.get(`/Beer/${id}`);
    }

}