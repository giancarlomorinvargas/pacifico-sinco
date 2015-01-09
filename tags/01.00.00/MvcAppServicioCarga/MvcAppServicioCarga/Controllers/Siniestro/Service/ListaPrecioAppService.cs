using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    public class ListaPrecioAppService : IListaPrecioAppService 
    {


        private static string MENSAJE_NO_DISPONIBLE = "La Lista de precios no se encuentra disponible";


        IListaPrecioDAO _ListaPrecioRepositorio;

        public ListaPrecioAppService()
         {
             _ListaPrecioRepositorio = new ListaPrecioDAO();
         }


        public MSListaPrecio Obtener(int Id)
         {
             MSListaPrecio model = _ListaPrecioRepositorio.Get(Id);
             if (model == null)
             {
                 throw new ValidationException(MENSAJE_NO_DISPONIBLE);
             }


             return model;
         }

        public List<MSListaPrecio> Listar()
         {
             return _ListaPrecioRepositorio.GetAll().ToList();
         }

        public List<MSListaPrecio> Buscar(int MarcaId, int ModeloId)
         {
             List<MSListaPrecio> listado = new List<MSListaPrecio>();

             foreach (MSListaPrecio Model in _ListaPrecioRepositorio.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             return listado;
         }
    }
}
