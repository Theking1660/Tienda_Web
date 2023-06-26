using System.ComponentModel.DataAnnotations;
using System.Runtime.InteropServices;

namespace Tienda_Api.Models
{
    public class MCiudad
    {
        public int ID { get; set; }
        [MaxLength(2)]
        public string Ciudad_id { get; set; }
        [MaxLength(2)]
        public string Pais_id { get; set; }
        [MaxLength(100)]
        public string Ciudad { get; set;}
    }
}
