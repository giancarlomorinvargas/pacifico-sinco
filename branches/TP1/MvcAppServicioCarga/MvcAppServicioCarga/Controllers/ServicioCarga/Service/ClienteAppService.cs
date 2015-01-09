using MvcAppServicioCarga.Controllers.ServicioCarga;
using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class ClienteServiceAppService : IClienteAppService 
    {
        IClienteDAO _ClienteRepositorio;

        public ClienteServiceAppService(ClienteDAO ClienteDAO)
         {
             _ClienteRepositorio = ClienteDAO;
         }


        public MGCliente Obtener(int Id)
         {
             MGCliente model = _ClienteRepositorio.Get(Id);
             if (model == null)
             {
                 throw new ValidationException("La ficha no se encuentra disponible");
             }


             return model;
         }

        public List<MGCliente> Listar()
         {
             return _ClienteRepositorio.GetAll().ToList();
         }

        public List<MGCliente> Buscar(string Nombre)
         {
             List<MGCliente> listado = new List<MGCliente>();

             foreach (MGCliente Model in _ClienteRepositorio.GetAll().Where(
                 b => b.Nombres.Contains(Nombre)).ToList())
             {
                 listado.Add(Model);
             }
             return listado;
         }
    }
}
