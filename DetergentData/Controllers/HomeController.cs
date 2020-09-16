using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DetergentData.Models;

namespace DetergentData.Controllers
{
    public class HomeController : Controller
    {
        private ItemEntities db = new ItemEntities();
        public ActionResult Index()
        {
            return View();
        }
    }
}