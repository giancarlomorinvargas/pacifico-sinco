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

        /* <summary>
         wsObtenerNombreWS
         </summary>
         <param name="value"></param>
         <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_ListaPrecio);
        }
        
        private rnInformeAccidente reglaNegocioInformeAccidente;

        public wsInformeAccidente()
         {
             reglaNegocioInformeAccidente = new rnInformeAccidente();
         }


        public string Obtener(int Id)
         {
             try
             {
                 MSInformeAccidente model = reglaNegocioInformeAccidente.Obtener(Id);
                 return new JavaScriptSerializer().Serialize(model);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Listar()
        {
            try
            {
                List<MSInformeAccidente> listado = reglaNegocioInformeAccidente.Listar();
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
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
