using BAL.Dominio;
using BAL.DTO;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Midasoft.Controllers
{
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        private UsuarioBAL bussinessAccessLogic = new UsuarioBAL();
        private logBAL log = new logBAL();

        [HttpGet]
        [Route("ListarUsuario")]
        public dynamic ListarUsuario()
        {
            try
            {
                int user = 1; //se toma del token 

                return bussinessAccessLogic.ListarUsuarios();
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "ListarUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpPost]
        [Route("CrearUsuario")]
        public dynamic CrearUsuario(UsuarioDTO usuario)
        {
            try
            {

                var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

                return bussinessAccessLogic.CrearUsuario(usuario);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "CrearUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpPost]
        [Route("ActualizarUsuario")]
        public dynamic ActualizarUsuario(UsuarioDTO usuario)
        {
            try
            {

                var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

                return bussinessAccessLogic.ActualizarUsuario(usuario);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "ActualizarUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpGet]
        [Route("ObtenerUsuario")]
        public dynamic ObtenerUsuario(int IdUsuario)
        {
            try
            {

                var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

                return bussinessAccessLogic.ObtenerUsuario(IdUsuario);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "ObtenerUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpDelete]
        [Route("EliminarUsuario")]
        public dynamic EliminarUsuario(int IdUsuario)
        {
            try
            {

                var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

                return bussinessAccessLogic.EliminarUsuario(IdUsuario);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "EliminarUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }

        [HttpGet]
        [Route("ValidarUsuario")]
        public dynamic ValidarUsuario(string User)
        {
            try
            {

                return bussinessAccessLogic.ValidarUsuarios(User);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = 1;
                logDTO.Accion = "ValidarUsuario";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }

    }
}
