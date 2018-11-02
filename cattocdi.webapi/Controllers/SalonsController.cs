using cattocdi.Service.Interface;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;
using System.Web.Http.Results;

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
            var identity = (ClaimsIdentity)User.Identity;
            string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
            var profile = _salonService.GetSalonProfile(accountId);            
            return Json(profile);
        }

    }
}
