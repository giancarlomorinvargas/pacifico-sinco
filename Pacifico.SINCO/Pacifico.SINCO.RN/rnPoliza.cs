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
    public class rnPoliza : rnBase
    {

        /// <summary>
        /// ListarPoliza
        /// </summary>
        /// <param name="pEnPoliza"></param>
        /// <returns></returns>
        public List<enPoliza> ListarPoliza(enPoliza pEnPoliza)
        {
            List<enPoliza> loEnPoliza = null;
            using (SqlConnection con = new SqlConnection(sConexion))
            {
                try
                {
                    con.Open();
                    adPoliza oAdPoliza = new adPoliza(con);
                    loEnPoliza = oAdPoliza.ListarPoliza(pEnPoliza);
                }
                catch (SqlException ex)
                {
                    loEnPoliza = null;
                    throw ex;
                }
            }
            return loEnPoliza;
        }

    }
}
