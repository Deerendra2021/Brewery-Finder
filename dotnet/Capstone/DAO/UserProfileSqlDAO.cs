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

        public UserProfile UpdateUserProfile(int id, UserProfile profile)
        {
            const string sqlUpdateUserProfile = "UPDATE user_profile " +
                "SET first_name = @firstName, last_name = @lastName, favorite_brewery = @favBrewery, favorite_beer = @favBeer " +
                "WHERE user_id = @id;";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sqlUpdateUserProfile, conn))
                {
                    cmd.Parameters.AddWithValue("@id", profile.UserId);
                    cmd.Parameters.AddWithValue("@firstName", profile.FirstName);
                    cmd.Parameters.AddWithValue("@lastName", profile.LastName);
                    cmd.Parameters.AddWithValue("@favBrewery", profile.FavoriteBrewery);
                    cmd.Parameters.AddWithValue("@favBeer", profile.FavoriteBeer);

                    cmd.ExecuteNonQuery();
                }
            }

            return profile;
        }

        public void AddUserProfile(UserProfile newProfile)
        {
            const string sqlAddUserProfile = "INSERT INTO user_profile (user_id, first_name, last_name) " +
                "VALUES (@userId, @firstName, @lastName);";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand cmd = new SqlCommand(sqlAddUserProfile, conn))
                {
                    cmd.Parameters.AddWithValue("@userId", newProfile.UserId);
                    cmd.Parameters.AddWithValue("@firstName", newProfile.FirstName);
                    cmd.Parameters.AddWithValue("@lastName", newProfile.LastName);

                    cmd.ExecuteNonQuery();
                }
        }
        }

    }
}

