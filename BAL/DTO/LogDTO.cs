using System;
using System.Collections.Generic;
using System.Text;

namespace BAL.DTO
{
    public class LogDTO
    {
        public string IdUsuario { get; set; }
        public string Accion { get; set; }
        public string? Body { get; set; }
    }
}
