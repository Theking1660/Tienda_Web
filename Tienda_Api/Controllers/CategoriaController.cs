using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class CategoriaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
