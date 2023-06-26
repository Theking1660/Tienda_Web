using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MCupones
    {
        public int Cupones_id { get; set; }
        public int Producto_id { get; set; }
        [MaxLength(6)]
        public string Codigo { get; set; }
        public decimal Descuento { get; set; }  
        public bool Activado { get; set; }
        public DateTime Fecha_inicio { get; set; }
        public DateTime Fecha_fin { get; set; }
        public DateTime Fecha_creacion { get; set; }
    }
}
