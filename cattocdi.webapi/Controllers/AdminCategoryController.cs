using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
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
    [RoutePrefix("api/admincategory")]
    public class AdminCategoryController : ApiController
    {

        private ICategoryServices _categoryService;
        public AdminCategoryController(ICategoryServices categoryServices)
        {
            _categoryService = categoryServices;
        }

        [Route("")]
        public IHttpActionResult Get()
        {
            try
            {
                var model = _categoryService.GetAllCategory();
                return Json(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Category Failed");
            }
        }
        [HttpPost]
        [Route("")]
        public IHttpActionResult Post(CategoryViewModel model)
        {
            try
            {
                _categoryService.Insert(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Create Service Failed");
            }
            return Ok("Create Service Sucess");
        }
    }
}
