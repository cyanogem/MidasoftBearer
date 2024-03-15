using BAL.DTO;
using BaseDeDatos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using static System.Net.Mime.MediaTypeNames;

namespace BAL.Dominio
{
    public class UsuarioBAL : ConexionSQLServer
    {
        private logBAL log = new logBAL();
        #region Usuario
        public dynamic ListarUsuarios()
        {


            DataTable data = ConexionSQLServer.Listar("sp_ListUsuario");

            string jsongenero = JsonConvert.SerializeObject(data);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_ListUsuario";

            var resultado = new
            {
                success = true,
                message = "Exito",
                result = new
                {
                    Usuario = JsonConvert.DeserializeObject<List<UsuarioDTO>>(jsongenero)
                }
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }
        public dynamic CrearUsuario(UsuarioDTO usuario)
        {

            //validacion de cedula y usuario repetida 
            List<Parametro> cedula = new List<Parametro>
            {
                new Parametro("@cedula", usuario.Cedula.ToString()),
                new Parametro("@usuario", usuario.Contraseña.ToString())
            };
            DataTable validacioncedula = Listar("sp_ValidarCedulaUsuario", cedula);

            if (validacioncedula.Rows.Count > 1)
            {
                return new
                {
                    success = true,
                    message = "La cedula del Usuario ya esta registrada",
                    result = new
                    {
                    }
                };
            }

            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@usuario", usuario.Usuario.ToString()),
                new Parametro("@contraseña", usuario.Contraseña.ToString()),
                new Parametro("@nombres", usuario.Nombres),
                new Parametro("@apellido", usuario.Apellido),
                new Parametro("@cedula", usuario.Cedula.ToString()),
                new Parametro("@telefono", usuario.Telefono.ToString()),
                new Parametro("@activo", usuario.Activo.ToString()),

            };

            bool resultadop = Ejecutar("sp_InsertUsuario", lista);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_InsertUsuario";

            var resultado = new
            {
                success = resultadop,
                message = resultadop ? "Exito" : "Error al guardar",
                result = ""
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }
        public dynamic ActualizarUsuario(UsuarioDTO usuario)
        {

            //validacion de cedula y usuario repetida 
            List<Parametro> cedula = new List<Parametro>
            {
                new Parametro("@cedula", usuario.Cedula.ToString()),
                new Parametro("@usuario", usuario.Contraseña.ToString())
            };
            DataTable validacioncedula = Listar("sp_ValidarCedulaUsuario", cedula);

            if (validacioncedula.Rows.Count > 2)
            {
                return new
                {
                    success = true,
                    message = "La cedula del Usuario ya esta registrada",
                    result = new
                    {
                    }
                };
            }

            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idusuario", usuario.Usuario.ToString()),
                new Parametro("@usuario", usuario.Usuario.ToString()),
                new Parametro("@contraseña", usuario.Contraseña.ToString()),
                new Parametro("@nombres", usuario.Nombres),
                new Parametro("@apellido", usuario.Apellido),
                new Parametro("@cedula", usuario.Cedula.ToString()),
                new Parametro("@telefono", usuario.Telefono.ToString()),
                new Parametro("@activo", usuario.Activo.ToString()),

            };

            bool resultadop = Ejecutar("sp_UpdateUsuario", lista);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_UpdateUsuario";

            var resultado = new
            {
                success = resultadop,
                message = resultadop ? "Exito" : "Error al guardar",
                result = ""
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }
        public dynamic EliminarUsuario(int idusuario)
        {
            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idUsuario", idusuario.ToString())
            };

            bool resultadop = Ejecutar("sp_DeleteUsuario", lista);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_UpdateUsuario";

            var resultado = new
            {
                success = resultadop,
                message = resultadop ? "Exito" : "Error al Eliminar",
                result = ""
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }
        public dynamic ObtenerUsuario(int idusuario)
        {
            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idUsuario", idusuario.ToString())
            };

            DataTable data = Listar("sp_GetUsuario", lista);

            string jsongenero = JsonConvert.SerializeObject(data);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_UpdateUsuario";

            var resultado = new
            {
                success = true,
                message = "Exito",
                result = new
                {
                    familiares = JsonConvert.DeserializeObject<List<UsuarioDTO>>(jsongenero)
                }
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }

        public dynamic ValidarUsuarios(string User)
        {
            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@usuario", User.ToString())
            };
            var data = ConexionSQLServer.Listar("sp_ValidarLoginUsuario", lista);


            UsuarioDTO usuario = new UsuarioDTO();
            foreach (DataRow r in data.Rows)
            {
                usuario.IdUsuario = Convert.ToInt32(r[0].ToString().Trim());
                usuario.Usuario = r[1].ToString().Trim();
                usuario.Contraseña = r[2].ToString().Trim();
            }

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_ValidarLoginUsuario";

            logDTO.Body = "Resultado";
            log.CrearLog(logDTO);

            return usuario;
        }
        #endregion
    }
}
