using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    public class PerfilController : Controller
    {
        public async Task<IActionResult> Index()
        {
            return View();
        }
    }
}
