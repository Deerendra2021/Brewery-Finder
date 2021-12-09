﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.DAO;
using Capstone.Models;

namespace Capstone.Controllers
{
    [Route("[controller]s")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private readonly IReviewDAO reviews;

        public ReviewController(IReviewDAO reviews)
        {
            this.reviews = reviews;
        }

        [HttpGet("{beerId}")]
        [AllowAnonymous]
        public ActionResult GetReviewsByBeerId(int beerId)
        {
            return Ok(reviews.GetReviewsForBeer(beerId));
        }
    }
}
