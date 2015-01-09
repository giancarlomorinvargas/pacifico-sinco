using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.Script.Serialization;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;

namespace Pacifico.SINCO.WS
{
    public class wsListaPrecio : IwsListaPrecio
    {

        /// <summary>
        /// wsObtenerNombreWS
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_ListaPrecio);
        }
        
        

        private static string MENSAJE_NO_DISPONIBLE = "La Lista de precios no se encuentra disponible";


        IListaPrecioDAO _ListaPrecioRepositorio;

        public wsListaPrecio()
         {
             _ListaPrecioRepositorio = new ListaPrecioDAO();
         }


        public string Obtener(int Id)
         {
             MSListaPrecio model = _ListaPrecioRepositorio.Get(Id);
             if (model == null)
             {
                 throw new FaultException(MENSAJE_NO_DISPONIBLE);
             }
             return new JavaScriptSerializer().Serialize(model);
             //return model;
         }

        public string Listar()
         {
             List<MSListaPrecio> result = _ListaPrecioRepositorio.GetAll().ToList();
             return new JavaScriptSerializer().Serialize(result);
         }

        public string Buscar(int MarcaId, int ModeloId)
         {
             List<MSListaPrecio> listado = new List<MSListaPrecio>();

             foreach (MSListaPrecio Model in _ListaPrecioRepositorio.GetAll().Where(
                 b => b.MP_Marca_Id == MarcaId && b.MP_Modelo_Id == ModeloId).ToList())
             {
                 listado.Add(Model);
             }
             return new JavaScriptSerializer().Serialize(listado);
         }
    }
}
