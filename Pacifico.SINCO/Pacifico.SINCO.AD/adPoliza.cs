using Pacifico.SINCO.EN;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.AD
{
    public class adPoliza : adBase
    {   

        public adPoliza(SqlConnection con)
        {
            conexion = con;
        }


        /// <summary>
        /// ListarPoliza
        /// </summary>
        /// <param name="pEnPoliza"></param>
        /// <returns></returns>
        public List<enPoliza> ListarPoliza(enPoliza pEnPoliza)
        {
            try
            {

                List<enPoliza> loEnPoliza = null;
                enPoliza oEnPoliza = null;

                using (SqlCommand cmd = new SqlCommand("SELECT MP_Poliza_Id, NumPoliza, FechaInicio, FechaFin, MontoCobertura, Tipo, UsuarioRegistro, FechaRegistro, UsuarioModifico, FechaModifico, a.MP_Asegurado_ID, MP_Vehiculo_ID, a.ApellidoPaterno + ' ' + a.ApellidoMaterno + ', '+ a.Nombre as NombreAsegurado FROM MP_Poliza p, MP_Asegurado a WHERE p.MP_Asegurado_ID = a.MP_Asegurado_Id", conexion))
                {
                    //cmd.CommandType = CommandType.;
                    using (SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult))
                    {

                        if (drd != null)
                        {
                            loEnPoliza = new List<enPoliza>();
                            while (drd.Read())
                            {
                                oEnPoliza = new enPoliza();
                                oEnPoliza.MP_Poliza_Id = drd.GetInt32(0);
                                oEnPoliza.NumPoliza = drd.GetString(1);
                                oEnPoliza.FechaInicio = !drd.IsDBNull(2) ? drd.GetDateTime(2) : DateTime.Parse("01/01/1753");
                                oEnPoliza.FechaFin = !drd.IsDBNull(3) ? drd.GetDateTime(3) : DateTime.Parse("01/01/1753");
                                oEnPoliza.MontoCobertura = !drd.IsDBNull(4) ? drd.GetFloat(4) : 0;
                                oEnPoliza.Tipo = !drd.IsDBNull(5) ? drd.GetString(5) : "";

                                oEnPoliza.UsuarioRegistro = !drd.IsDBNull(6) ? drd.GetString(6) : "";
                                oEnPoliza.FechaRegistro = !drd.IsDBNull(7) ? drd.GetDateTime(7) : DateTime.Parse("01/01/1753");
                                oEnPoliza.UsuarioModifico = !drd.IsDBNull(8) ? drd.GetString(8) : "";
                                oEnPoliza.FechaModifico = !drd.IsDBNull(9) ? drd.GetDateTime(9) : DateTime.Parse("01/01/1753");

                                oEnPoliza.MP_Asegurado_ID = !drd.IsDBNull(10) ? drd.GetInt32(10) : 0;
                                oEnPoliza.MP_Vehiculo_ID = !drd.IsDBNull(11) ? drd.GetInt32(11) : 0;

                                oEnPoliza.NombreAsegurado = !drd.IsDBNull(12) ? drd.GetString(12) : "";
                                
                                loEnPoliza.Add(oEnPoliza);
                            }
                            drd.Close();
                        }
                        return loEnPoliza;

                    }//using-SqlDataReader                

                }//using-SqlCommand                

            }
            catch (Exception ex)
            {                
                throw ex;
            }
        }


    }
}
