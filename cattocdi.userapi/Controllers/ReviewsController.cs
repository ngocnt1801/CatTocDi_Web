using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using Elmah;
using System;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Reviews")]
    [Authorize(Roles = "User")]
    public class ReviewsController : ApiController
    {
        private IAppointmentServices _apmServices;
        public ReviewsController(IAppointmentServices apmServices)
        {
            _apmServices = apmServices;
        }
        [HttpPost]
        public IHttpActionResult Post(ReviewViewModel model)
        {
            try
            {
                _apmServices.AddReview(model);
                return Ok("Add Review Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Add Review Failed");
            }
        }
    }
}
