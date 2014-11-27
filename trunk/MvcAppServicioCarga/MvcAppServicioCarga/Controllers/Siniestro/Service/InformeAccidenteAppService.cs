using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    public class InformeAccidenteAppService : IInformeAccidenteAppService 
    {


        private static string MENSAJE_NO_DISPONIBLE = "El Informce accidente vehicular no se encuentra disponible";


        IInformeAccidenteDAO _InformeAccidenteRepositorio;

        public InformeAccidenteAppService()
         {
             _InformeAccidenteRepositorio = new InformeAccidenteDAO();
         }


        public MSInformeAccidente Obtener(int Id)
         {
             MSInformeAccidente model = _InformeAccidenteRepositorio.Get(Id);
             if (model == null)
             {
                 throw new ValidationException(MENSAJE_NO_DISPONIBLE);
             }


             return model;
         }

        public List<MSInformeAccidente> Listar()
         {
             return _InformeAccidenteRepositorio.GetAll().ToList();
         }

        /*public List<MSInformeAccidente> Buscar(int MarcaId, int ModeloId)
         {
             List<MSInformeAccidente> listado = new List<MSInformeAccidente>();

             foreach (MSInformeAccidente Model in _InformeAccidenteRepositorio.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             return listado;
         }*/
    }
}
