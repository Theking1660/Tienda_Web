using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class VendedorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
