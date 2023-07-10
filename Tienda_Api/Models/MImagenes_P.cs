namespace Tienda_Api.Models
{
    public class MImagenes_P
    {
        public int Imagen_id { get; set; }
        public int Producto_id { get; set; }
        public string Imagen { get; set; }
        public byte[]? ImagenBytes { get; set; }
    }
}
