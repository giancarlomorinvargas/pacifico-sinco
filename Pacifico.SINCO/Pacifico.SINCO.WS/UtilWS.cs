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
    public class UtilWS : IUtilWS
    {
        /*<summary>
        ObtenerNombreWS
        </summary>
        <param name="value"></param>
        <returns></returns>*/
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Util);
        }

        /*<summary>
        ListarPoliza
        </summary>
        <param name="pEnPoliza"></param>
        <returns></returns>*/
        public string ListarPoliza()
        {
            try
            {
                PolizaRN polizaRN = new PolizaRN();
                List<PolizaEN>  listado = polizaRN.Listar();
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string BuscarPoliza(string dniAsegurado, string numPoliza, string placa)
        {
            try
            {
                PolizaRN polizaRN = new PolizaRN();
                List<PolizaEN> listado = polizaRN.Buscar(dniAsegurado, numPoliza, placa);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }


        public string ListarProcurador()
        {
            try
            {
                ProcuradorRN procuradorRN = new ProcuradorRN();
                List<ProcuradorEN> listado = procuradorRN.Listar();
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }


        public string BuscarProcurador(string numProcurador, string procurador)
        {
            try
            {
                ProcuradorRN procuradorRN = new ProcuradorRN();
                List<ProcuradorEN> listado = procuradorRN.Buscar(numProcurador, procurador);
                return new JavaScriptSerializer().Serialize(listado);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string ActualizaDisponibilidadProcurador(ProcuradorEN pEnProcurador)
        {
            try
            {
                ProcuradorRN procuradorRN = new ProcuradorRN();
                return procuradorRN.ActualizarDisponibilidad(pEnProcurador);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

        public string ObtenerProcurador(int id)
        {
            try
            {
                ProcuradorRN procuradorRN = new ProcuradorRN();
                ProcuradorEN procurador = procuradorRN.Obtener(id);
                return new JavaScriptSerializer().Serialize(procurador);
            }
            catch (Exception ex)
            {
                throw new FaultException(ex.Message);
            }
        }

    }
}
