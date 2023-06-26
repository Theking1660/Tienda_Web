using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class CuentaController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
