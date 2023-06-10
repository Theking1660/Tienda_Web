using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MMetodo_Pago
    {
        public int MetodoP_id { get; set; }
        [MaxLength(25)]
        public string Metodo { get; set; }
    }
}
