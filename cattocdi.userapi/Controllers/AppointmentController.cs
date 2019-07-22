using cattocdi.Service.Interface;
using cattocdi.Service.ViewModel.User;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;
using FirebaseAdmin;
using FirebaseAdmin.Messaging;
using Google.Apis.Auth.OAuth2;
using System.Threading.Tasks;

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
                var result = _apmServices.GetAllAppointment(accountId);
                return Json(result);
            }
            catch (Exception ex)
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

                MobileMessagingClient client = new MobileMessagingClient();
                client.SendNotification(_salonService.GetFirebaseToken(model.SalonId), "Lịch hẹn mới", "Bạn có một lịch hẹn mới!");

                return Ok("Book Success");

            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Book Failed");
            }
        }

        

    }

    public class MobileMessagingClient
    {
        private readonly FirebaseMessaging messaging;

        public MobileMessagingClient()
        {
            var app = FirebaseApp.Create(new AppOptions() { Credential = GoogleCredential.FromFile(@"E:\serviceAccountKey.json").CreateScoped("https://www.googleapis.com/auth/firebase.messaging") });
            messaging = FirebaseMessaging.GetMessaging(app);
        }
        //...          

        private Message CreateNotification(string title, string notificationBody, string token)
        {
            return new Message()
            {
                Token = token,
                Notification = new Notification()
                {
                    Body = notificationBody,
                    Title = title
                }
            };
        }

        public async Task SendNotification(string token, string title, string body)
        {
            var result = await messaging.SendAsync(CreateNotification(title, body, token));
            //do something with result
        }
    }


}
