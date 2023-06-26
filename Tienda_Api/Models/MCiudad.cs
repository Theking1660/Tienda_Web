using System.ComponentModel.DataAnnotations;
using System.Runtime.InteropServices;

namespace Tienda_Api.Models
{
    public class MCiudad
    {
        public int ID { get; set; }
        [MaxLength(2)]
        public char Ciudad_id { get; set; }
        [MaxLength(2)]
        public char Pais_id { get; set; }
        [MaxLength(100)]
        public string Ciudad { get; set;}
    }
}
