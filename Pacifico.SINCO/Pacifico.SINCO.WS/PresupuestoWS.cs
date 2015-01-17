using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WS
{
    public class PresupuestoWS : IPresupuestoWS
    {

        
        private rnPresupuesto reglaNegocioPresupuesto;


        public PresupuestoWS()
         {
             reglaNegocioPresupuesto = new rnPresupuesto();
         }

        /* <summary>
         ObtenerNombreWS
         </summary>
         <param name="value"></param>
         <returns></returns> */
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Presupuesto);
        }

         public string ObtenerPresupuesto(int id)
        {
            try
            {
                PresupuestoEN model = reglaNegocioPresupuesto.ObtenerPresupuesto(id);
                return new JavaScriptSerializer().Serialize(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

         public string AgregarPresupuesto(PresupuestoEN model)
        {
            try
            {
                return reglaNegocioPresupuesto.AgregarPresupuesto(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

         public string ModificarPresupuesto(PresupuestoEN model, List<DetallePresupuestoEN> detalle)
        {
            try
            {
                return reglaNegocioPresupuesto.ModificarPresupuesto(model, detalle);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }


         public string BuscarPresupuesto(string numPresupuesto, string numInforme, string numPoliza, string fechaPresupuesto)
         {
             try
             {
                 List<PresupuestoEN> listaPresupuesto = reglaNegocioPresupuesto.BuscarPresupuesto(numPresupuesto, numInforme, numPoliza, fechaPresupuesto);
                 return new JavaScriptSerializer().Serialize(listaPresupuesto);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

         public string ListarPresupuesto()
        {
            try
            {
                List<PresupuestoEN> listaPresupuesto = reglaNegocioPresupuesto.ListarPresupuesto();
                return new JavaScriptSerializer().Serialize(listaPresupuesto);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }


    }
}
