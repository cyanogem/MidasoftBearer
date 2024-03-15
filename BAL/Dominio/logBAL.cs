using BAL.DTO;
using BaseDeDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace BAL.Dominio
{
    public class logBAL : ConexionSQLServer
    {
        public dynamic CrearLog(LogDTO log)
        {

            //validacion de cedula y usuario repetida 
            List<Parametro> logp = new List<Parametro>
            {
                new Parametro("@idUsuario", log.IdUsuario.ToString()),
                new Parametro("@accion", log.Accion.ToString()),
                new Parametro("@body", log.Body.ToString())
            };


            bool resultado = Ejecutar("sp_InsertLog", logp);

            return new
            {

            };
        }
    }
}
