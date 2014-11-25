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
    public class wsSiniestro : IwsSiniestro
    {

        /// <summary>
        /// wsObtenerNombreWS
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Siniestro);
        }

        /// <summary>
        /// ListarSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public List<enSiniestro> ListarSiniestro(enSiniestro pEnSiniestro)
        {
            List<enSiniestro> loEnSiniestro = null;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                loEnSiniestro = oRnSiniestro.ListarSiniestro(pEnSiniestro);
            }
            catch (Exception ex)
            {
                loEnSiniestro = null;
                throw ex;
            }
            return loEnSiniestro;
        }


        public bool IngresarSiniestro(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            try
            {
                rnSiniestro oRnSiniestro = new rnSiniestro();
                bExito = oRnSiniestro.IngresarSiniestro(pEnSiniestro);
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