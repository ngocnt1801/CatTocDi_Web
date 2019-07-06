using cattocdi.salonservice.Interface;
using Elmah;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/admin/salon/customer")]
    public class AdminCustomerController : ApiController
    {
        private ICustomerService _customerService;
        public AdminCustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        //GET : api/Customer
        public IHttpActionResult Get(int salonId)
        {
            try
            {
                var customers = _customerService.GetAllSalonCustomerForAdmin(salonId);
                return Json(customers);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Customer Failed");
            }
        }
    }
}
