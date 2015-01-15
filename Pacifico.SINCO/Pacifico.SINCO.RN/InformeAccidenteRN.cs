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
    public class InformeAccidenteRN
    {

        public static int ESTADO_REGISTRADO = Constantes.iEstado_Registrado;
        //public static int ESTADO_APROBADO = Constantes.pEstado_Aprobado;
        //public static int ESTADO_RECHAZADO = Constantes.pEstado_Rechazado;

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "El Informe accidente vehicular no se encuentra disponible";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        
        private static string MENSAJE_REGISTRADO = "Informe de Accidente Vehicular Registrado Satisfactoriamente";
        private static string MENSAJE_ACTUALIZADO = "Informe de Accidente Vehicular Actualizado Satisfactoriamente";


        private static String usuario = "rcastillejo";
        
        public InformeAccidenteRN()
         {
         }


        public InformeAccidente Obtener(int id)
         {
             IInformeAccidenteDAO InformeAccidenteDao = new InformeAccidenteDAO();
             InformeAccidente model = InformeAccidenteDao.Get(id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
            return model;
         }


        public string Agregar(InformeAccidente model)
        {
            try
            {
                IInformeAccidenteDAO InformeAccidenteDao = new InformeAccidenteDAO();
                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;
                
                InformeAccidenteDao.Add(model);
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumInforme);
        }

        public string Modificar(InformeAccidente model)
        {
            Estado estado = model.EstadoEntity;
            MSSiniestro siniestroRespaldo = model.Siniestro;
            try
            {

                IInformeAccidenteDAO informeAccidenteDao = new InformeAccidenteDAO();

                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                model.EstadoEntity = null;
                model.Siniestro = null;
                informeAccidenteDao.Modify(model);
            }
            catch (Exception e)
            {
                model.Siniestro = siniestroRespaldo;
                model.EstadoEntity = estado;
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumInforme);
        }

        public List<InformeAccidente> Listar()
        {
            IInformeAccidenteDAO informeAccidenteDao = new InformeAccidenteDAO();
             List<InformeAccidente> listado;
             listado = informeAccidenteDao.GetAll().ToList();

             if (listado == null || listado.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             return listado;
         }

        public List<InformeAccidente> Buscar(string numPoliza, string tipoSiniestro, string fechaSiniestro)
        {
            IInformeAccidenteDAO informeAccidenteDao = new InformeAccidenteDAO();
            string numPolizaParam = numPoliza == null ? "" : numPoliza.ToUpper();
            string tipoSiniestroParam = tipoSiniestro == null ? "" : tipoSiniestro.ToUpper();
            string fechaSiniestroParam = fechaSiniestro == null ? "" : fechaSiniestro.ToUpper();

             List<InformeAccidente> listado = new List<InformeAccidente>();

             foreach (InformeAccidente Model in informeAccidenteDao.GetAll().Where(
                 b => b.Siniestro.Poliza.NumPoliza.ToUpper().Contains(numPolizaParam)
                     && b.Siniestro.Tipo.Contains(tipoSiniestroParam)).ToList())
             {                 
                 string fecSiniestro = Model.Siniestro.FechaSiniestro.ToString("d");
                 if (fecSiniestro.Contains(fechaSiniestroParam)) {
                    listado.Add(Model);
                 }
             }

             if (listado.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }

             return listado;
         }

    }
}
