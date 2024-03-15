using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Midasoft.Models;

using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using BAL.Dominio;
using BAL.DTO;

namespace Midasoft.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AutenticacionController : ControllerBase
    {
        private UsuarioBAL bussinessAccessLogic = new UsuarioBAL();
        private readonly string secretKey;

        public AutenticacionController(IConfiguration config)
        {
            secretKey = config.GetSection("settings").GetSection("secretkey").ToString();
        }

        [HttpPost]
        [Route("Validar")]
        public IActionResult Validar([FromBody] Usuario request)
        {
             UsuarioDTO usuario = new UsuarioDTO();
             usuario = bussinessAccessLogic.ValidarUsuarios(request.User);

            if (usuario == null)
            {
                return StatusCode(StatusCodes.Status200OK, new { Mesaje = "Contraseña incorrecta" });
            }

            if (request.User == usuario.Usuario && request.Conraseña == usuario.Contraseña)
            {

                var keyBytes = Encoding.ASCII.GetBytes(secretKey);
                var claims = new ClaimsIdentity();
                claims.AddClaim(new Claim("Usuario", request.User));
                claims.AddClaim(new Claim("IdUsuario", usuario.IdUsuario.ToString()));

                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claims,
                    Expires = DateTime.UtcNow.AddMinutes(10),
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);

                string tokencreado = tokenHandler.WriteToken(tokenConfig);


                return StatusCode(StatusCodes.Status200OK, new { token = tokencreado });

            }
            else
            {

                return StatusCode(StatusCodes.Status401Unauthorized, new { token = "" });
            }

        }
    }
}
