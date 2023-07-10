using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Threading.Tasks;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/imagenes")]
    public class Imagenes_PController: Controller
    {
        [HttpPost]
        public async Task<ActionResult> Post_I_P(IFormFile imagefile)
        {
            if(imagefile != null && imagefile.Length > 0)
            {
                string folderpath = Path.Combine(Directory.GetCurrentDirectory(), "Img");
                string fileName = Guid.NewGuid().ToString() + Path.GetExtension(imagefile.FileName);

                // Construir la ruta completa de la imagen
                string imagePath = Path.Combine(folderpath, fileName);

                using (var fileStream = new FileStream(imagePath,FileMode.Create,FileAccess.Write,FileShare.None, bufferSize: 4096, useAsync:true)) 
                {
                    await imagefile.CopyToAsync(fileStream);   
                }
                return Ok();
            }
            return BadRequest("No se ha proporcionado una imagen válida.");
        }
    }
}