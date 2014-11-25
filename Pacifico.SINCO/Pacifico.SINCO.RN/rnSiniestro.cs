using Pacifico.SINCO.AD;
using Pacifico.SINCO.EN;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class rnSiniestro : rnBase
    {

        /// <summary>
        /// ListarSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public List<enSiniestro> ListarSiniestro(enSiniestro pEnSiniestro)
        {
            List<enSiniestro> loEnSiniestro = null;
            using (SqlConnection con = new SqlConnection(sConexion))
            {
                try
                {
                    con.Open();
                    adSiniestro oAdSiniestro = new adSiniestro(con);
                    loEnSiniestro = oAdSiniestro.ListarSiniestro(pEnSiniestro);
                }
                catch (SqlException ex)
                {
                    loEnSiniestro = null;
                    throw ex;
                }
            }
            return loEnSiniestro;

        }

        /// <summary>
        /// IngresarSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public bool IngresarSiniestro(enSiniestro pEnSiniestro)
        {
            bool bExito = false;
            using (SqlConnection con = new SqlConnection(sConexion))
            {
                try
                {
                    con.Open();
                    adSiniestro oAdSiniestro = new adSiniestro(con);
                    bExito = oAdSiniestro.IngresarSiniestro(pEnSiniestro);
                }
                catch (SqlException ex)
                {
                    bExito = false;
                    throw ex;
                }
            }
            return bExito;

        }

    }
}
