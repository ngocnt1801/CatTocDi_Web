using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Customer")]
    [Authorize(Roles = "User")]
    public class CustomerController : ApiController
    {
        ICustomerService _cusService;
        public CustomerController(ICustomerService cusService)
        {
            _cusService = cusService;
        } 
        // GET: api/Customer
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string username = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                var profile = _cusService.GetCustomerProfile(username);
                return Json(profile);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Salon Failed");
            }
        }

        // POST : api/Customer
        [HttpPost]        
        public IHttpActionResult Post(ProfileViewModel profile)
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                var accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                profile.AccountId = accountId;

                _cusService.UpdateCustomerProfile(profile);
                return Ok("Update Profile Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Profile Failed");
            }                        
        }
    }
}
