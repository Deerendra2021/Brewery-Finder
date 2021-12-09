using Capstone.Models;
using System.Collections.Generic;

namespace Capstone.DAO
{
    public interface IReviewDAO
    {
        ICollection<Review> GetReviewsForBeer(int beerId);
    }
}