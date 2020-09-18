using System.Web.Mvc;

namespace DetergentData
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new CultureFilter(defaultCulture: "dk"));
            filters.Add(new HandleErrorAttribute());
        }
    }
}