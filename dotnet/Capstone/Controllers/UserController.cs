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
    [Route("[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserDAO user;

        public UserController(IUserDAO users)
        {
            this.user = users;
        }

        [HttpGet("{userId}")]
        [AllowAnonymous]
        public ActionResult GetUser(int userId)
        {
            User returnUser = user.GetUserById(userId);

            if (returnUser == null)
            {
                return NotFound();
            }

            return Ok(returnUser);
        }
    }
}
