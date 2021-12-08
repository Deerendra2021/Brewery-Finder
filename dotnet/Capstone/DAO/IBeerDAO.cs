using Capstone.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.DAO
{
    public interface IBeerDAO
    {
        IEnumerable<Beer> GetAllBeers();
        Beer FindBeerById(int id);
    }
}
