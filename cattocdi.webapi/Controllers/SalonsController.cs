using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Salons")]
    public class SalonsController : ApiController
    {
        private ISalonServices _salonService;       
        public SalonsController(ISalonServices salonService)
        {
            _salonService = salonService;           
        }
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;                
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                var profile = _salonService.GetSalonProfile(accountId);
                return Json(profile);                
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Salon Profile Failed");
            }            
        }    
                
        [HttpPost]        
        public IHttpActionResult Post(SalonProfileViewModel model)
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                model.AccountId = accountId;
                _salonService.UpdateProfile(model);
                return Ok("Update Profile Success");
            } catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Profile Failed");
            }           
        }
        
    }
}
