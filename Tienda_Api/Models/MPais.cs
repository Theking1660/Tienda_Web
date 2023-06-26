using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MPais
    {
        [MaxLength(2)]
        [Required]
        public string Pais_id { get; set; }
        [MaxLength(100)]
        public string Pais { get; set; }
    }
}
