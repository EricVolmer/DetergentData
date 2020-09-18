using System;
using System.Globalization;
using System.Web.Mvc;
using DetergentData.App_GlobalResources;

namespace DetergentData.Controllers
{
    public class HomeController : BaseController
    {
        public ActionResult Index()
        {
            Console.WriteLine(Resource.HomeController_Index_Current_culture__ + CultureInfo.CurrentCulture.Name);
            return View();
        }
    }
}