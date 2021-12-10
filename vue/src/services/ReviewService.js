import axios from 'axios';

export default {

    getAllReviews() {
        return axios.get('/Reviews');
    },
    getReviewsById(id) {
        return axios.get(`/Reviews/${id}`);
    },
    addNewReview() {
        return axios.post('/Reviews');
    }

}