using MvcAppServicioCarga.Controllers.ServicioCarga;
using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class ProgramacionRutaAppService : IProgramacionRutaAppService
    {
        IProgramacionRutaDAO _ProgramacionRutaRepositorio;

        public ProgramacionRutaAppService(ProgramacionRutaDAO ProgramacionRutaDAO)
         {
             _ProgramacionRutaRepositorio = ProgramacionRutaDAO;
         }


         MGProgramacionRuta IProgramacionRutaAppService.Obtener(int Id)
         {
             MGProgramacionRuta model = _ProgramacionRutaRepositorio.Get(Id);
             if (model == null)
             {
                 throw new ValidationException("La ficha no se encuentra disponible");
             }


             return model;
         }

         List<MGProgramacionRuta> IProgramacionRutaAppService.Listar()
         {
             return _ProgramacionRutaRepositorio.GetAll().ToList();
         }

         List<MGProgramacionRuta> IProgramacionRutaAppService.Buscar(string UnidadTransporte)
         {
             List<MGProgramacionRuta> listado = new List<MGProgramacionRuta>();

             foreach (MGProgramacionRuta FichaCarga in _ProgramacionRutaRepositorio.GetAll().Where(
                 b => b.Vehiculo.Placa.Contains(UnidadTransporte)).ToList())
             {
                 listado.Add(FichaCarga);
             }
             return listado;
         }
    }
}
