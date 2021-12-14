using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class UserProfileSqlDAO : IUserProfileDAO
    {
        private string connectionString;

        public UserProfileSqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public UserProfile GetUserProfile(int id)
        {
            UserProfile userProfile = new UserProfile();

            const string sqlSelectUserProfile = "SELECT user_id, first_name, last_name, favorite_brewery, favorite_beer " +
                "FROM user_profile WHERE user_id = @id;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sqlSelectUserProfile, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            userProfile.UserId = Convert.ToInt32(reader["user_id"]);
                            userProfile.FirstName = Convert.ToString(reader["first_name"]);
                            userProfile.LastName = Convert.ToString(reader["last_name"]);
                            userProfile.FavoriteBrewery = Convert.ToString(reader["favorite_brewery"]);
                            userProfile.FavoriteBeer = Convert.ToString(reader["favorite_beer"]);
                        }
                    }
                }
            }

            return userProfile;
        }

    }
}

