using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class CiudadController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
