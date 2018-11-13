using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using Elmah;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/WorkingHours")]
    public class WorkingHoursController : ApiController
    {
        private IWorkingHourService _workingHourService;
        private ITimeSlotService _slotService;

        public WorkingHoursController(IWorkingHourService workingHourService,ITimeSlotService slotService)
        {
            _workingHourService = workingHourService;
            _slotService = slotService;
        }

        [HttpPost]       
        public IHttpActionResult WorkingHour(List<WorkingHourViewModel> workingHours)
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                _workingHourService.Update(accountId, workingHours);
                _slotService.GenerateSlotForSalon(accountId);
                return Json("Update Working Hour Success");
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Profile Failed");
            }
        }
    }
}
