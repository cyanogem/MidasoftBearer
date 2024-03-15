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
    public class FamiliaresController : ControllerBase
    {
        private FamiliaresBAL bussinessAccessLogic = new FamiliaresBAL();
        private logBAL log = new logBAL();

        [HttpGet]
        [Route("ListarFamiliares")]
        public dynamic ListarFamiliares()
        {
            var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("IdUsuario", StringComparison.InvariantCultureIgnoreCase));//
            try
            {

                return bussinessAccessLogic.ListarFamiliares(UserName.Value);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = UserName.Value;
                logDTO.Accion = "Listar";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpPost]
        [Route("CrearFamiliar")]
        public dynamic CrearFamiliares(FamiliaresDTO familiares)
        {
            var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("IdUsuario", StringComparison.InvariantCultureIgnoreCase));//

            try
            {
                familiares.IdUsuario = UserName.Value;
                return bussinessAccessLogic.CrearFamiliar(familiares);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = UserName.Value;
                logDTO.Accion = "CrearFamiliar";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpPost]
        [Route("ActualizarFamiliar")]
        public dynamic ActualizarFamiliares(FamiliaresDTO familiares)
        {
            var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("IdUsuario", StringComparison.InvariantCultureIgnoreCase));//
            try
            {
                familiares.IdUsuario = UserName.Value;
                return bussinessAccessLogic.ActualizarFamiliar(familiares);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = UserName.Value;
                logDTO.Accion = "ActualizarFamiliar";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpGet]
        [Route("ObtenerFamiliar")]
        public dynamic ObtenerFamiliar(int IdFamiliar)
        {
            var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

            try
            {
                return bussinessAccessLogic.ObtenerFamiliar(IdFamiliar, UserName.Value);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = UserName.Value;
                logDTO.Accion = "ObtenerFamiliar";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
        [HttpDelete]
        [Route("EliminarFamiliar")]
        public dynamic EliminarFamiliar(int IdFamiliar)
        {
            var UserName = User.Claims.FirstOrDefault(x => x.Type.Equals("userName", StringComparison.InvariantCultureIgnoreCase));//

            try
            {
                return bussinessAccessLogic.EliminarFamiliar(IdFamiliar, UserName.Value);
            }
            catch (Exception ex)
            {

                LogDTO logDTO = new LogDTO();
                logDTO.IdUsuario = UserName.Value;
                logDTO.Accion = "EliminarFamiliar";
                logDTO.Body = ex.Message;
                log.CrearLog(logDTO);

                throw ex;
            }

        }
    }
}
