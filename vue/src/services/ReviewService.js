import axios from 'axios';

export default {

    getAllReviews() {
        return axios.get('/Reviews');
    },
    getReviewsById(id) {
        return axios.get(`/Reviews/${id}`);
    },
    addNewReview(review) {
        return axios.post('/Reviews', review);
    }
}