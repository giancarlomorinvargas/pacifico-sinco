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

        private rnListaPrecio reglaNegocioListaPrecio;

        public wsListaPrecio()
         {
             reglaNegocioListaPrecio = new rnListaPrecio();
         }
        
        /* <summary>
        wsObtenerNombreWS
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
                 MSListaPrecio model = reglaNegocioListaPrecio.Obtener(Id);
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
                 List<MSListaPrecio> model = reglaNegocioListaPrecio.Listar();
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
                 List<MSListaPrecio> model = reglaNegocioListaPrecio.Buscar(MarcaId, ModeloId);
                 return new JavaScriptSerializer().Serialize(model);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }
    }
}
