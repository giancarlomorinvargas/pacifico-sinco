using MvcAppServicioCarga.Controllers.Siniestro;
using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.Siniestro.Service
{
    public class PresupuestoAppService : IPresupuestoAppService
    {

        public static int ESTADO_REGISTRADO = 41;
        public static int ESTADO_APROBADO = 42;
        public static int ESTADO_RECHAZADO = 43;



        private static string MENSAJE_ERROR_GENERAL = "No se pudo actualizar el presupuesto";
        private static string MENSAJE_NO_DISPONIBLE = "El presupuesto no se encuentra disponible";

        private static string MENSAJE_REGISTRADO = "La presupuesto se registró con éxito: {0}";
        private static string MENSAJE_ACTUALIZADO = "La presupuesto se actualizó con éxito: {0}";
        /*
        private static string MENSAJE_ANULADO = "La presupuesto se anuló con éxito: {0}";
        private static string MENSAJE_VERIFICADO = "Se registró la entrega de la ficha carga con éxito";
        private static string MENSAJE_CLAVE_INCORRECTA = "El código de seguridad ingresado es incorrecto";
        private static string MENSAJE_NO_PAGADA = "La ficha carga se encuentra pendiente de pago";
        private static string MENSAJE_COMPROBANTE_INCORRECTO = "El comprobante de pago no corresponde a la ficha carga";
        private static string MENSAJE_VALIDA_PAGO = "Se registró el pago de la ficha carga con éxito";*/
        
        
        String usuario = "rcastillejo";

        IPresupuestoDAO _PresupuestoRepositorio;
        IDetallePresupuestoDAO _DetallePresupuestoRepositorio;/*
        IFichaMovimientoDAO _FichaMovimientoRepositorio;
        IProgramacionRutaDAO _ProgramacionRutaRepositorio;*/

        public PresupuestoAppService()
         {
             _PresupuestoRepositorio = new PresupuestoDAO();
             _DetallePresupuestoRepositorio = new DetallePresupuestoDAO();/*
             _FichaMovimientoRepositorio = fichaMovimientoDAO;
             _ProgramacionRutaRepositorio = new ProgramacionRutaDAO();*/
         }
         

         public MSPresupuesto ObtenerPresupuesto(int Id)
        {
            MSPresupuesto FichaCarga = _PresupuestoRepositorio.Get(Id);
            if (FichaCarga == null)
            {
                throw new ValidationException(MENSAJE_NO_DISPONIBLE);
            }
            return FichaCarga;
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
                throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
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
                throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumPresupuesto);
        }
         /*
          public string EliminarPresupuesto(MGFichaCarga FichaCargaAdd)
         {
             try
             {
                 _PresupuestoRepositorio.Remove(FichaCargaAdd);
             }
             catch (Exception e)
             {
                 throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
             }
             return "Ficha de Carga eliminada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
         }*/


         public List<MSPresupuesto> BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza)
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
             return listaPresupuesto;
         }

         public List<MSPresupuesto> ListarPresupuesto()
        {
            return _PresupuestoRepositorio.GetAll().ToList();
        }


    }
}
