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

        [HttpGet("{id}")]
        [AllowAnonymous]
        public ActionResult GetAllBeersByBreweryId(int id)
        {
            ICollection<Beer> allBeersByBrewery = breweries.GetAllBeersByBrewery(id);

            return Ok(allBeersByBrewery);
        }
    }
}
