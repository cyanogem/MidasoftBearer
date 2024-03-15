using System;
using System.Collections.Generic;
using System.Text;

namespace BAL.DTO
{
    public class FamiliaresDTO
    {
        public int IdFamilia { get; set; }
        public int Usuario { get; set; }
        public string IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Cedula { get; set; }
        public int IdGenero { get; set; }
        public int IdParentesco { get; set; }
        public int Edad { get; set; }
        public int MenorEdad { get; set; }
        public DateTime? FechaNamcimiento { get; set; }
    }
}
