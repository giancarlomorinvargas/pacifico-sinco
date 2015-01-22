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
    public class SiniestroRN
    {


        public static int ESTADO_REGISTRADO = Constantes.sEstado_Pendiente;
        //public static int ESTADO_APROBADO = Constantes.pEstado_Aprobado;
        //public static int ESTADO_RECHAZADO = Constantes.pEstado_Rechazado;

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "El Siniestro no se encuentra disponible";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";

        private static string MENSAJE_REGISTRADO = "Siniestro Registrado Satisfactoriamente";
        private static string MENSAJE_ACTUALIZADO = MENSAJE_REGISTRADO;
        private static string MENSAJE_ASIGNADO = "La apertura del Siniestro se realizó satisfactoriamente";

        private static string MENSAJE_ERROR_PROCESAR = "No se puedo procesar el siniestro, porque no está Pendiente";
        private static string MENSAJE_ERROR_PENDIENTE = "No se puedo registrar el siniestro, porque no está en Proceso";


        private static String usuario = "rcastillejo";

        /// <summary>
        /// ListarSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<SiniestroEN> Listar()
        {
            ISiniestroDAO siniestroDao = new SiniestroDAO();
            List<SiniestroEN> listado = siniestroDao.GetAll().ToList();

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        /// <summary>
        /// ListarSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public List<SiniestroEN> Buscar(string numPoliza, string tipo, string fecRegistro)
        {
            string numPolizaParam = numPoliza == null ? "" : numPoliza.ToUpper();
            string tipoParam = tipo == null ? "" : tipo;
            string fecRegistroParam = fecRegistro == null ? "" : fecRegistro;

            ISiniestroDAO siniestroDao = new SiniestroDAO();
            List<SiniestroEN> listado = siniestroDao.GetAll().Where(
                b => b.Poliza.NumPoliza.ToUpper().Contains(numPolizaParam)
                && b.Tipo.Contains(tipoParam)
                && b.FechaRegistro.ToString("d").Contains(fecRegistroParam)).ToList();

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        /// <summary>
        /// ObtenerSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public SiniestroEN Obtener(int id)
        {
            ISiniestroDAO siniestroDao = new SiniestroDAO();
            SiniestroEN model = siniestroDao.Get(id);
            if (model == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }
            return model;
        }
        
        /// <summary>
        /// IngresarSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string Ingresar(SiniestroEN model)
        {
            try
            {
                ISiniestroDAO siniestroDao = new SiniestroDAO();
                model.Estado = ESTADO_REGISTRADO;

                //No deberia asignar la fecha
                model.FechaAtencion = DateTime.Now;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                siniestroDao.Add(model);
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL,e);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumSiniestro);
        }

        /// <summary>
        /// ActualizaSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string Actualizar(SiniestroEN model)
        {
            EstadoEN estado = model.EstadoEntity;
            PolizaEN polizaRespaldo = model.Poliza;
            ProcuradorEN procuradorRespaldo = model.Procurador;
            try
            {
                ISiniestroDAO siniestroDao = new SiniestroDAO();
                model.Estado = ESTADO_REGISTRADO;

                //No deberia asignar la fecha
                model.FechaAtencion = DateTime.Now;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                siniestroDao.Modify(model);
            }
            catch (Exception e)
            {
                model.Poliza = polizaRespaldo;
                model.Procurador = procuradorRespaldo;
                model.EstadoEntity = estado;
                throw new Exception(MENSAJE_ERROR_GENERAL, e);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumSiniestro);

        }


        /// <summary>
        /// ActualizaSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string RegistrarProceso(int id)
        {
            ISiniestroDAO siniestroDao = new SiniestroDAO();
            //SiniestroEN siniestroConsulta = Obtener(id);
            SiniestroEN siniestroConsulta = siniestroDao.Get(id);

            if (siniestroConsulta == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }

            if (siniestroConsulta.Estado == Constantes.sEstado_Pendiente)
            {
                siniestroConsulta.Estado = Constantes.sEstado_EnProceso;
                try
                {
                    //return Actualizar(siniestroConsulta);
                    siniestroDao.Modify(siniestroConsulta);
                }
                catch (Exception e)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, e);
                }
                return MENSAJE_REGISTRADO;
            }
            else
            {
                throw new Exception(MENSAJE_ERROR_PROCESAR);
            }
        }

        /// <summary>
        /// ActualizaSiniestro
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>
        public string RegistrarPendiente(int id)
        {
            ISiniestroDAO siniestroDao = new SiniestroDAO();
            //SiniestroEN siniestroConsulta = Obtener(id);
            SiniestroEN siniestroConsulta = siniestroDao.Get(id);

            if (siniestroConsulta == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }

            if (siniestroConsulta.Estado == Constantes.sEstado_EnProceso)
            {
                siniestroConsulta.Estado = Constantes.sEstado_Pendiente;
                try
                {
                    //return Actualizar(siniestroConsulta);
                    siniestroDao.Modify(siniestroConsulta);
                }
                catch (Exception e)
                {
                    throw new Exception(MENSAJE_ERROR_GENERAL, e);
                }
                return MENSAJE_REGISTRADO;
            }
            else
            {
                throw new Exception(MENSAJE_ERROR_PENDIENTE);
            }
        }

        public List<SiniestroEN> Consultar(string numSiniestro, string tipo)
        {
            string numSiniestroParam = numSiniestro == null ? "" : numSiniestro.ToUpper();
            string tipoParam = tipo == null ? "" : tipo;

            ISiniestroDAO siniestroDao = new SiniestroDAO();
            List<SiniestroEN> listado = siniestroDao.GetAll().Where(
                b => b.NumSiniestro.ToUpper().Contains(numSiniestroParam)
                && b.Tipo.Contains(tipoParam)).ToList();

            if (listado.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }

            return listado;
        }

        public string Aperturar(SiniestroEN model)
        {
            EstadoEN estado = model.EstadoEntity;
            PolizaEN polizaRespaldo = model.Poliza;
            ProcuradorEN procuradorRespaldo = model.Procurador;
            try
            {
                ISiniestroDAO siniestroDao = new SiniestroDAO();
                model.Estado = Constantes.sEstado_Asignado;

                //No deberia asignar la fecha
                model.FechaAtencion = DateTime.Now;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                siniestroDao.Modify(model);
            }
            catch (Exception e)
            {
                model.Poliza = polizaRespaldo;
                model.Procurador = procuradorRespaldo;
                model.EstadoEntity = estado;
                throw new Exception(MENSAJE_ERROR_GENERAL, e);
            }

            return String.Format(MENSAJE_ASIGNADO, model.NumSiniestro);

        }


    }
}
