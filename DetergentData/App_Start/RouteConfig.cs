using System.Web.Mvc;
using System.Web.Routing;

namespace DetergentData
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Root",
                "",
                new
                {
                    controller = "Base",
                    action = "RedirectToLocalized"
                }
            );
            routes.MapRoute(
                "Default",
                "{culture}/{controller}/{action}/{id}",
                new
                {
                    culture = "dk",
                    controller = "Home",
                    action = "Index",
                    id = UrlParameter.Optional
                },
                new {culture = "dk|en"}
            );
        }
    }
}