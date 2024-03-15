using System;
using System.Collections.Generic;
using System.Text;

namespace BAL.DTO
{
    public class UsuarioDTO
    {
        public int IdUsuario { get; set; }
        public string Usuario { get; set; }
        public string Contraseña { get; set; }
        public string Nombres { get; set; }
        public string Apellido { get; set; }
        public int Cedula { get; set; }
        public string Telefono { get; set; }
        public bool Activo { get; set; }
    }
}
