using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class ComentarioController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
