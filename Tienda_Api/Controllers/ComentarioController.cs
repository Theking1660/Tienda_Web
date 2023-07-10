using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/Comentario")]
    public class ComentarioController : Controller
    {
        
        [HttpGet]
        public async Task<ActionResult<List<MComentario>>> Get()
        {
            DComentario comentario = new DComentario();
            var lista = await comentario.Mostrar();
            return lista;

        }
        [HttpGet("{ID}")]
        public async Task<ActionResult<List<MComentario>>> Get_id(int ID)
        {
            DComentario comentario = new DComentario();
            var lista = await comentario.Mostrar_id(ID);
            return lista;
        }
    }
}
