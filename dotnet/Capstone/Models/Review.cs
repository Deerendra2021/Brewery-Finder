using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Review
    {
        public int ReviewId { get; set; }
        public int BeerId { get; set; }
        public int UserId { get; set; }
        public string Name { get; set; }
        public int Rating { get; set; }
        public string Description {get; set;}
    }
}
