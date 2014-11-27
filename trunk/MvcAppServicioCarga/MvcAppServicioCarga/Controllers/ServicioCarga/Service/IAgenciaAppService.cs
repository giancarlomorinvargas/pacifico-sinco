using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.ServicioCarga
{
    interface IAgenciaAppService
    {
        List<MGAgencia> ListarAgencia();
    }
}
