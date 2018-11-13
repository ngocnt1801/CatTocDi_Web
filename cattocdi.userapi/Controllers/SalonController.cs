
using cattocdi.Service.Interface;
using Elmah;
using System;
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
            try
            {
                var salons = _salonService.GetAllSalon();
                return Json(salons);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Salons Failed");
            }            
        }
        
        //GET: api/Salon?name=&service=
        [HttpGet]
        public IHttpActionResult SearchSalon(string nameAndAddress, string service)
        { 
            try
            {
                var salons = _salonService.SearchSalon(nameAndAddress, service);                
                return Json(salons);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Search Failed");
            }            
        }

        // GET: api/Salon/{id}
        [HttpGet]        
        public IHttpActionResult SalonDetail(int id)
        {
            try
            {
                var salon = _salonService.GetSalonById(id);
                return Json(salon);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Salon Detail Failed");
            }            
        }
    }
}
