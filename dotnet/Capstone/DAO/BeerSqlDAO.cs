using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public class BeerSqlDAO : IBeerDAO
    {
        private string connectionString;
        const string sqlSelectAllBeer = "SELECT beer_id, name, brewery_id, style, availability, abv" +
                                    " FROM beer";

        const string sqlSelectBeerById = "SELECT beer_id, name, brewery_id, style, availability, abv" +
            " FROM beer" +
            " WHERE beer_id = @beer_id";

        public BeerSqlDAO(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public IEnumerable<Beer> GetAllBeers()
        {
            List<Beer> beers = new List<Beer>();

            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using(SqlCommand cmd = new SqlCommand(sqlSelectAllBeer, conn))
                {
                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Beer beer = new Beer();

                            beer.Id = Convert.ToInt32(reader["beer_id"]);
                            beer.Name = Convert.ToString(reader["name"]);
                            beer.Brewery_Id = Convert.ToInt32(reader["brewery_id"]);
                            beer.Style = Convert.ToString(reader["style"]);
                            beer.Availability = Convert.ToString(reader["availability"]);
                            beer.Abv = Convert.ToString(reader["abv"]);

                            beers.Add(beer);

                        }
                    }
                }
            }

            return beers;
        }

        public Beer FindBeerById(int id)
        {
            using(SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using(SqlCommand cmd = new SqlCommand(sqlSelectBeerById, conn))
                {
                    cmd.Parameters.AddWithValue("@beer_id", id);

                    using(SqlDataReader reader = cmd.ExecuteReader())
                    {
                      if (reader.Read())
                        {
                            Beer beer = LoadBeerFromReader(reader);

                            return beer;
                        }
                    }
                }
            }

            return null;

        }
        private static Beer LoadBeerFromReader(SqlDataReader reader)
        {
            return new Beer
            {
                Id = Convert.ToInt32(reader["beer_id"]),
                Name = Convert.ToString(reader["name"]),
                Brewery_Id = Convert.ToInt32(reader["brewery_id"]),
                Style = Convert.ToString(reader["style"]),
                Availability = Convert.ToString(reader["availability"]),
                Abv = Convert.ToString(reader["abv"]),
            };
        } 

    }
}
