using System.Runtime.CompilerServices;

namespace Tienda_Api.Models
{
    public class MPedido
    {
        public int Pedido_id { get; set; }
        public int Cuenta_id { get; set; }
        public int Producto_id { get; set; }
        public int Metodo_id { get; set; }
        public int Direccion_id { get; set; }
        public string Pedido { get; set; }
        public decimal  Precio_total {get;set ;}
        public decimal Precio_envio { get; set; }
        public decimal ITBIS { get; set; }
        public decimal? Descuento { get; set; }
        public DateTime Fpedido_realizado { get; set; }
        public DateTime FPEDIDO_enviado { get; set; }
        public bool? Reembolsado { get; set; }
    }
}
