using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IBreweryDAO
    {
        ICollection<Brewery> GetAllBreweries();
    }
}