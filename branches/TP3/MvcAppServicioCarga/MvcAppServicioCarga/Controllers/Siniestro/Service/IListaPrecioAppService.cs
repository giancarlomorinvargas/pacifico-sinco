using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    interface IListaPrecioAppService
    {

        MSListaPrecio Obtener(int Id);
        List<MSListaPrecio> Listar();
        List<MSListaPrecio> Buscar(int MarcaId, int ModeloId);
    }
}
