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
                DateTime Now = DateTime.Now;
                string sQuery = "SELECT MP_Poliza_Id, NumPoliza, FechaInicio, FechaFin, MontoCobertura, Tipo, UsuarioRegistro, FechaRegistro, UsuarioModifico, FechaModifico, a.MP_Asegurado_ID, v.MP_Vehiculo_ID"+
                                ", a.ApellidoPaterno + ' ' + a.ApellidoMaterno + ', '+ a.Nombre as NombreAsegurado "+
                                ", v.Placa, ma.Descripcion as vMarca, mo.Descripcion as vModelo "+
                                ", a.DniAsegurado" +
                                " FROM MP_Poliza p, MP_Asegurado a, MP_Vehiculo v, MP_Marca ma, MP_Modelo mo "+
                                " WHERE p.MP_Asegurado_ID = a.MP_Asegurado_Id AND p.MP_Vehiculo_ID = v.MP_Vehiculo_Id AND v.MP_Marca_Id = ma.MP_Marca_Id and v.MP_Modelo_Id = mo.MP_Modelo_Id " +
                                " AND a.DniAsegurado like '%" + pEnPoliza.DniAsegurado + "%' AND NumPoliza like '%" + pEnPoliza.NumPoliza + "%' AND v.Placa like '%" + pEnPoliza.Placa + "%' ";

                List<enPoliza> loEnPoliza = null;
                enPoliza oEnPoliza = null;

                using (SqlCommand cmd = new SqlCommand(sQuery, conexion))
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

                                oEnPoliza.Placa = !drd.IsDBNull(13) ? drd.GetString(13) : "";
                                oEnPoliza.vMarca = !drd.IsDBNull(14) ? drd.GetString(14) : "";
                                oEnPoliza.vModelo = !drd.IsDBNull(15) ? drd.GetString(15) : "";

                                oEnPoliza.DniAsegurado = !drd.IsDBNull(16) ? drd.GetString(16) : "";

                                oEnPoliza.Vigente = oEnPoliza.FechaInicio <= Now && Now <= oEnPoliza.FechaFin;

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
