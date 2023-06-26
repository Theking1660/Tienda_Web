using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class CuponesController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
