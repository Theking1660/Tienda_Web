using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MDireccion
    {
        public int Direccion_id { get; set; }
        public int Pais_id { get; set; }
        public int Ciudad_id { get; set; }
        [MaxLength(200)]
        public string Ubicacion { get; set; }
        [MaxLength(6)]
        public int Codigo_Postal { get; set; }
    }
}
