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
    public class BeerController : ControllerBase
    {
        private readonly IBeerDAO beers;

        public BeerController(IBeerDAO beers)
        {
            this.beers = beers;
        }

        [HttpGet]
        [AllowAnonymous]
        public ActionResult GetAllBeers()
        {
            return Ok(beers.GetAllBeers());

        }

        [HttpGet("{beer_id}")]
        [AllowAnonymous]
        public ActionResult GetBeerById(int beer_id)
        {
            return Ok(beers.FindBeerById(beer_id));
        }


    }
}
