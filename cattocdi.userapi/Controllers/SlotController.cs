using cattocdi.Service.Interface;
using Elmah;
using System;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Slot")]
    [Authorize(Roles = "User")]
    public class SlotController : ApiController
    {
        private ISlotTimeService _slotService;
        public SlotController(ISlotTimeService slotService)
        {
            _slotService = slotService;
        }
        //GET: api/Slot?salonId&duration
        [HttpGet]           
        public IHttpActionResult AvailableSlot(int salonId, int duration)
        {
            try
            {
                var slotdates = _slotService.SearchTimeSlot(salonId, duration);
                return Json(slotdates);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Available Slot Failed");
            }            
        }
    }
}
