using cattocdi.salonservice.Interface;
using cattocdi.webapi.Models;
using Elmah;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/adminsalon")]
    public class AdminSalonController : ApiController
    {
        private ISalonServices _salonService;

        public AdminSalonController(ISalonServices salonServices)
        {
            _salonService = salonServices;
        }

        [Route("")]
        public IHttpActionResult Get()
        {
            try
            {
                var model = _salonService.GetSalonsForAdmin();
                return Json(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Statistic Failed");
            }
        }

        [HttpPost]
        [Route("updatestatus/{salonId:int}")]
        public IHttpActionResult Post([FromUri]int salonId,[FromBody] UpdateSalonModel model)
        {
            try
            {
                bool success = _salonService.ToggleStatus(salonId, model.IsActive);
                string msg = "Update Failed";
                if (success)
                {
                    msg = "Update Successful";
                }
                return Json(new { Success = success, Msg = msg });
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Failed");
            }
        }
        
        public IHttpActionResult Get(int salonId, int month)
        {
            try
            {
                var model = _salonService.GetAppointmentsByMonth(salonId, month);
                return Json(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Statistic Failed");
            }
        }
    }
}
