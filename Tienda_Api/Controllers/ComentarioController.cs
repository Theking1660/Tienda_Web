using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Comentario")]
    public class ComentarioController : Controller
    {
        private DComentario comentario = new DComentario();
        [HttpGet]
        public async Task<ActionResult<List<MComentario>>> Get()
        {

            var lista = await comentario.Mostrar();
            return lista;

        }
    }
}
