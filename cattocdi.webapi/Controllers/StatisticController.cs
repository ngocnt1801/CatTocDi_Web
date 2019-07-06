using cattocdi.salonservice.Interface;
using Elmah;
using System;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("api/Statistic")]
    public class StatisticController : ApiController
    {
        private IStatisticService _statisticService;

        public StatisticController(IStatisticService statisticService)
        {
            _statisticService = statisticService;
        }

        public IHttpActionResult Get(int? year)
        {
            try
            {
                var model = new
                {
                    General = _statisticService.GetGeneralStatistic(),
                    SalonsByMonth = _statisticService.GetTotalSalonsByMonth(year),
                    UsersByMonth = _statisticService.GetTotalUsersByMonth(year),
                    AppointmentsByMonth = _statisticService.GetAppointmentsByMonth(year)
                };
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
