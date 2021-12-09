using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class ReviewSqlDAO : IReviewDAO
    {
        private string connectionString;

        public ReviewSqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        const string sqlSelectRatingsByBeerId = "SELECT review_id, beer_id, user_id, name, rating, description " +
            "FROM reviews " +
            "WHERE beer_id = @beerId;";

        public ICollection<Review> GetReviewsForBeer(int beerId)
        {
            List<Review> reviews = new List<Review>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sqlSelectRatingsByBeerId, conn))
                {
                    cmd.Parameters.AddWithValue("@beerId", beerId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Review review = LoadReviewFromReader(reader);

                            reviews.Add(review);
                        }
                    }
                }

            }
            return reviews;
        }

        private Review LoadReviewFromReader(SqlDataReader reader)
        {
            return new Review()
            {
                ReviewId = Convert.ToInt32(reader["review_id"]),
                BeerId = Convert.ToInt32(reader["beer_id"]),
                UserId = Convert.ToInt32(reader["user_id"]),
                Name = Convert.ToString(reader["name"]),
                Rating = Convert.ToInt32(reader["rating"]),
                Description = Convert.ToString(reader["description"])
            };
        }
    }
}
