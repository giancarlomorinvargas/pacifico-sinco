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
    public class PresupuestoRN
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


        public PresupuestoEN ObtenerPresupuesto(int Id)
        {
            IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
            PresupuestoEN model = presupuestoDao.Get(Id);
            if (model == null)
            {
                throw new Exception(MENSAJE_NO_DISPONIBLE);
            }
            return model;
        }

         public string AgregarPresupuesto(PresupuestoEN model)
        {
            try
            {
                IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
                model.Estado = ESTADO_REGISTRADO;
                //model.FechaPresupuesto = DateTime.Now;

                model.UsuarioRegistro = usuario;
                model.FechaRegistro = DateTime.Now;
                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;


                presupuestoDao.Add(model);

                //TODO;Actualizar el estado del SiniestroEN
            }
            catch (Exception e)
            {
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }

            return String.Format(MENSAJE_REGISTRADO, model.NumPresupuesto);
        }

         public string ModificarPresupuesto(PresupuestoEN model, List<DetallePresupuestoEN> DetallePresupuesto)
        {
            ICollection<DetallePresupuestoEN> detalleRespaldo = model.DetallePresupuesto;
            InformeAccidenteEN InformeAccidenteRespaldo = model.InformeAccidente;
            try
            {

                IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
                IDetallePresupuestoDAO detallePresupuestoDao = new DetallePresupuestoDAO();

                model.Estado = ESTADO_REGISTRADO;

                model.UsuarioModifico = usuario;
                model.FechaModifico = DateTime.Now;

                //Recorrer el listado anterior
                foreach (DetallePresupuestoEN detalle in model.DetallePresupuesto)
                {
                    //evaluar los item del listado anterior que no se encuentren en el listado actual

                    if (DetallePresupuesto.Find(m =>
                        m.MS_Detalle_Presupuesto_Id == detalle.MS_Detalle_Presupuesto_Id) == null)
                    {
                        //OJO: Para eliminar, primero se debe obtener el objeto desde la bd (Indispensable en ORM)
                        DetallePresupuestoEN detalleDel = detallePresupuestoDao.Get(detalle.MS_Detalle_Presupuesto_Id);
                        //Removemos el item de la bd
                        detallePresupuestoDao.Remove(detalleDel);
                    }
                }


                foreach (DetallePresupuestoEN detalle in DetallePresupuesto)
                {
                    if (detalle.MS_Detalle_Presupuesto_Id == 0)
                    {
                        detalle.MS_Presupuesto_Id = model.MS_Presupuesto_Id;
                        detallePresupuestoDao.Add(detalle);
                    }
                    else
                    {
                        detallePresupuestoDao.Modify(detalle);
                    }
                }
                model.DetallePresupuesto = null;
                model.InformeAccidente = null;
                presupuestoDao.Modify(model);
            }
            catch (Exception e)
            {
                model.DetallePresupuesto = detalleRespaldo;
                model.InformeAccidente = InformeAccidenteRespaldo;
                throw new Exception(MENSAJE_ERROR_GENERAL);
            }
            return String.Format(MENSAJE_ACTUALIZADO, model.NumPresupuesto);
        }


         public List<PresupuestoEN> BuscarPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza, string FechaPresupuesto)
         {
             string NumPresupuestoParam = NumPresupuesto == null ? "" : NumPresupuesto.ToUpper();
             string NumInformeParam = NumInforme == null ? "" : NumInforme.ToUpper();
             string NumPolizaParam = NumPoliza == null ? "" : NumPoliza.ToUpper();
             string FechaPresupuestoParam = FechaPresupuesto == null ? "" : FechaPresupuesto;

             List<PresupuestoEN> listaPresupuesto = new List<PresupuestoEN>();

             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();

             foreach (PresupuestoEN Presupuesto in presupuestoDao.GetAll().Where(
                         b => ((b.NumPresupuesto.ToUpper().Contains(NumPresupuestoParam))
                             && (b.InformeAccidente.NumInforme.ToUpper().Contains(NumInformeParam))
                             && (b.InformeAccidente.Siniestro.Poliza.NumPoliza.ToUpper().Contains(NumPolizaParam))
                             
                             )
                        ).ToList()
                     )
             {
                 string fecPresupuesto = Presupuesto.FechaPresupuesto.ToString("d");
                 if (fecPresupuesto.Contains(FechaPresupuestoParam))
                 {
                     listaPresupuesto.Add(Presupuesto);
                 }
             }

             if (listaPresupuesto.Count() == 0) {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             //return new JavaScriptSerializer().Serialize(listaPresupuesto);
             return listaPresupuesto;
         }

         public List<PresupuestoEN> ListarPresupuesto()
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
            List<PresupuestoEN> listaPresupuesto;
            listaPresupuesto = presupuestoDao.GetAll().ToList();

            if (listaPresupuesto == null || listaPresupuesto.Count() == 0)
            {
                throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
            }
            //return new JavaScriptSerializer().Serialize(listaPresupuesto);
            return listaPresupuesto;
         }
         //CODIGO AGREGADO POR EDUARDO PASSANO CH. INICIO
         public List<PresupuestoPendienteCabeceraEN> ListarPresupuestoPendiente()
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
             List<PresupuestoEN> listaPresupuestoPendiente = new List<PresupuestoEN>();
             List<PresupuestoPendienteCabeceraEN> listaPresupuestoPendiente1 = new List<PresupuestoPendienteCabeceraEN>();
             foreach (PresupuestoEN Model in presupuestoDao.GetAll().Where(
                   b => b.Estado == 41).ToList())
             {

                 PresupuestoPendienteCabeceraEN item = new PresupuestoPendienteCabeceraEN()
                 {
                     PresupuestoID = Model.MS_Presupuesto_Id,
                     NumeroPoliza = Model.InformeAccidente.Siniestro.Poliza.NumPoliza,
                     MatriculaVehiculo = Model.InformeAccidente.Siniestro.Poliza.Vehiculo.Placa,
                     SubTotal = Model.SubTotal.ToString(),
                     Total = Model.Total.ToString(),
                     Estado = Model.Estado
                 };
                 listaPresupuestoPendiente1.Add(item);
             }

             // if (listaPresupuestoPendiente == null || listaPresupuestoPendiente.Count() == 0)
             //  {
             //   throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             //  }
             //return new JavaScriptSerializer().Serialize(listaPresupuesto);
             return listaPresupuestoPendiente1;
         }



         public DetallePresupuestoEN ObtenerPresupuestoDetalle(int Id)
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
             PresupuestoEN model = presupuestoDao.Get(Id);

             DetallePresupuestoEN item = new DetallePresupuestoEN();

             if (model == null)
             {
                 throw new Exception(MENSAJE_NO_DISPONIBLE);
             }
             return item;
         }

         public List<PresupuestoPendienteDetalleEN> ObtenerPresupuestoPendienteDetalle(int Id)
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
             List<PresupuestoPendienteDetalleEN> listaPresupuestoPendienteDetalle = new List<PresupuestoPendienteDetalleEN>();
             PresupuestoEN model = presupuestoDao.Get(Id);
             foreach (DetallePresupuestoEN detalle in model.DetallePresupuesto)
             {
                 PresupuestoPendienteDetalleEN item = new PresupuestoPendienteDetalleEN();
                 {
                     if (detalle.MS_Presupuesto_Id == model.MS_Presupuesto_Id)
                     {
                         item.Importe = detalle.Importe.ToString();
                         item.Descuento = detalle.Descuento.ToString();
                         item.Servicio = detalle.ListaPrecio.Servicio.Descripcion.ToString();
                         item.Precio = detalle.ListaPrecio.Precio.ToString();
                     }
                     listaPresupuestoPendienteDetalle.Add(item);
                 }
             }

             return listaPresupuestoPendienteDetalle;

         }

         public string AprobarPresupuestoPendiente(int Id)
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
             PresupuestoEN model = presupuestoDao.Get(Id);
             try
             {
                 model.Estado = ESTADO_APROBADO;
                 model.UsuarioModifico = usuario;
                 model.FechaModifico = DateTime.Now;
                 presupuestoDao.Modify(model);
             }
             catch (Exception e)
             {
                 throw new Exception(MENSAJE_ERROR_GENERAL);
             }

             return String.Format(MENSAJE_REGISTRADO, model.NumPresupuesto);
         }

         public string RechazarPresupuestoPendiente(int Id, string motivo)
         {
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();
             PresupuestoEN model = presupuestoDao.Get(Id);
             try
             {
                 model.Estado = ESTADO_RECHAZADO;
                 model.ObservacionRechazo = motivo;
                 model.UsuarioModifico = usuario;
                 model.FechaModifico = DateTime.Now;
                 presupuestoDao.Modify(model);
             }
             catch (Exception e)
             {
                 throw new Exception(MENSAJE_ERROR_GENERAL);
             }

             return String.Format(MENSAJE_REGISTRADO, model.NumPresupuesto);
         }

         public List<PresupuestoPendienteCabeceraEN> BuscarPresupuestoPendiente(string NumPresupuesto, string NumInforme, string NumPoliza, string FechaPresupuesto)
         {
             string NumPresupuestoParam = NumPresupuesto == null ? "" : NumPresupuesto.ToUpper();
             string NumInformeParam = NumInforme == null ? "" : NumInforme.ToUpper();
             string NumPolizaParam = NumPoliza == null ? "" : NumPoliza.ToUpper();
             string FechaPresupuestoParam = FechaPresupuesto == null ? "" : FechaPresupuesto;

             List<PresupuestoEN> listaPresupuesto = new List<PresupuestoEN>();
             List<PresupuestoPendienteCabeceraEN> listaPresupuestoPendiente1 = new List<PresupuestoPendienteCabeceraEN>();
             IPresupuestoDAO presupuestoDao = new PresupuestoDAO();

             foreach (PresupuestoEN Presupuesto in presupuestoDao.GetAll().Where(
                         b => ((b.NumPresupuesto.ToUpper().Contains(NumPresupuestoParam))
                             && (b.InformeAccidente.NumInforme.ToUpper().Contains(NumInformeParam))
                             && (b.InformeAccidente.Siniestro.Poliza.NumPoliza.ToUpper().Contains(NumPolizaParam))

                             )
                        ).ToList()
                     )
             {
                 string fecPresupuesto = Presupuesto.FechaPresupuesto.ToString("d");
                 if (fecPresupuesto.Contains(FechaPresupuestoParam))
                 {
                     PresupuestoPendienteCabeceraEN item = new PresupuestoPendienteCabeceraEN()
                     {
                         PresupuestoID = Presupuesto.MS_Presupuesto_Id,
                         NumeroPoliza = Presupuesto.InformeAccidente.Siniestro.Poliza.NumPoliza,
                         MatriculaVehiculo = Presupuesto.InformeAccidente.Siniestro.Poliza.Vehiculo.Placa,
                         SubTotal = Presupuesto.SubTotal.ToString(),
                         Total = Presupuesto.Total.ToString(),
                         Estado = Presupuesto.Estado
                     };
                     listaPresupuestoPendiente1.Add(item);
                 }
             }

             if (listaPresupuestoPendiente1.Count() == 0)
             {
                 throw new Exception(MENSAJE_BUSQUEDA_NO_ENCONTRADA);
             }
             //return new JavaScriptSerializer().Serialize(listaPresupuesto);
             return listaPresupuestoPendiente1;
         }




    }
}
