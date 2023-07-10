using Microsoft.AspNetCore.Mvc;
using Tienda_Api.Datos;
using Tienda_Api.Models;
using Microsoft.AspNetCore.Http;
using System.IO;
using System.Threading.Tasks;
using static System.Net.Mime.MediaTypeNames;
using System.IO.Compression;

namespace Tienda_Api.Controllers
{
    [ApiController]
    [Route("/api/imagenes")]
    public class Imagenes_PController: Controller
    {
        [HttpPost]
        public async Task<ActionResult> Post_I_P(IFormFile imagefile,int ID)
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
                var mimagenes = new DImagenes_P();
                var lista = new MImagenes_P();
                lista.Imagen = imagePath;
                lista.Producto_id = ID;
                lista.Imagen_id = 0;
                await mimagenes.Insertar(lista);
                return Ok();
            }

            return BadRequest("No se ha proporcionado una imagen válida.");
        }
        [HttpGet("{Producto_id}")]
        public async Task<ActionResult> Get_I_P(int Producto_id)
        {
            DImagenes_P imagenes_P = new DImagenes_P();
            var images = await imagenes_P.Mostrar(Producto_id);
            if (images != null && images.Count > 0)
            {
                var imageBytesList = new List<byte[]>();
                foreach (var image in images)
                {
                    imageBytesList.Add(image.ImagenBytes);
                }
                return Ok(imageBytesList);
            }
            else
            {
                return NotFound();
            }

        }
    }
}