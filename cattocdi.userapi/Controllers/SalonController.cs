
using cattocdi.Service.Interface;
using System.Web.Http;


namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Salon")]
    [Authorize (Roles="User")]    
    public class SalonController : ApiController
    {
        private ISalonServices _salonService;
        public SalonController(ISalonServices salonService)
        {
            _salonService = salonService;
        }

        [HttpGet]
        public IHttpActionResult Gets()
        {
            var salons = _salonService.GetAllSalon();
            return Json(salons);
        }
        
        [HttpGet]
        public IHttpActionResult SearchSalon(string nameAndAddress, string service)
        {

            var salons = _salonService.SearchSalon(nameAndAddress, service);
            return Json(salons);
        }

        public IHttpActionResult getSalonDetail(int id)
        {
            var salon = _salonService.getSalonById(id);
            return Json(salon);
        }

    }
}
