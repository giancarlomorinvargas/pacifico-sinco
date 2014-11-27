using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    interface IClienteAppService
    {

        MGCliente Obtener(int Id);
        List<MGCliente> Listar();
        List<MGCliente> Buscar(string Nombre);
    }
}
