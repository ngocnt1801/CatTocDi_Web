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
    [RoutePrefix("api/admin/category")]
    public class AdminCategoryController : ApiController
    {

        private ICategoryServices _categoryService;
        public AdminCategoryController(ICategoryServices categoryServices)
        {
            _categoryService = categoryServices;
        }

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
    }
}
