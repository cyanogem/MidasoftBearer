using BAL.DTO;
using BaseDeDatos;
using System;
using System.Collections.Generic;
using System.Data;
using Newtonsoft.Json;

namespace BAL.Dominio
{
    public class FamiliaresBAL : ConexionSQLServer
    {
        private logBAL log = new logBAL();
        public dynamic ListarGenero()
        {
            DataTable genero = ConexionSQLServer.Listar("sp_ListGenero");

            string jsongenero = JsonConvert.SerializeObject(genero);


            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = "1";
            logDTO.Accion = "sp_ListGenero";

            var resultado = new
            {
                success = true,
                message = "Exito",
                result = new
                {
                    genero = JsonConvert.DeserializeObject<List<GeneroDTO>>(jsongenero)
                }
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;

        }

        #region Familiar
        public dynamic ListarFamiliares(string user)
        {


            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@IdUsuario", user)
            };

            DataTable data = ConexionSQLServer.Listar("sp_ListFamiliar", lista);

            string jsongenero = JsonConvert.SerializeObject(data);


            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = user;
            logDTO.Accion = "sp_ListFamiliar";
            var resultado = new
            {
                success = true,
                message = "Exito",
                result = new
                {
                    familiares = JsonConvert.DeserializeObject<List<FamiliaresListarDTO>>(jsongenero)
                }
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);

            return resultado;
        }
        public dynamic CrearFamiliar(FamiliaresDTO familiares)
        {
            //validacion de menor de edad
            if (familiares.Edad >= 18)
            {
                familiares.FechaNamcimiento = null;
                familiares.MenorEdad = 0;
                //validacion fecha nacmiento requerida
                if (familiares.FechaNamcimiento != null)
                {
                    return new
                    {
                        success = true,
                        message = "La fecha de nacimiento es requerida",
                        result = new
                        {
                        }
                    };
                }

            }
            else
            {
                familiares.MenorEdad = 1;

            }

            //validacion de cedula repetida 
            List<Parametro> cedula = new List<Parametro>
            {
                new Parametro("@cedula", familiares.Cedula.ToString())
            };
            DataTable validacioncedula = Listar("sp_ValidarCedulaFamiliar", cedula);

            if (validacioncedula.Rows.Count > 1)
            {
                return new
                {
                    success = true,
                    message = "La cedula del familiar ya esta registrada",
                    result = new
                    {
                    }
                };
            }

            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idUsuario", familiares.Usuario.ToString()),
                new Parametro("@cedula", familiares.Cedula.ToString()),
                new Parametro("@nombres", familiares.Nombre),
                new Parametro("@apellidos", familiares.Apellido),
                new Parametro("@idgenero", familiares.IdGenero.ToString()),
                new Parametro("@idparentesco", familiares.IdParentesco.ToString()),
                new Parametro("@edad", familiares.Edad.ToString()),
                new Parametro("@menoredad", familiares.MenorEdad.ToString()),
                new Parametro("@fechanacimiento", String.Format("{0:MM/dd/yyyy}", familiares.FechaNamcimiento)),

            };

            bool resultadoP = Ejecutar("sp_InsertFamiliar", lista);


            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = familiares.IdUsuario;
            logDTO.Accion = "sp_InsertFamiliar";
            var resultado =  new
            {
                success = resultadoP,
                message = resultadoP ? "Exito" : "Error al guardar",
                result = ""
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);
            return resultado;
        }
        public dynamic ActualizarFamiliar(FamiliaresDTO familiares)
        {
            //validacion de menor de edad
            if (familiares.Edad >= 18)
            {
                familiares.FechaNamcimiento = null;
                familiares.MenorEdad = 0;
                //validacion fecha nacmiento requerida
                if (familiares.FechaNamcimiento != null)
                {
                    return new
                    {
                        success = true,
                        message = "La fecha de nacimiento es requerida",
                        result = new
                        {
                        }
                    };
                }

            }
            else
            {
                familiares.MenorEdad = 1;

            }

            //validacion de cedula repetida 
            List<Parametro> cedula = new List<Parametro>
            {
                new Parametro("@cedula", familiares.Cedula.ToString())
            };
            DataTable validacioncedula = Listar("sp_ValidarCedulaFamiliar", cedula);

            if (validacioncedula.Rows.Count > 2)
            {
                return new
                {
                    success = true,
                    message = "La cedula del familiar ya esta registrada",
                    result = new
                    {
                    }
                };
            }

            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idfamiliar", familiares.IdFamilia.ToString()),
                new Parametro("@idUsuario", familiares.Usuario.ToString()),
                new Parametro("@cedula", familiares.Cedula.ToString()),
                new Parametro("@nombres", familiares.Nombre),
                new Parametro("@apellidos", familiares.Apellido),
                new Parametro("@idgenero", familiares.IdGenero.ToString()),
                new Parametro("@idparentesco", familiares.IdParentesco.ToString()),
                new Parametro("@edad", familiares.Edad.ToString()),
                new Parametro("@menoredad", familiares.MenorEdad.ToString()),
                new Parametro("@fechanacimiento", String.Format("{0:MM/dd/yyyy}", familiares.FechaNamcimiento)),

            };

            bool resultadop = Ejecutar("sp_UpdateFamiliar", lista);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = familiares.IdUsuario;
            logDTO.Accion = "sp_UpdateFamiliar";
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
        public dynamic EliminarFamiliar(int idfamiliar, string user)
        {
            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idfamiliar", idfamiliar.ToString())
            };

            bool resultadop = Ejecutar("sp_DeleteFamiliar", lista);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = user;
            logDTO.Accion = "sp_DeleteFamiliar";
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
        public dynamic ObtenerFamiliar(int idfamiliar, string user)
        {
            List<Parametro> lista = new List<Parametro>
            {
                new Parametro("@idfamiliar", idfamiliar.ToString())
            };

            DataTable data = ConexionSQLServer.Listar("sp_GetFamiliar", lista);

            string jsongenero = JsonConvert.SerializeObject(data);

            LogDTO logDTO = new LogDTO();
            logDTO.IdUsuario = user;
            logDTO.Accion = "sp_GetFamiliar";
            var resultado = new
            {
                success = true,
                message = "Exito",
                result = new
                {
                    familiares = JsonConvert.DeserializeObject<List<FamiliaresListarDTO>>(jsongenero)
                }
            };
            logDTO.Body = "Resultado" + resultado.message + " " + resultado.success;
            log.CrearLog(logDTO);
            return resultado;
        }
        #endregion

    }

}

