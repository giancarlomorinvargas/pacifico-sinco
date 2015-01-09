using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    interface IProductoAppService
    {

        MGProducto Obtener(int Id);
        List<MGProducto> Listar();
        List<MGProducto> Buscar(string Nombre);
    }
}
