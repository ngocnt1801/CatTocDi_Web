using cattocdi.salonservice.Interface;
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
    [RoutePrefix("api/admin/salon")]
    public class AdminSalonController : ApiController
    {
        private ISalonServices _salonService;

        public AdminSalonController(ISalonServices salonServices)
        {
            _salonService = salonServices;
        }

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
