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
                PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
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
                PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
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
                PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
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
                 PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
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
                PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
                List<PresupuestoEN> listaPresupuesto = reglaNegocioPresupuesto.ListarPresupuesto();
                return new JavaScriptSerializer().Serialize(listaPresupuesto);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }
         //CODIGO AGREGADO POR EDUARDO PASSANO CH. INICIO
         /*public string ListarPresupuestoPendiente()
         {
             try
             {
                 PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
                 List<PresupuestoPendienteCabeceraEN> listaPresupuesto = reglaNegocioPresupuesto.ListarPresupuestoPendiente();
                 return new JavaScriptSerializer().Serialize(listaPresupuesto);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }


         public string ObtenerPresupuestoDetalle(int Id)
         {
             try
             {
                 PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
                 List<PresupuestoPendienteDetalleEN> listaPresupuesto = new List<PresupuestoPendienteDetalleEN>();
                 //  public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)
                 //public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)
                 listaPresupuesto = reglaNegocioPresupuesto.ObtenerPresupuestoPendienteDetalle(Id);
                 return new JavaScriptSerializer().Serialize(listaPresupuesto);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

         public string ObtenerPresupuestoPendienteDetalle(int Id)
         {
             try
             {
                 PresupuestoRN reglaNegocioPresupuesto = new PresupuestoRN();
                 List<PresupuestoPendienteDetalleEN> listaPresupuesto = new List<PresupuestoPendienteDetalleEN>();
                 //  public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)
                 //public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)
                 listaPresupuesto = reglaNegocioPresupuesto.ObtenerPresupuestoPendienteDetalle(Id);
                 return new JavaScriptSerializer().Serialize(listaPresupuesto);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }*/
        //   public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)

        //CODIGO AGREGADO POR EDUARDO PASSANO CH. FIN
       
    }
}
