using cattocdi.service.Constant;
using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Appointment")]
    [Authorize(Roles = "User")]
    public class AppointmentController : ApiController
    {
        private IAppointmentServices _apmServices;
        private ISalonServices _salonService;
        public AppointmentController(IAppointmentServices apmServices, ISalonServices salonServices)
        {
            _apmServices = apmServices;
            _salonService = salonServices;
        }
        // GET: api/Appointment
        [HttpGet]
        public IHttpActionResult Get()
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                var result =_apmServices.GetAllAppointment(accountId);
                return Json(result);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Appointment FAiled");
            }
          
        }
        [HttpDelete]      
        [Route("{id}")]
        public IHttpActionResult CancelAppointment(int id)
        {
            try
            {
                _apmServices.CancelAppointment(id);
                return Ok("Cancel Success");
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Cancel Failed");
            }            
        }
      

        [HttpPost]        
        public IHttpActionResult Book(NewAppointmentViewModel model)
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                model.AccountId = accountId;
                _apmServices.BookAppoint(model);
                
                using (var firebase = new FireBase.Notification.Firebase())
                {
                    firebase.ServerKey = FirebaseConstant.SERVER_KEY;
                    string id = _salonService.GetFirebaseToken(model.SalonId);
                    firebase.PushNotifyAsync(id, "New appointment", "Ban co mot lich hen vao luc " + model.StartTime.ToString() + " voi " + User.Identity.Name).Wait();
                }
                return Ok("Book Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Book Failed");
            }            
        }

    }
}
