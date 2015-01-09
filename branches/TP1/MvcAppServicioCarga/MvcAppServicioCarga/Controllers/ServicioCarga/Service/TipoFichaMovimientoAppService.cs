using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class TipoFichaMovimientoAppService : ITipoFichaMovimientoAppService
    {
        ITipoMovimientoDAO _TipoMovimientoRepositorio;

        public TipoFichaMovimientoAppService(TipoMovimientoDAO TipoMovimientoRepositorio)
        {
            _TipoMovimientoRepositorio = TipoMovimientoRepositorio;
        }


        public List<MGTipoMovimiento> ListarTipoMovimiento()
        {
            List<MGTipoMovimiento> Listado = _TipoMovimientoRepositorio.GetAll().ToList();
            return Listado;
        }

    }
}
