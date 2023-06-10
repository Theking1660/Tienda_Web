namespace Tienda_Api.Models
{
    public class MVendedor
    {
        public int Vendedor_id { get; set; }
        public int Perfil_id { get; set; }
        public int Producto_id { get; set; }
        public decimal Precio { get; set; }
        public string Informacion { get; set; } 
    }
}
