using MvcAppServicioCarga.Controllers.ServicioCarga;
using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class ProductoServiceAppService : IProductoAppService 
    {
        IProductoDAO _ProductoRepositorio;

        public ProductoServiceAppService(ProductoDAO ProductoDAO)
         {
             _ProductoRepositorio = ProductoDAO;
         }


        public MGProducto Obtener(int Id)
         {
             MGProducto model = _ProductoRepositorio.Get(Id);
             if (model == null)
             {
                 throw new ValidationException("La ficha no se encuentra disponible");
             }


             return model;
         }

        public List<MGProducto> Listar()
         {
             return _ProductoRepositorio.GetAll().ToList();
         }

        public List<MGProducto> Buscar(string Nombre)
         {
             List<MGProducto> listado = new List<MGProducto>();

             foreach (MGProducto Model in _ProductoRepositorio.GetAll().Where(
                 b => b.Descripcion.Contains(Nombre)).ToList())
             {
                 listado.Add(Model);
             }
             return listado;
         }
    }
}
