using BaseDeDatos;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using BAL.Dominio;
using Microsoft.AspNetCore.Authorization;

namespace Midasoft.Controllers
{
    [Route("api/[controller]/[action]")]
    [Authorize]
    [ApiController]
    public class GeneroController : ControllerBase
    {
        private FamiliaresBAL bussinessAccessLogic = new FamiliaresBAL();

        // GET: api/<GeneroController>
        [HttpGet]
        [Route("Listar")]
        public dynamic Listargenero()
        {
            try
            {
                return bussinessAccessLogic.ListarGenero();
            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}
