using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BrewerySqlDAO : IBreweryDAO
    {
        private string connectionString;

        private readonly string sqlSelectBreweryById = "SELECT brewery_id, name, address1, city, state, zip, phone, description" +
            " FROM brewery" +
            " WHERE brewery_id = @brewery_id";

        public BrewerySqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public ICollection<Brewery> GetAllBreweries()
        {
            List<Brewery> breweries = new List<Brewery>();

            const string sqlSelectAll = "SELECT brewery_id, name, address1, city, state, zip, phone, description FROM brewery ORDER BY name";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand command = new SqlCommand(sqlSelectAll, conn))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Brewery brewery = new Brewery();

                            brewery.Id = Convert.ToInt32(reader["brewery_id"]);
                            brewery.Name = Convert.ToString(reader["name"]);
                            brewery.Address1 = Convert.ToString(reader["address1"]);
                            brewery.City = Convert.ToString(reader["city"]);
                            brewery.State = Convert.ToString(reader["state"]);
                            brewery.Zip = Convert.ToString(reader["zip"]);
                            brewery.Phone = Convert.ToString(reader["phone"]);
                            brewery.Description = Convert.ToString(reader["description"]);

                            breweries.Add(brewery);
                        }
                    }
                }

            }
            return breweries;
        }

        public ICollection<Beer> GetAllBeersByBrewery(int breweryId)
        {
            List<Beer> breweryBeers = new List<Beer>();

            const string sqlSelectAllBeersByBrewery = "SELECT beer_id, name, brewery_id, style, availability, abv " +
                "FROM beer " +
                "WHERE brewery_id = @breweryId";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand command = new SqlCommand(sqlSelectAllBeersByBrewery, conn))
                {
                    command.Parameters.AddWithValue("@breweryId", breweryId);

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Beer beer = new Beer()
                            {
                                Id = Convert.ToInt32(reader["beer_id"]),
                                Name = Convert.ToString(reader["name"]),
                                Brewery_Id = Convert.ToInt32(reader["brewery_id"]),
                                Style = Convert.ToString(reader["style"]),
                                Availability = Convert.ToString(reader["availability"]),
                                Abv = Convert.ToString(reader["abv"])
                            };
                        breweryBeers.Add(beer);                                                
                        }
                    }
                }
            }
            return breweryBeers;
        }
    }
}
