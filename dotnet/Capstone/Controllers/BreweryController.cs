using Capstone.DAO;
using Capstone.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Controllers
{
    [Route("/[controller]")]
    [ApiController]
    public class BreweryController : ControllerBase
    {
        private readonly IBreweryDAO breweries;

        public BreweryController(IBreweryDAO breweries)
        {
            this.breweries = breweries;
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult GetAllBreweries()
        {
            ICollection<Brewery> allBreweries = breweries.GetAllBreweries();

            return Ok(allBreweries);
        }

        [HttpGet("{brewery_id}")]
        public ActionResult GetBreweryById(int brewery_id)
        {
            return Ok(breweries.FindBreweryById(brewery_id));
        }
    }
}
