using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    interface IProgramacionRutaAppService
    {

        MGProgramacionRuta Obtener(int Id);
        List<MGProgramacionRuta> Listar();
        List<MGProgramacionRuta> Buscar(string UnidadTransporte);
    }
}
