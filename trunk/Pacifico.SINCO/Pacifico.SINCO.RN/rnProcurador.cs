using Pacifico.SINCO.EN;
using Pacifico.SINCO.AD;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class rnProcurador : rnBase
    {

        /// <summary>
        /// ListarProcurador
        /// </summary>
        /// <param name="pEnProcurador"></param>
        /// <returns></returns>
        public List<enProcurador> ListarProcurador(enProcurador pEnProcurador)
        {
            List<enProcurador> loEnProcurador = null;
            using (SqlConnection con = new SqlConnection(sConexion))
            {
                try
                {
                    con.Open();
                    adProcurador oAdProcurador = new adProcurador(con);
                    loEnProcurador = oAdProcurador.ListarProcurador(pEnProcurador);
                }
                catch (SqlException ex)
                {
                    loEnProcurador = null;
                    throw ex;
                }
            }
            return loEnProcurador;
        }

    }
}
