using Pacifico.SINCO.AD;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Pacifico.SINCO.RN
{
    public class OrdenRN
    {
        public static int ESTADO_GENERADO = Constantes.oEstado_Generado;
       


        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "La Orden de Cobro no se encuentra disponible";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_GENERADO = "Orden Generada Satisfactoriamente";


        private static String usuario = "rcastillejo";

        public OrdenRN()
        {

        }

        public String Agregar(OrdenEN model)
        {
            try
            {
                IOrdenDAO ordenDao = new OrdenDAO();
                model.FechaOrden = DateTime.Now;
                model.Estado = ESTADO_GENERADO;
                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;
                ordenDao.Add(model);
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL, e);
            }
            return String.Format(MENSAJE_GENERADO, model.NumOrden);
        }
    }
}






