﻿using cattocdi.salonservice.Interface;
using cattocdi.salonservice.ViewModel;
using Elmah;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Services")]
    public class ServicesController : ApiController
    {
        private IServiceSalonService _salonService;

        public ServicesController(IServiceSalonService salonService)
        {
            _salonService = salonService;
        }

        [HttpPost]
        [Route("Update")]
        public IHttpActionResult Update(UpdateServiceViewModel model)
        {            
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                if (accountId != null)
                {
                    model.AccountId = accountId;
                    _salonService.UpdateSalonService(model);
                }
            }
            catch (Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Update Failed");
            }
            return Ok("Update Success");
        }
    }
}
