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

         public string ObtenerPresupuesto(int Id)
        {
            try
            {
                MSPresupuesto model = reglaNegocioPresupuesto.ObtenerPresupuesto(Id);
                return new JavaScriptSerializer().Serialize(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

         public string AgregarPresupuesto(MSPresupuesto model)
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

         public string ModificarPresupuesto(MSPresupuesto model, List<MSDetallePresupuesto> detallePresupuesto)
        {
            try
            {
                return reglaNegocioPresupuesto.ModificarPresupuesto(model, detallePresupuesto);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }


         public string BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza, string FechaPresupuesto)
         {
             try
             {
                 List<MSPresupuesto> listaPresupuesto = reglaNegocioPresupuesto.BuscarPresupuesto(NumPresupuesto, NumInforme, NumPoliza, FechaPresupuesto);
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
                List<MSPresupuesto> listaPresupuesto = reglaNegocioPresupuesto.ListarPresupuesto();
                return new JavaScriptSerializer().Serialize(listaPresupuesto);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }


    }
}
