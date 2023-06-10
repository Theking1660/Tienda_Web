using System.ComponentModel.DataAnnotations;

namespace Tienda_Api.Models
{
    public class MTipo_Perfil
    {
        public int Tipo_perfil_id { get; set; }
        [MaxLength(10)]
        public string Tipo_perfil { get; set;}
    }
}
