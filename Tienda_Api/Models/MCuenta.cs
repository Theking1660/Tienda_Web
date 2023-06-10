using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MCuenta
    {
        public int Cuenta_id { get; set; }
        public int Perfil_id { get; set; }
        public int MetodoP_id { get; set; }
        public int Direccion_id { get; set; }
        [StringLength(6)]
        public char Cuenta { get; set; }
        public DateTime Fecha_creacion { get; set; }
        public DateTime Fecha_actualizacion { get; set; }
    }
}
