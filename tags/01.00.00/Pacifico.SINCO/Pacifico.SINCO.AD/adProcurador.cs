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
    public class adProcurador : adBase
    {
        public adProcurador(SqlConnection con)
        {
            conexion = con;
        }


        /// <summary>
        /// ListarProcurador
        /// </summary>
        /// <param name="pEnPoliza"></param>
        /// <returns></returns>
        public List<enProcurador> ListarProcurador(enProcurador pEnProcurador)
        {
            try
            {

                List<enProcurador> lEnProcurador = null;
                enProcurador oEnProcurador = null;

                using (SqlCommand cmd = new SqlCommand("SELECT MS_Procurador_Id, NumProcurador, Nombre, ApellidoPaterno, ApellidoMaterno, Telefono, Disponible FROM MS_Procurador WHERE NumProcurador like '%" + pEnProcurador.NumProcurador + "%' AND (ApellidoPaterno like '%" + pEnProcurador.ApellidoPaterno + "%' OR Nombre like '%" + pEnProcurador.Nombre + "%' OR ApellidoMaterno like '%" + pEnProcurador.ApellidoMaterno + "%') ", conexion))
                {
                    //cmd.CommandType = CommandType.;
                    using (SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult))
                    {

                        if (drd != null)
                        {
                            lEnProcurador = new List<enProcurador>();
                            while (drd.Read())
                            {
                                oEnProcurador = new enProcurador();
                                oEnProcurador.MS_Procurador_Id = drd.GetInt32(0);
                                oEnProcurador.NumProcurador = drd.GetString(1);
                                oEnProcurador.Nombre = !drd.IsDBNull(2) ? drd.GetString(2) : "";
                                oEnProcurador.ApellidoPaterno = !drd.IsDBNull(3) ? drd.GetString(3) : "";
                                oEnProcurador.ApellidoMaterno = !drd.IsDBNull(4) ? drd.GetString(4) : "";
                                oEnProcurador.Telefono = !drd.IsDBNull(5) ? drd.GetString(5) : "";
                                oEnProcurador.Disponible = !drd.IsDBNull(6) ? drd.GetBoolean(6) : false;
                                
                                lEnProcurador.Add(oEnProcurador);
                            }
                            drd.Close();
                        }
                        return lEnProcurador;

                    }//using-SqlDataReader                

                }//using-SqlCommand                

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }


        /// <summary>
        /// IngresarSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public bool ActualizarDisponibilidadProcurador(enProcurador pEnProcurador)
        {
            try
            {

                string strQuery = @"UPDATE MS_Procurador
                                    SET
                                        Disponible = @Disponible
                                    WHERE
                                        MS_Procurador_Id = @MS_Procurador_Id";

                using (SqlCommand cmd = new SqlCommand(strQuery, conexion))
                {
                    // define parameters and their values
                    cmd.Parameters.Add("@Disponible", SqlDbType.VarChar, 16).Value = pEnProcurador.Disponible;
                    cmd.Parameters.Add("@MS_Procurador_Id", SqlDbType.Int).Value = pEnProcurador.MS_Procurador_Id;

                    cmd.ExecuteNonQuery();
                }

                return true;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }
        
    }
}
