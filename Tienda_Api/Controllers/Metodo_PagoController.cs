using Microsoft.AspNetCore.Mvc;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Metodo")]
    public class Metodo_PagoController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
