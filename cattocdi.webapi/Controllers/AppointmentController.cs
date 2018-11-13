using cattocdi.salonservice.Interface;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Appointment")]
    public class AppointmentController : ApiController
    {
        IAppointmentServices _apmServices;
        public AppointmentController(IAppointmentServices apmServices)
        {
            _apmServices = apmServices;
        }
        // GET: api/Appointment
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(p => p.Type.Equals("AccountId")).Value;
                var result = _apmServices.GetAllAppointment(accountId);
                return Json(result);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Appointments Failed");
            }            
        }
        
        // GET: api/Appointment?date
        public IHttpActionResult GetByDate(DateTime date)
        {            
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(p => p.Type.Equals("AccountId")).Value;
                var result = _apmServices.GetByDate(date, accountId);
                return Json(result);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Appointment Failed");
            }            
        }

        [HttpPost]
        [Route("{id}/Cancel")]
        public IHttpActionResult CancelAppointment(int id, [FromBody] string reason)
        {
            try
            {
                _apmServices.CancelAppointment(id, reason);
                return Ok("Cancelling Success");
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Cancelling Failed");
            }
        }

        [HttpPost]
        [Route("{id}/Approve")]
        public IHttpActionResult ApproveAppointment(int id)
        {
            try
            {
                _apmServices.ApproveAppointment(id);
                return Ok("Confirm Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Confirm Failed");
            }           
        }
    }
}
