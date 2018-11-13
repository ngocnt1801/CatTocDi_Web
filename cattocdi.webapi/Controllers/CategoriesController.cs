using cattocdi.salonservice.Interface;
using Elmah;
using System;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Categories")]
    public class CategoriesController : ApiController
    {
        private IServiceSalonService _serviceSalonService; 
        public CategoriesController(IServiceSalonService serviceSalonService)
        {
            _serviceSalonService = serviceSalonService;
        }
        
        public IHttpActionResult Get()
        {
            try
            {
                var salons = _serviceSalonService.GetCategories();
                return Json(salons);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Category Failed");
            }            
        }

    }
}
