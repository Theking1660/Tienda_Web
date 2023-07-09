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
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MComentario>>> Get_id(int ID)
        {
            var lista = await comentario.Mostrar_id(ID);
            return lista;
        }
    }
}
