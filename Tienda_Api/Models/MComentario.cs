using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MComentario
    {
        public int Comentario_id { get; set; }  
        public int Producto_id { get; set; }
        public int Perfil_id { get; set; }
        [MaxLength(5)]
        public Int16 Estrella { get; set; }
        public string? Comentario { get; set; }
    }
}
