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
    public class ListaPrecioWS : IListaPrecioWS
    {

        private ListaPrecioRN reglaNegocioListaPrecio;

        public ListaPrecioWS()
         {
             reglaNegocioListaPrecio = new ListaPrecioRN();
         }
        
        /* <summary>
        ObtenerNombreWS
        </summary>
        <param name="value"></param>
        <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_ListaPrecio);
        }
        
        public string Obtener(int id)
         {
             try
             {
                 ListaPrecioEN model = reglaNegocioListaPrecio.Obtener(id);
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
                 List<ListaPrecioEN> model = reglaNegocioListaPrecio.Listar();
                 return new JavaScriptSerializer().Serialize(model);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Buscar(int marcaId, int modeloId)
         {
             try
             {
                 List<ListaPrecioEN> model = reglaNegocioListaPrecio.Buscar(marcaId, modeloId);
                 return new JavaScriptSerializer().Serialize(model);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }
    }
}
