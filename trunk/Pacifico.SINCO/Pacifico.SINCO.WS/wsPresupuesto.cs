using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WS.Interfaces;
using Pacifico.SINCO.EN;
using Pacifico.SINCO.RN;
using System.ServiceModel;
using System.Web.Script.Serialization;

namespace Pacifico.SINCO.WS
{
    public class wsPresupuesto : IwsPresupuesto
    {

        /// <summary>
        /// wsObtenerNombreWS
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string wsObtenerNombreWS()
        {
            return string.Format(Constantes.sNombreWS_Presupuesto);
        }
        

        public static int ESTADO_REGISTRADO = 41;
        public static int ESTADO_APROBADO = 42;
        public static int ESTADO_RECHAZADO = 43;



        private static string MENSAJE_ERROR_GENERAL = "No se pudo actualizar el presupuesto";
        private static string MENSAJE_NO_DISPONIBLE = "El presupuesto no se encuentra disponible";

        private static string MENSAJE_REGISTRADO = "La presupuesto se registró con éxito: {0}";
        private static string MENSAJE_ACTUALIZADO = "La presupuesto se actualizó con éxito: {0}";

        
        String usuario = "rcastillejo";

        IPresupuestoDAO _PresupuestoRepositorio;
        IDetallePresupuestoDAO _DetallePresupuestoRepositorio;


        public wsPresupuesto()
         {
             _PresupuestoRepositorio = new PresupuestoDAO();
             _DetallePresupuestoRepositorio = new DetallePresupuestoDAO();/*
             _FichaMovimientoRepositorio = fichaMovimientoDAO;
             _ProgramacionRutaRepositorio = new ProgramacionRutaDAO();*/
         }
         

         public string ObtenerPresupuesto(int Id)
        {
            MSPresupuesto model = _PresupuestoRepositorio.Get(Id);
            if (model == null)
            {
                throw new FaultException(MENSAJE_NO_DISPONIBLE);
            }
            //return model;
            return new JavaScriptSerializer().Serialize(model);
        }

         public string AgregarPresupuesto(MSPresupuesto model)
        {
            try
            {
                model.Estado = ESTADO_REGISTRADO;
                model.FechaPresupuesto = DateTime.Now;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;


                _PresupuestoRepositorio.Add(model);

                //TODO;Actualizar el estado del Siniestro
            }
            catch (Exception e)
            {
                throw new FaultException(MENSAJE_ERROR_GENERAL);
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
                throw new FaultException(MENSAJE_ERROR_GENERAL);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumPresupuesto);
        }


         public string BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza)
         {
             string NumPresupuestoParam = NumPresupuesto.ToUpper();
             string NumInformeParam = NumInforme.ToUpper();
             string NumPolizaParam = NumPoliza.ToUpper();

             List<MSPresupuesto> listaPresupuesto = new List<MSPresupuesto>();

             foreach (MSPresupuesto Presupuesto in _PresupuestoRepositorio.GetAll().Where(
                         b => ((b.NumPresupuesto.ToUpper().Contains(NumPresupuesto))
                             && (b.InformeAccidente.NumInforme.ToUpper().Contains(NumInforme))
                             && (b.InformeAccidente.Siniestro.Poliza.NumPoliza.ToUpper().Contains(NumPoliza))
                             )
                        ).ToList()
                     )
             {
                 listaPresupuesto.Add(Presupuesto);
             }
             //return listaPresupuesto;
             return new JavaScriptSerializer().Serialize(listaPresupuesto);
         }

         public string ListarPresupuesto()
        {
            List<MSPresupuesto> listaPresupuesto;
            listaPresupuesto = _PresupuestoRepositorio.GetAll().ToList();
            return new JavaScriptSerializer().Serialize(listaPresupuesto);
        }


    }
}
