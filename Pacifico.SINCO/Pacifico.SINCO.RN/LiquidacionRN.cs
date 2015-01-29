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
    public class LiquidacionRN
    {

        public static int ESTADO_REGISTRADO = Constantes.lEstado_Registrado;
        public static int ESTADO_GENERADO = Constantes.lEstado_Generado;
        //public static int ESTADO_PENDIENTE = Constantes.iEstado_Firmado;
        //public static int ESTADO_RECHAZADO = Constantes.pEstado_Rechazado;

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "La Liquidación vehicular no se encuentra disponible";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";

        private static string MENSAJE_REGISTRADO = "Liquidación Registrado Satisfactoriamente";
        private static string MENSAJE_RECHAZADO = "Liquidación Rechazada Satisfactoriamente";
        private static string MENSAJE_ACTUALIZADO = "Liquidación Actualizado Satisfactoriamente";


        private static String usuario = "rcastillejo";

        public LiquidacionRN()
         {
         }


        public LiquidacionEN Obtener(int id)
         {
             ILiquidacionDAO LiquidacionDao = new LiquidacionDAO();
             LiquidacionEN model = LiquidacionDao.Get(id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
            return model;
         }


        public string Agregar(LiquidacionEN model)
        {
            try
            {
                ILiquidacionDAO LiquidacionDao = new LiquidacionDAO();
                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;
                
                LiquidacionDao.Add(model);
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL, e);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumLiquidacion);
        }

        public string Modificar(LiquidacionEN model)
        {
            EstadoEN estado = model.EstadoEntity;
            SiniestroEN siniestroRespaldo = model.Siniestro;
            try
            {

                ILiquidacionDAO liquidacionDao = new LiquidacionDAO();

                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                model.EstadoEntity = null;
                model.Siniestro = null;
                liquidacionDao.Modify(model);
            }
            catch (Exception e)
            {
                model.Siniestro = siniestroRespaldo;
                model.EstadoEntity = estado;
                throw new Exception(MENSAJE_ERROR_GENERAL, e);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumLiquidacion);
        }

        public List<LiquidacionEN> Listar()
        {
            ILiquidacionDAO liquidacionDao = new LiquidacionDAO();
             List<LiquidacionEN> listado;
             listado = liquidacionDao.GetAll().ToList();

             if (listado == null || listado.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             return listado;
         }

        public List<LiquidacionEN> Buscar(string numLiquidacion, string tipoSiniestro, string fechaLiquidacion)
        {
            ILiquidacionDAO liquidacionDao = new LiquidacionDAO();
            string numLiquidacionParam = numLiquidacion == null ? "" : numLiquidacion.ToUpper();
            string tipoSiniestroParam = tipoSiniestro == null ? "" : tipoSiniestro;
            string fechaLiquidacionParam = fechaLiquidacion == null ? "" : fechaLiquidacion;

             List<LiquidacionEN> listado = new List<LiquidacionEN>();

             foreach (LiquidacionEN Model in liquidacionDao.GetAll().Where(
                 b => b.Siniestro.Tipo.Contains(tipoSiniestroParam)
                     && b.NumLiquidacion.ToUpper().Contains(numLiquidacionParam)).ToList())
             {                 
                 string fecSiniestro = Model.FechaLiquidacion.ToString("d");
                 if (fecSiniestro.Contains(fechaLiquidacionParam))
                 {
                    listado.Add(Model);
                 }
             }

             if (listado.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }

             return listado;
         }

        public string RegistrarGenerado(int id)
        {
            ILiquidacionDAO liquidacionDao = new LiquidacionDAO();
            LiquidacionEN liquidacionConsulta = liquidacionDao.Get(id);

            if (liquidacionConsulta == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }

            if (liquidacionConsulta.Estado == Constantes.lEstado_Registrado)
            {
                liquidacionConsulta.Estado = Constantes.lEstado_Generado;
                try
                {
                    liquidacionDao.Modify(liquidacionConsulta);
                }
                catch (Exception e)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, e);
                }
                return MENSAJE_REGISTRADO;
            }
            else
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
        }

        public string RegistrarRechazo(int id)
        {
            ILiquidacionDAO liquidacionDao = new LiquidacionDAO();
            LiquidacionEN liquidacionConsulta = liquidacionDao.Get(id);

            if (liquidacionConsulta == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }

            if (liquidacionConsulta.Estado == Constantes.lEstado_Registrado)
            {
                liquidacionConsulta.Estado = Constantes.lEstado_Rechazado;
                try
                {
                    liquidacionDao.Modify(liquidacionConsulta);
                }
                catch (Exception e)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, e);
                }
                return MENSAJE_RECHAZADO;
            }
            else
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
        }

    }
}
