using cattocdi.salonservice.Interface;
using Elmah;
using System;
using System.Linq;
using System.Security.Claims;
using System.Web.Http;

namespace cattocdi.webapi.Controllers
{
    [Authorize(Roles = "Salon")]
    [RoutePrefix("api/Images")]
    public class ImagesController : ApiController
    {
        private IImageService _imageService;
        public ImagesController(IImageService imageService)
        {
            _imageService = imageService;
        }

        [HttpPost]
        public IHttpActionResult Post([FromBody]string imageUrl)
        {
            try
            {
                var identity = (ClaimsIdentity)User.Identity;
                string accountId = identity.Claims.FirstOrDefault(c => c.Type.Equals("AccountId")).Value;
                _imageService.AddImage(accountId,imageUrl);
                return Ok("Add Image Success");
            }
            catch(Exception ex)
            {
                ErrorSignal.FromCurrentContext().Raise(ex);
                return BadRequest("Add Image Failed");
            }            
        }
    }
}
