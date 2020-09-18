using System;
using System.Globalization;
using System.Threading;
using System.Web.Mvc;


namespace DetergentData.Controllers
{
    public class HomeController : BaseController
    {
       
        public ActionResult Index()
        {
            Console.WriteLine("Current culture: " + CultureInfo.CurrentCulture.Name);
            return View();
        }
    }
}