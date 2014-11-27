using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    interface IInformeAccidenteAppService
    {

        MSInformeAccidente Obtener(int Id);
        List<MSInformeAccidente> Listar();
        //List<MSInformeAccidente> Buscar(int MarcaId, int ModeloId);
    }
}
