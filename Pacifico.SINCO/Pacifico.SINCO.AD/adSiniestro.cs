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
    public class adSiniestro : adBase
    {
        public adSiniestro(SqlConnection con)
        {
            conexion = con;
        }

        /// <summary>
        /// ListarSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public List<enSiniestro> ListarSiniestro(enSiniestro pEnSiniestro)
        {
            try
            {

                string sQuery = "SELECT "+
                                    "MS_Siniestro_Id, NumSiniestro, FechaSiniestro, FechaAtencion, Lugar, Descripcion, Estado ,"+
                                    "s.UsuarioRegistro, s.FechaRegistro, s.UsuarioModifico, s.FechaModifico, "+
                                    "p.MP_Poliza_Id, MS_Procurador_Id, s.Tipo, " + 
                                    //"CASE s.Tipo WHEN '1' THEN 'ACCIDENTE VEHICULAR' ELSE 'ACCIDENTE VEHICULAR' END as Tipo, "+ 
                                    "p.NumPoliza, a.ApellidoPaterno + ' ' + a.ApellidoMaterno + ', ' + a.Nombre as NombreAsegurado, "+
                                    "(SELECT e.Nombre FROM Estado e WHERE e.Estado_Id = s.Estado ) as vEstado " +
                                "FROM MS_Siniestro s, MP_Poliza p, MP_Asegurado a "+ 
                                "WHERE s.MP_Poliza_Id = p.MP_Poliza_Id "+ 
                                        "AND p.MP_Asegurado_ID = a.MP_Asegurado_Id "+
                                        "AND p.NumPoliza like '%"+pEnSiniestro.NumPoliza+"%' "+
                                        "AND s.Tipo like '%" + pEnSiniestro.Tipo + "%' " +
                                        "AND CONVERT(varchar(10),s.FechaSiniestro,103) like '%" + pEnSiniestro.vFechaRegistro + "%' "+
                                 "ORDER BY MS_Siniestro_Id";

                List<enSiniestro> loEnSiniestro = null;
                enSiniestro oEnSiniestro = null;

                using (SqlCommand cmd = new SqlCommand(sQuery, conexion))
                {
                    //cmd.CommandType = CommandType.;
                    using (SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult))
                    {

                        if (drd != null)
                        {
                            loEnSiniestro = new List<enSiniestro>();
                            while (drd.Read())
                            {
                                oEnSiniestro = new enSiniestro();
                                oEnSiniestro.MS_Siniestro_Id = drd.GetInt32(0);
                                oEnSiniestro.NumSiniestro = drd.GetString(1);
                                oEnSiniestro.FechaSiniestro = !drd.IsDBNull(2) ? drd.GetDateTime(2) : DateTime.Parse("01/01/1753");
                                oEnSiniestro.FechaAtencion = !drd.IsDBNull(3) ? drd.GetDateTime(3) : DateTime.Parse("01/01/1753");
                                oEnSiniestro.Lugar = !drd.IsDBNull(4) ? drd.GetString(4) : "";
                                oEnSiniestro.Descripcion = !drd.IsDBNull(5) ? drd.GetString(5) : "";
                                oEnSiniestro.Estado = !drd.IsDBNull(6) ? drd.GetInt32(6) : 0;

                                oEnSiniestro.UsuarioRegistro = !drd.IsDBNull(7) ? drd.GetString(7) : "";
                                oEnSiniestro.FechaRegistro = !drd.IsDBNull(8) ? drd.GetDateTime(8) : DateTime.Parse("01/01/1753");
                                oEnSiniestro.UsuarioModifico = !drd.IsDBNull(9) ? drd.GetString(9) : "";
                                oEnSiniestro.FechaModifico = !drd.IsDBNull(10) ? drd.GetDateTime(10) : DateTime.Parse("01/01/1753");

                                oEnSiniestro.MP_Poliza_Id = !drd.IsDBNull(11) ? drd.GetInt32(11) : 0;
                                oEnSiniestro.MS_Procurador_Id = !drd.IsDBNull(12) ? drd.GetInt32(12) : 0;

                                oEnSiniestro.Tipo = !drd.IsDBNull(13) ? drd.GetString(13) : "";
                                oEnSiniestro.NumPoliza = !drd.IsDBNull(14) ? drd.GetString(14) : "";
                                oEnSiniestro.NombreAsegurado = !drd.IsDBNull(15) ? drd.GetString(15) : "";
                                oEnSiniestro.vEstado = !drd.IsDBNull(16) ? drd.GetString(16) : "";

                                loEnSiniestro.Add(oEnSiniestro);
                            }
                            drd.Close();
                        }
                        return loEnSiniestro;

                    }//using-SqlDataReader                

                }//using-SqlCommand                

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// ObtenerSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public enSiniestro ObtenerSiniestro(enSiniestro pEnSiniestro)
        {
            try
            {

                string sQuery = "SELECT " +
                                    "MS_Siniestro_Id, NumSiniestro, CONVERT(varchar(10),FechaSiniestro,103) as vFechaSiniestro, FechaAtencion, Lugar, Descripcion, Estado ," +
                                    "s.UsuarioRegistro, s.FechaRegistro, s.UsuarioModifico, s.FechaModifico, " +
                                    "p.MP_Poliza_Id, s.MS_Procurador_Id, " +
                                    "s.Tipo, " +
                                    "p.NumPoliza, a.ApellidoPaterno + ' ' + a.ApellidoMaterno + ', ' + a.Nombre as NombreAsegurado, " +
                                    //"CASE s.Estado WHEN '1' THEN 'PENDIENTE' WHEN '2' THEN 'EN PROCESO' WHEN '3' THEN 'TERMINADO' ELSE 'PENDIENTE' END as vEstado " +
                                    "(SELECT e.Nombre FROM Estado e WHERE e.Estado_Id = s.Estado ) as vEstado" +
                                    ", CONVERT(varchar(10),p.FechaInicio,103) as vFechaInicio, CONVERT(varchar(10),p.FechaFin,103) as vFechaFin "+
	                                ", pr.NumProcurador ,pr.ApellidoPaterno + ' ' + pr.ApellidoMaterno + ', ' + pr.Nombre as NombreProcurador "+
                                "FROM MS_Siniestro s, MP_Poliza p, MP_Asegurado a, MS_Procurador pr " +
                                "WHERE s.MP_Poliza_Id = p.MP_Poliza_Id " +
                                        "AND s.MS_Procurador_Id = pr.MS_Procurador_Id "+
                                        "AND s.MS_Siniestro_Id = "+pEnSiniestro.MS_Siniestro_Id+" ";

                //"CASE s.Tipo WHEN '1' THEN 'ACCIDENTE VEHICULAR' ELSE 'ACCIDENTE VEHICULAR' END as Tipo, " +
                
                enSiniestro oEnSiniestro = null;

                using (SqlCommand cmd = new SqlCommand(sQuery, conexion))
                {
                    //cmd.CommandType = CommandType.;
                    using (SqlDataReader drd = cmd.ExecuteReader(CommandBehavior.SingleResult))
                    {

                        if (drd != null)
                        {
                            drd.Read();

                            oEnSiniestro = new enSiniestro();
                            oEnSiniestro.MS_Siniestro_Id = drd.GetInt32(0);
                            oEnSiniestro.NumSiniestro = drd.GetString(1);
                            oEnSiniestro.vFechaSiniestro = !drd.IsDBNull(2) ? drd.GetString(2) : "";
                            oEnSiniestro.FechaAtencion = !drd.IsDBNull(3) ? drd.GetDateTime(3) : DateTime.Parse("01/01/1753");
                            oEnSiniestro.Lugar = !drd.IsDBNull(4) ? drd.GetString(4) : "";
                            oEnSiniestro.Descripcion = !drd.IsDBNull(5) ? drd.GetString(5) : "";
                            oEnSiniestro.Estado = !drd.IsDBNull(6) ? drd.GetInt32(6) : 0;

                            oEnSiniestro.UsuarioRegistro = !drd.IsDBNull(7) ? drd.GetString(7) : "";
                            oEnSiniestro.FechaRegistro = !drd.IsDBNull(8) ? drd.GetDateTime(8) : DateTime.Parse("01/01/1753");
                            oEnSiniestro.UsuarioModifico = !drd.IsDBNull(9) ? drd.GetString(9) : "";
                            oEnSiniestro.FechaModifico = !drd.IsDBNull(10) ? drd.GetDateTime(10) : DateTime.Parse("01/01/1753");

                            oEnSiniestro.MP_Poliza_Id = !drd.IsDBNull(11) ? drd.GetInt32(11) : 0;
                            oEnSiniestro.MS_Procurador_Id = !drd.IsDBNull(12) ? drd.GetInt32(12) : 0;

                            oEnSiniestro.Tipo = !drd.IsDBNull(13) ? drd.GetString(13) : "";
                            oEnSiniestro.NumPoliza = !drd.IsDBNull(14) ? drd.GetString(14) : "";
                            oEnSiniestro.NombreAsegurado = !drd.IsDBNull(15) ? drd.GetString(15) : "";
                            oEnSiniestro.vEstado = !drd.IsDBNull(16) ? drd.GetString(16) : "";

                            oEnSiniestro.vFechaInicio = !drd.IsDBNull(17) ? drd.GetString(17) : "";
                            oEnSiniestro.vFechaFin = !drd.IsDBNull(18) ? drd.GetString(18) : "";
                            oEnSiniestro.NumProcurador = !drd.IsDBNull(19) ? drd.GetString(19) : "";
                            oEnSiniestro.NombreProcurador = !drd.IsDBNull(20) ? drd.GetString(20) : "";

                            drd.Close();
                        }
                        return oEnSiniestro;

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
        public bool IngresarSiniestro(enSiniestro pEnSiniestro)
        {
            try
            {

                string strQuery = @"INSERT INTO MS_Siniestro(NumSiniestro,Tipo,FechaSiniestro,Lugar,Descripcion,Estado,UsuarioRegistro,FechaRegistro,UsuarioModifico,FechaModifico,MP_Poliza_Id,MS_Procurador_Id,FechaAtencion)
                                    VALUES(@NumSiniestro,@Tipo,@FechaSiniestro,@Lugar,@Descripcion,@Estado,@UsuarioRegistro,GETDATE(),@UsuarioModifico,GETDATE(),@MP_Poliza_Id,@MS_Procurador_Id,GETDATE()) ";
                                                
                using (SqlCommand cmd = new SqlCommand(strQuery, conexion))
                {
                    // define parameters and their values
                    cmd.Parameters.Add("@NumSiniestro", SqlDbType.VarChar, 16).Value = pEnSiniestro.NumSiniestro;
                    cmd.Parameters.Add("@Tipo", SqlDbType.VarChar, 50).Value = pEnSiniestro.Tipo;
                    cmd.Parameters.Add("@FechaSiniestro", SqlDbType.DateTime).Value = pEnSiniestro.FechaSiniestro;                    
                    cmd.Parameters.Add("@Lugar", SqlDbType.VarChar, 250).Value = pEnSiniestro.Lugar;
                    cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar, 250).Value = pEnSiniestro.Descripcion;
                    cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 50).Value = pEnSiniestro.Estado;
                    cmd.Parameters.Add("@UsuarioRegistro", SqlDbType.VarChar, 250).Value = pEnSiniestro.UsuarioRegistro;                    
                    cmd.Parameters.Add("@UsuarioModifico", SqlDbType.VarChar, 50).Value = pEnSiniestro.UsuarioModifico;                    
                    cmd.Parameters.Add("@MP_Poliza_Id", SqlDbType.Int).Value = pEnSiniestro.MP_Poliza_Id;
                    cmd.Parameters.Add("@MS_Procurador_Id", SqlDbType.Int).Value = pEnSiniestro.MS_Procurador_Id;

                    cmd.ExecuteNonQuery();                    
                }
                
                return true;
            }
            catch (SqlException ex)
            {                
                throw ex;
            }
        }
        
        /// <summary>
        /// ActualizaSiniestro
        /// </summary>
        /// <param name="pEnSiniestro"></param>
        /// <returns></returns>
        public bool ActualizaSiniestro(enSiniestro pEnSiniestro)
        {
            try
            {

                string strQuery = @"UPDATE MS_Siniestro
                                    SET
                                        Tipo = @Tipo,
                                        FechaSiniestro = @FechaSiniestro,
                                        Lugar = @Lugar,
                                        Descripcion = @Descripcion,
                                        Estado = @Estado,
                                        UsuarioModifico = @UsuarioModifico,
                                        FechaModifico = GETDATE(),
                                        MP_Poliza_Id = @MP_Poliza_Id,
                                        MS_Procurador_Id = @MS_Procurador_Id
                                    WHERE
                                        MS_Siniestro_Id = @MS_Siniestro_Id";

                using (SqlCommand cmd = new SqlCommand(strQuery, conexion))
                {
                    // define parameters and their values
                    cmd.Parameters.Add("@Tipo", SqlDbType.VarChar, 50).Value = pEnSiniestro.Tipo;
                    cmd.Parameters.Add("@FechaSiniestro", SqlDbType.DateTime).Value = pEnSiniestro.FechaSiniestro;                    
                    cmd.Parameters.Add("@Lugar", SqlDbType.VarChar, 250).Value = pEnSiniestro.Lugar;
                    cmd.Parameters.Add("@Descripcion", SqlDbType.VarChar, 250).Value = pEnSiniestro.Descripcion;
                    cmd.Parameters.Add("@Estado", SqlDbType.VarChar, 50).Value = pEnSiniestro.Estado;                    
                    cmd.Parameters.Add("@UsuarioModifico", SqlDbType.VarChar, 50).Value = pEnSiniestro.UsuarioModifico;
                    cmd.Parameters.Add("@MP_Poliza_Id", SqlDbType.Int).Value = pEnSiniestro.MP_Poliza_Id;
                    cmd.Parameters.Add("@MS_Procurador_Id", SqlDbType.Int).Value = pEnSiniestro.MS_Procurador_Id;
                    cmd.Parameters.Add("@MS_Siniestro_Id", SqlDbType.Int).Value = pEnSiniestro.MS_Siniestro_Id;

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
