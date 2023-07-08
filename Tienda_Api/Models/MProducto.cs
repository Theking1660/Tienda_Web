using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MProducto
    {
        public int Producto_id { get; set; }
        public int Categoria_id { get; set; }
        [MaxLength(100)]
        public string Producto { get; set;}
        
        public decimal Precio { get; set;}
        public decimal? Descuento { get; set;}
        public  int Cantidad { get; set;}
    }
}
