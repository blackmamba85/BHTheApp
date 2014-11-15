using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(BHSCMSApp.Startup))]
namespace BHSCMSApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
