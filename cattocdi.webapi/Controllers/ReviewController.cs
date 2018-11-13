using cattocdi.salonservice.Implement;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Review")]
    public class ReviewController : ApiController
    {
        // GET: api/Review
        ReviewServices _reviewServices;
        public ReviewController(ReviewServices reviewServices)
        {
            _reviewServices = reviewServices;
        }
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                var revs = _reviewServices.GetAllReviews(accountId);
                return Json(revs);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Review Failed");
            }            
        }
        
    }
}
