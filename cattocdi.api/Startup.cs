using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.Owin;
using Microsoft.Owin.Security.OAuth;
using Owin;

[assembly: OwinStartup(typeof(cattocdi.api.Startup))]

namespace cattocdi.api
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {            
            app.UseCors(Microsoft.Owin.Cors.CorsOptions.AllowAll); 
            ConfigureAuth(app);
        }
    }
}
