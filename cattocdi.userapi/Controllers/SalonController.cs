using cattocdi.entity;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;
using Newtonsoft.Json;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Salon")]    
    public class SalonController : ApiController
    {
        private ISalonServices _salonService;
        private ICustomerService _customerService;
        public SalonController(ISalonServices salonService, ICustomerService customerService)
        {
            _salonService = salonService;
            _customerService = customerService;
        }

        // GET: api/Salon
        [HttpGet]
        public IHttpActionResult Gets()
        {
            var salons = _salonService.GetAllSalon();
            return Json(salons);
        }

        // GET: api/Salon/5
        public string Get(int id)
        {
            return "value";
        }

        // POST: api/Salon
        public void Post([FromBody]string value)
        {
        }

        // PUT: api/Salon/5
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE: api/Salon/5
        public void Delete(int id)
        {
        }
    }
}
