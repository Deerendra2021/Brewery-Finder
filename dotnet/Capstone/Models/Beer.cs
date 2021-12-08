using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Beer
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Brewery_Id { get; set; }
        public string Style { get; set; }
        public string Availability { get; set; }
        public string Abv { get; set; }
    }
}
