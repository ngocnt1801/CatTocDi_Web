using cattocdi.Service.Constant;
using cattocdi.webapi.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [RoutePrefix("api/Account")]
    public class AccountController : ApiController
    {                
        [Route("User/Register")]
        [HttpPost]
        [AllowAnonymous]
        public IdentityResult Register(UserAccountModel model)
        {
            var userStore = new UserStore<ApplicationUser>(new ApplicationDbContext());
            var manager = new UserManager<ApplicationUser>(userStore);
            var user = new ApplicationUser()
            {
                UserName = model.UserName,
                Email = model.Email
            };
            manager.PasswordValidator = new PasswordValidator()
            {
                RequiredLength = 3
            };
            IdentityResult result = manager.Create(user, model.Password);
            if (result.Succeeded && model.Role != null)
            {
                manager.AddToRole(user.Id, model.Role);
                if (model.Role == RoleConstant.SALON)
                {

                }
                else if (model.Role == RoleConstant.USER)
                {

                }
                else
                {

                }
            }                   
            return result;
        }

        [HttpGet]
        [Route("~/api/GetUserClaims")]        
        public AccountModel GetUserClaims()
        {
            var identityClaims = (ClaimsIdentity)User.Identity;
            IEnumerable<Claim> claims = identityClaims.Claims;
            AccountModel model = new AccountModel
            {
                Email = identityClaims.FindFirst("Email").Value,
                UserName = identityClaims.FindFirst("Username").Value,
                LoggedOn = identityClaims.FindFirst("LoggedOn").Value
            };
            return model; 
        }
    }
}
