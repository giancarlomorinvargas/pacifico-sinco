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

        private rnListaPrecio reglaNegocioListaPrecio;

        public ListaPrecioWS()
         {
             reglaNegocioListaPrecio = new rnListaPrecio();
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
        
        public string Obtener(int Id)
         {
             try
             {
                 ListaPrecioEN model = reglaNegocioListaPrecio.Obtener(Id);
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

        public string Buscar(int MarcaId, int ModeloId)
         {
             try
             {
                 List<ListaPrecioEN> model = reglaNegocioListaPrecio.Buscar(MarcaId, ModeloId);
                 return new JavaScriptSerializer().Serialize(model);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }
    }
}
