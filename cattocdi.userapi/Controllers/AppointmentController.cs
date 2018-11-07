using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Appointment")]
    [Authorize(Roles = "User")]
    public class AppointmentController : ApiController
    {
        private IAppointmentServices _apmServices;
        public AppointmentController(IAppointmentServices apmServices)
        {
            _apmServices = apmServices;
        }
        // GET: api/Appointment
        [HttpGet]
        public IHttpActionResult Get()
        {
            var identity = (ClaimsIdentity)User.Identity;
            string username = identity.Claims.FirstOrDefault(c => c.Type.Equals("Username")).Value;
            return Json(_apmServices.GetAllAppointment(username));
        }
        [HttpDelete]
        public IHttpActionResult CancelAppointment(int id)
        {
            var result = _apmServices.CancelAppointment(id);
            if(result)
            {
                return Ok("Canceled");
            }
            else
            {
                return BadRequest();
            }
        }
        [HttpPost]
        [Route("Review")]
         public IHttpActionResult Review(int id, string content, byte rateNumber)
        {
            var result = _apmServices.Addreview(content, rateNumber, id);
            if (result)
            {
                return Ok("Review success");
            }
            else
            {
                return BadRequest();
            }
        }

        public IHttpActionResult Book(NewAppointmentViewModel model)
        {
            var identity = (ClaimsIdentity)User.Identity;
            string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
            model.AccountId = accountId;
            bool result = _apmServices.BookAppoint(model);
            if (result)
            {
                return Ok("Book success");
            }
            else
            {
                return BadRequest();
            }
        }

    }
}
