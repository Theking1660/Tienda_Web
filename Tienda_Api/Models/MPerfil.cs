using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;

namespace Tienda_Api.Models
{
    public class MPerfil
    {
        public int Perfil_id { get; set; }
        public int Tipo_perfil_id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        [StringLength(13)]
        public int Numero { get; set; }
        public string Correo { get; set; }
        public string Contraseña { get; set; }
        public DateTime Fecha_Nacimiento { get; set; }
        public bool? ActivacionDP { get; set; }
        public bool? Membresia { get; set; }
        public DateTime Fecha_creacion { get; set; }

    }
}
