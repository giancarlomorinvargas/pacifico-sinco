using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;

namespace Pacifico.SINCO.WS
{
    public class wsUtil : IwsUtil
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
        public List<enPoliza> ListarPoliza(enPoliza pEnPoliza)
        {
            List<enPoliza> loEnPoliza = null;
            try
            {
                rnPoliza oRnPoliza = new rnPoliza();
                loEnPoliza = oRnPoliza.ListarPoliza(pEnPoliza);
            }
            catch (Exception ex)
            {
                loEnPoliza = null;
                throw ex;
            }
            return loEnPoliza;
        }


        public List<enProcurador> ListarProcurador(enProcurador pEnProcurador)
        {
            List<enProcurador> loEnProcurador = null;
            try
            {
                rnProcurador oRnProcurador = new rnProcurador();
                loEnProcurador = oRnProcurador.ListarProcurador(pEnProcurador);
            }
            catch (Exception ex)
            {
                loEnProcurador = null;
                throw ex;
            }
            return loEnProcurador;
        }

        public bool ActualizaDisponibilidadProcurador(enProcurador pEnProcurador)
        {
            bool bExito = false;
            try
            {
                rnProcurador oRnProcurador = new rnProcurador();
                bExito = oRnProcurador.ActualizarDisponibilidadProcurador(pEnProcurador);
            }
            catch (Exception ex)
            {
                bExito = false;
                throw ex;
            }
            return bExito;
        }

    }
}
