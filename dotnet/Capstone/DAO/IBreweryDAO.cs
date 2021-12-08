using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IBreweryDAO
    {
        ICollection<Beer> GetAllBeersByBrewery(int breweryId);
        ICollection<Brewery> GetAllBreweries();
    }
}