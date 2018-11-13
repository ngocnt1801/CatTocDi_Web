using cattocdi.Service.Interface;
using Elmah;
using System;
using System.Web.Http;

namespace cattocdi.userapi.Controllers
{
    [RoutePrefix("api/Category")]
    [Authorize(Roles = "User")]
    public class CategoryController : ApiController
    {
        private ICategoryServices _categoryService;

        public CategoryController(ICategoryServices categoryService)
        {
            _categoryService = categoryService;
        }
        // GET: api/ServiceCategory
        [HttpGet]
        public IHttpActionResult Gets()
        {
            try
            {
                var category = _categoryService.GetAllCategory();
                return Json(category);
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Categories Failed");
            }            
        }
        // GET: api/ServiceCategory/5
    }
}
