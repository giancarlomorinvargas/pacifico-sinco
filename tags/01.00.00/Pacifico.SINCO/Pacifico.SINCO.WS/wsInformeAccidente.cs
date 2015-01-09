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
    public class wsInformeAccidente : IwsInformeAccidente
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
        
        
        private static string MENSAJE_NO_DISPONIBLE = "El Informe accidente vehicular no se encuentra disponible";


        IInformeAccidenteDAO _InformeAccidenteRepositorio;

        public wsInformeAccidente()
         {
             _InformeAccidenteRepositorio = new InformeAccidenteDAO();
         }


        public string Obtener(int Id)
         {
             MSInformeAccidente model = _InformeAccidenteRepositorio.Get(Id);
             if (model == null)
             {
                 throw new FaultException(MENSAJE_NO_DISPONIBLE);
             }


             //return model;
             return new JavaScriptSerializer().Serialize(model);
         }

        public string Listar()
         {
             List<MSInformeAccidente> listado;
             listado = _InformeAccidenteRepositorio.GetAll().ToList();
             return new JavaScriptSerializer().Serialize(listado);
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
