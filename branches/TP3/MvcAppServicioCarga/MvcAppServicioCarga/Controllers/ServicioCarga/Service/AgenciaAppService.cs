using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class AgenciaAppService : IAgenciaAppService
    {
        IAgenciaDAO _AgenciaRepositorio;

        public AgenciaAppService(AgenciaDAO AgenciaRepositorio)
        {
            _AgenciaRepositorio = AgenciaRepositorio;
        }
         

        public List<MGAgencia> ListarAgencia()
        {
            List<MGAgencia> listaAgencias = _AgenciaRepositorio.GetAll().ToList();
            return listaAgencias;
        }

    }
}
