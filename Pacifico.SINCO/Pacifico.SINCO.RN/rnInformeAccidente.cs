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
    public class rnInformeAccidente
    {

        public static int ESTADO_REGISTRADO = Constantes.iEstado_Registrado;
        //public static int ESTADO_APROBADO = Constantes.pEstado_Aprobado;
        //public static int ESTADO_RECHAZADO = Constantes.pEstado_Rechazado;

        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_NO_DISPONIBLE = "El Informe accidente vehicular no se encuentra disponible";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        
        private static string MENSAJE_REGISTRADO = "Informe de Accidente Vehicular Registrado Satisfactoriamente";
        private static string MENSAJE_ACTUALIZADO = "Informe de Accidente Vehicular Actualizado Satisfactoriamente";


        private String usuario = "rcastillejo";

        private IInformeAccidenteDAO _InformeAccidenteRepositorio;

        public rnInformeAccidente()
         {
             _InformeAccidenteRepositorio = new InformeAccidenteDAO();
         }


        public MSInformeAccidente Obtener(int Id)
         {
             MSInformeAccidente model = _InformeAccidenteRepositorio.Get(Id);
             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
            return model;
         }


        public string Agregar(MSInformeAccidente model)
        {
            try
            {
                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;
                
                _InformeAccidenteRepositorio.Add(model);
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumInforme);
        }

        public string Modificar(MSInformeAccidente model)
        {
            Estado Estado = model.EstadoEntity;
            MSSiniestro SiniestroRespaldo = model.Siniestro;
            try
            {


                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                model.EstadoEntity = null;
                model.Siniestro = null;
                _InformeAccidenteRepositorio.Modify(model);
            }
            catch (Exception e)
            {
                model.Siniestro = SiniestroRespaldo;
                model.EstadoEntity = Estado;
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumInforme);
        }

        public List<MSInformeAccidente> Listar()
         {
             List<MSInformeAccidente> listado;
             listado = _InformeAccidenteRepositorio.GetAll().ToList();

             if (listado == null || listado.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             return listado;
         }

        public List<MSInformeAccidente> Buscar(string NumPoliza, string TipoSiniestro, string FechaSiniestro)
        {
            string NumPolizaParam = NumPoliza.ToUpper();

             List<MSInformeAccidente> listado = new List<MSInformeAccidente>();

             foreach (MSInformeAccidente Model in _InformeAccidenteRepositorio.GetAll().Where(
                 b => b.Siniestro.Poliza.NumPoliza.ToUpper().Contains(NumPolizaParam) 
                     && b.Siniestro.Tipo.Contains(TipoSiniestro)).ToList())
             {                 
                 string fecSiniestro = Model.Siniestro.FechaSiniestro.ToString("d");
                 if (fecSiniestro.Contains(FechaSiniestro)) {
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
