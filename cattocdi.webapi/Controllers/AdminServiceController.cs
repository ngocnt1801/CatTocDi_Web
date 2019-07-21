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
    [RoutePrefix("api/admin/service")]
    public class AdminServiceController : ApiController
    {

        private IServiceService _serviceService;

        public AdminServiceController(IServiceService serviceService)
        {
            _serviceService = serviceService;
        }

        public IHttpActionResult Get()
        {
            try
            {
                var model = _serviceService.GetAllServices();
                return Json(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Get Statistic Failed");
            }
        }

        [HttpPost]
        public IHttpActionResult Post(ServiceViewModel model)
        {
            try
            {
                _serviceService.Insert(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Create Service Failed");
            }
            return Ok("Create Service Sucess");
        }

        [HttpPut]
        public IHttpActionResult Put(ServiceViewModel model)
        {
            try
            {
                _serviceService.Update(model);
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Service Failed");
            }
            return Ok("Update Promotion Sucess");
        }
    }
}
