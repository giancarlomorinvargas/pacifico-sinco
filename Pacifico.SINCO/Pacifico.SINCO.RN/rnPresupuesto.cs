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
    public class rnPresupuesto
    {
        
        public static int ESTADO_REGISTRADO = Constantes.pEstado_Registrado;
        public static int ESTADO_APROBADO = Constantes.pEstado_Aprobado;
        public static int ESTADO_RECHAZADO = Constantes.pEstado_Rechazado;



        private static string MENSAJE_ERROR_GENERAL = "Error en el sistema";
        private static string MENSAJE_BUSQUEDA_NO_ENCONTRADA = "No existe información que coincida con lo ingresado";
        private static string MENSAJE_NO_DISPONIBLE = "El presupuesto no se encuentra disponible";

        private static string MENSAJE_REGISTRADO = "Presupuesto Registrado Satisfactoriamente";
        private static string MENSAJE_ACTUALIZADO = "Presupuesto Registrado Satisfactoriamente";

        
        String usuario = "rcastillejo";

        IPresupuestoDAO _PresupuestoRepositorio;
        IDetallePresupuestoDAO _DetallePresupuestoRepositorio;


        public rnPresupuesto()
         {
             _PresupuestoRepositorio = new PresupuestoDAO();
             _DetallePresupuestoRepositorio = new DetallePresupuestoDAO();
         }


        public MSPresupuesto ObtenerPresupuesto(int Id)
        {
            MSPresupuesto model = _PresupuestoRepositorio.Get(Id);
            if (model == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }
            return model;
        }

         public string AgregarPresupuesto(MSPresupuesto model)
        {
            try
            {
                model.Estado = ESTADO_REGISTRADO;
                //model.FechaPresupuesto = DateTime.Now;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;


                _PresupuestoRepositorio.Add(model);

                //TODO;Actualizar el estado del Siniestro
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumPresupuesto);
        }

         public string ModificarPresupuesto(MSPresupuesto model, List<MSDetallePresupuesto> DetallePresupuesto)
        {
            ICollection<MSDetallePresupuesto> detalleRespaldo = model.DetallePresupuesto;
            MSInformeAccidente InformeAccidenteRespaldo = model.InformeAccidente;
            try
            {


                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                //Recorrer el listado anterior
                foreach (MSDetallePresupuesto detalle in model.DetallePresupuesto)
                {
                    //evaluar los item del listado anterior que no se encuentren en el listado actual

                    if (DetallePresupuesto.Find(m =>
                        m.MS_Detalle_Presupuesto_Id == detalle.MS_Detalle_Presupuesto_Id) == null)
                    {
                        //OJO: Para eliminar, primero se debe obtener el objeto desde la bd (Indispensable en ORM)
                        MSDetallePresupuesto detalleDel = _DetallePresupuestoRepositorio.Get(detalle.MS_Detalle_Presupuesto_Id);
                        //Removemos el item de la bd
                        _DetallePresupuestoRepositorio.Remove(detalleDel);
                    }
                }


                foreach (MSDetallePresupuesto detalle in DetallePresupuesto)
                {
                    if (detalle.MS_Detalle_Presupuesto_Id == 0)
                    {
                        detalle.MS_Presupuesto_Id = model.MS_Presupuesto_Id;
                        _DetallePresupuestoRepositorio.Add(detalle);
                    }
                    else
                    {
                        _DetallePresupuestoRepositorio.Modify(detalle);
                    }
                }
                model.DetallePresupuesto = null;
                model.InformeAccidente = null;
                _PresupuestoRepositorio.Modify(model);
            }
            catch (Exception e)
            {
                model.DetallePresupuesto = detalleRespaldo;
                model.InformeAccidente = InformeAccidenteRespaldo;
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumPresupuesto);
        }


         public List<MSPresupuesto> BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza, string FechaPresupuesto)
         {
             string NumPresupuestoParam = NumPresupuesto.ToUpper();
             string NumInformeParam = NumInforme.ToUpper();
             string NumPolizaParam = NumPoliza.ToUpper();

             List<MSPresupuesto> listaPresupuesto = new List<MSPresupuesto>();

             foreach (MSPresupuesto Presupuesto in _PresupuestoRepositorio.GetAll().Where(
                         b => ((b.NumPresupuesto.ToUpper().Contains(NumPresupuestoParam))
                             && (b.InformeAccidente.NumInforme.ToUpper().Contains(NumInformeParam))
                             && (b.InformeAccidente.Siniestro.Poliza.NumPoliza.ToUpper().Contains(NumPolizaParam))
                             
                             )
                        ).ToList()
                     )
             {
                 string fecPresupuesto = Presupuesto.FechaPresupuesto.ToString("d");
                 if (fecPresupuesto.Contains(FechaPresupuesto)) {
                     listaPresupuesto.Add(Presupuesto);
                 }
             }

             if (listaPresupuesto.Count() == 0) {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             //return new JavaScriptSerializer().Serialize(listaPresupuesto);
             return listaPresupuesto;
         }

         public List<MSPresupuesto> ListarPresupuesto()
        {
            List<MSPresupuesto> listaPresupuesto;
            listaPresupuesto = _PresupuestoRepositorio.GetAll().ToList();

            if (listaPresupuesto == null || listaPresupuesto.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }
            //return new JavaScriptSerializer().Serialize(listaPresupuesto);
            return listaPresupuesto;
        }

    }
}
