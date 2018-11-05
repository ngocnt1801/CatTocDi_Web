using cattocdi.salonservice.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Promotions")]
    public class PromotionsController : ApiController
    {
        private IPromotionService _promotionService;
        public PromotionsController(IPromotionService promotionService)
        {
            _promotionService = promotionService;
        }
        public IHttpActionResult Get()
        {
            var identity = (ClaimsIdentity)User.Identity;
            string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
            var result = _promotionService.GetPromotions(accountId);
            return Json(result);            
        }        


    }
}
