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
    [RoutePrefix("api/Promotions")]
    public class PromotionsController : ApiController
    {
        private IPromotionService _promotionService;
        public PromotionsController(IPromotionService promotionService)
        {
            _promotionService = promotionService;
        }

        // GET : api/Promotions
        [HttpGet]        
        public IHttpActionResult Get()
        {
            var identity = (ClaimsIdentity)User.Identity;
            string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
            var result = _promotionService.GetPromotions(accountId);
            return Json(result);            
        }
        // POST: api/Cancel
        [HttpPost]
        [Route("{id}/Cancel")]
        public IHttpActionResult Cancel(int id)
        {
            try
            {
                _promotionService.CancelPromotion(id);
                return Ok("Cancel Promotions Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update failed");
            }                    
        }
        [HttpPost]        
        public IHttpActionResult Post(PromotionViewModel model)
        {
            try
            {
                if (_promotionService.IsAvailableForCreate(model) == false)
                    return BadRequest("Another promotion existed at the same period");

                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                model.AccountId = accountId;
                _promotionService.CreatePromotion(model);                
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Create Promotion Failed");
            }            
            return Ok("Create Promotion Sucess");
        }
    }
}
