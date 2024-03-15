using System;
using System.Collections.Generic;
using System.Text;

namespace BAL.DTO
{
    public class FamiliaresListarDTO
    {
        public int IdFamilia { get; set; }
        public int IdUsuario { get; set; }
        public string Nombres { get; set; }
        public string Apellidos { get; set; }
        public int Cedula { get; set; }
        public string DescripcionGenero { get; set; }
        public string DescripcionParentesco { get; set; }
        public int Edad { get; set; }
        public bool MenorEdad { get; set; }
        public DateTime? FechaNacimiento { get; set; }
    }
}
