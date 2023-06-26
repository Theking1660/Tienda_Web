using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class ProductoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
