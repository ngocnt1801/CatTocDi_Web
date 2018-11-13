using cattocdi.salonservice.Implement;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Customer")]
    public class CustomerController : ApiController
    {
        private CustomerService _cusRepo;
        public CustomerController(CustomerService cusRepo)
        {
            _cusRepo = cusRepo;
        } 

        //GET : api/Customer
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string acountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                var customers = _cusRepo.GetAllCustomer(acountId);
                return Json(customers);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Customer Failed");
            }            
        }

        // GET : api/Customer/{id}
        public IHttpActionResult Get(int id)
        {
            try
            {
                var cus = _cusRepo.GetById(id);
                return Json(cus);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Customer Failed");
            }            
        }
    }
}
