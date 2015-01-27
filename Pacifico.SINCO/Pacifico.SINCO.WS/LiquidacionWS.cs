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
    public class LiquidacionWS : ILiquidacionWS
    {

        /* <summary>
         ObtenerNombreWS
         </summary>
         <param name="value"></param>
         <returns></returns>*/
        public string ObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Liquidacion);
        }

        public LiquidacionWS()
         {
         }


        public string Obtener(int id)
         {
             try
             {
                 LiquidacionRN liquidacionRN = new LiquidacionRN();
                 LiquidacionEN model = liquidacionRN.Obtener(id);
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
                LiquidacionRN liquidacionRN = new LiquidacionRN();
                List<LiquidacionEN> listado = liquidacionRN.Listar();
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Buscar(string numLiquidacion, string tipoSiniestro, string fechaLiquidacion)
         {
            try
            {
                LiquidacionRN liquidacionRN = new LiquidacionRN();
                List<LiquidacionEN> listado = liquidacionRN.Buscar(numLiquidacion, tipoSiniestro, fechaLiquidacion);
                return new JavaScriptSerializer().Serialize(listado);
             }
             catch (Exception e)
             {
                 throw new FaultException(e.Message);
             }
         }

        public string Agregar(LiquidacionEN model)
        {
            try
            {
                LiquidacionRN liquidacionRN = new LiquidacionRN();
                return liquidacionRN.Agregar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

        public string Modificar(LiquidacionEN model)
        {
            try
            {
                LiquidacionRN liquidacionRN = new LiquidacionRN();
                return liquidacionRN.Modificar(model);
            }
            catch (Exception e)
            {
                throw new FaultException(e.Message);
            }
        }

    }
}
