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
    public class UserProfileController : ControllerBase
    {
        private readonly IUserProfileDAO userProfile;

        public UserProfileController(IUserProfileDAO userPro)
        {
            this.userProfile = userPro;
        }

        [HttpGet("{userId}")]
        [AllowAnonymous]
        public ActionResult GetUserProfile(int userId)
        {
            UserProfile profile = userProfile.GetUserProfile(userId);

            if (profile == null)
            {
                return NotFound();
            }

            return Ok(profile);
        }

        [HttpPut("{userId}")]
        [Authorize]
        public ActionResult UpdateUserProfile(int userId, UserProfile profile)
        {
            userProfile.UpdateUserProfile(userId, profile);

            return Ok();
        }
    }
}
