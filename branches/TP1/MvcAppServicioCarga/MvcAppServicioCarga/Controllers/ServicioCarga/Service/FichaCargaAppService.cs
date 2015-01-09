using MvcAppServicioCarga.Controllers.ServicioCarga;
using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MvcAppServicioCarga.Controllers.ServicioCarga.Service
{
    public class FichaCargaAppService : IFichaCargaAppService
    {

        
        /*
        private static string ESTADO_REGISTRADO = "Registrado";
        private static string ESTADO_ANULADO = "Anulado";
        private static string ESTADO_ENTREGADO = "Entregada";
        */
        public static int ESTADO_REGISTRADO = 1;
        public static int ESTADO_ENVIADO = 2;
        public static int ESTADO_RECIBIDO = 3;
        public static int ESTADO_ENTREGADO = 4;
        public static int ESTADO_ANULADO = 5;

        //private static string ESTADO_PAGADO = "Entregada";


        /*private static string ESTADO_PAGO_PENDIENTE = "Pendiente";
        private static string ESTADO_PAGO_CANCELADO = "Cancelado";*/


        private static string MENSAJE_ERROR_GENERAL = "No se pudo actualizar la ficha carga";
        private static string MENSAJE_NO_DISPONIBLE = "La ficha carga no se encuentra disponible";

        private static string MENSAJE_REGISTRADO = "La ficha carga se registró con éxito. Se debe pagar el comprobante pago: {0}";
        private static string MENSAJE_ACTUALIZADO = "La ficha carga se actualizó con éxito";
        private static string MENSAJE_ANULADO = "La ficha carga se anuló con éxito";
        private static string MENSAJE_VERIFICADO = "Se registró la entrega de la ficha carga con éxito";
        private static string MENSAJE_CLAVE_INCORRECTA = "El código de seguridad ingresado es incorrecto";
        private static string MENSAJE_NO_PAGADA = "La ficha carga se encuentra pendiente de pago";
        private static string MENSAJE_COMPROBANTE_INCORRECTO = "El comprobante de pago no corresponde a la ficha carga";
        private static string MENSAJE_VALIDA_PAGO = "Se registró el pago de la ficha carga con éxito";
        
        
        /*private static string MENSAJE_CLAVE_VACIA = "Ingresar Código de Seguridad para registrar servicio";
        private static string MENSAJE_CLAVE_MIN = "Ingresar mínimo 4 caracteres en el Código de Seguridad";*/



        String usuario = "acastillo";

        IFichaCargaDAO _FichaCargaRepositorio;
        IDetalleFCargaDAO _DetalleFichaCargaRepositorio;
        IFichaMovimientoDAO _FichaMovimientoRepositorio;
        IProgramacionRutaDAO _ProgramacionRutaRepositorio;
        
         public FichaCargaAppService(FichaCargaDAO fichaCargaDAO, DetalleFCargaDAO detalleFichaCargaDAO, FichaMovimientoDAO fichaMovimientoDAO)
         {
             _FichaCargaRepositorio = fichaCargaDAO;
             _DetalleFichaCargaRepositorio = detalleFichaCargaDAO;
             _FichaMovimientoRepositorio = fichaMovimientoDAO;
             _ProgramacionRutaRepositorio = new ProgramacionRutaDAO();
         }

        //Pendiente Pago
        //
         public List<TipoCargaDTO> ListarTipoCarga()
         {
             List<TipoCargaDTO> TipoCarga = new List<TipoCargaDTO>();
             TipoCarga.Add(new TipoCargaDTO() { Id = "PE", Descripcion = "Pesado" });
             TipoCarga.Add(new TipoCargaDTO() { Id = "LIV", Descripcion = "Liviano" });
             TipoCarga.Add(new TipoCargaDTO() { Id = "FR", Descripcion = "Frágil" });
             TipoCarga.Add(new TipoCargaDTO() { Id = "LI", Descripcion = "Ligero" });
             return TipoCarga;
         }


         public List<TipoPagoDTO> ListarTipoPago()
         {
             List<TipoPagoDTO> TipoPago = new List<TipoPagoDTO>();
             TipoPago.Add(new TipoPagoDTO() { Id = "Origen", Descripcion = "Pago en el Origen" });
             TipoPago.Add(new TipoPagoDTO() { Id = "Destino", Descripcion = "Pago en el Destino" });
             return TipoPago;
         }

         public MGFichaCarga ObtenerFichaCarga(int Id)
        {
            MGFichaCarga FichaCarga = _FichaCargaRepositorio.Get(Id);
            if (FichaCarga == null)
            {
                throw new ValidationException(MENSAJE_NO_DISPONIBLE);
            }
            return FichaCarga;
        }

         public string AgregarFichaCarga(MGFichaCarga FichaCargaAdd)
        {
            try
            {
                FichaCargaAdd.Estado = ESTADO_REGISTRADO;
                FichaCargaAdd.FechaRegistro = DateTime.Now;

                FichaCargaAdd.UsuarioRegistra = usuario;
                FichaCargaAdd.FechaRegistra = DateTime.Now;
                FichaCargaAdd.UsuarioModifica = usuario;
                FichaCargaAdd.FechaModifica = DateTime.Now;


                //Generando el comrpobante de pago
                MGComprobantePago CoprobantePago = new MGComprobantePago()
                {
                    FechaRegistro= DateTime.Now,
                    MG_ComprobantePago_ID = "CP" + DateTime.Now.ToString("yyyyMMddHHmmss")
                };
                FichaCargaAdd.ComprobantePago = CoprobantePago;

                

                _FichaCargaRepositorio.Add(FichaCargaAdd);

                MGProgramacionRuta ProgramacionRuta = _ProgramacionRutaRepositorio.Get(FichaCargaAdd.MK_ProgramacionRuta_ID);

                MGFichaMovimiento FichaMovimiento = new MGFichaMovimiento()
                {
                    MG_Agencia_ID = ProgramacionRuta.Ruta.MG_Agencia_Origen_ID,
                    MG_FichaCarga_ID = FichaCargaAdd.MG_FichaCarga_ID,
                    MG_Tipo_Movimiento_ID = FichaCargaAdd.Estado,
                    UsuarioRegistra = usuario,
                    FechaRegistra = DateTime.Now,
                    UsuarioModifica = usuario,
                    FechaModifica = DateTime.Now
                };

                _FichaMovimientoRepositorio.Add(FichaMovimiento);

            }
            catch (Exception e)
            {
                throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
            }
            //return "Ficha de Carga grada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
            return String.Format(MENSAJE_REGISTRADO, FichaCargaAdd.ComprobantePago.MG_ComprobantePago_ID);
        }

         public string ModificarFichaCarga(MGFichaCarga FichaCarga, List<MGDetalleFCarga> DetalleFichaCarga)
        {
            try
            {


                FichaCarga.Estado = ESTADO_REGISTRADO;

                FichaCarga.UsuarioModifica = usuario;
                FichaCarga.FechaModifica = DateTime.Now;

                //Recorrer el listado anterior
                foreach (MGDetalleFCarga detalle in FichaCarga.DetalleFichaCarga)
                {
                    //evaluar los item del listado anterior que no se encuentren en el listado actual

                    if (DetalleFichaCarga.Find(m =>
                        m.MG_FichaCarga_MG_FichaCarga_ID == detalle.MG_FichaCarga_MG_FichaCarga_ID) == null)
                    {
                        //OJO: Para eliminar, primero se debe obtener el objeto desde la bd (Indispensable en ORM)
                        MGDetalleFCarga detalleDel =  _DetalleFichaCargaRepositorio.Get(detalle.MG_FichaCarga_MG_FichaCarga_ID);
                        //Removemos el item de la bd
                        _DetalleFichaCargaRepositorio.Remove(detalleDel);
                    }
                }


                foreach (MGDetalleFCarga detalle in DetalleFichaCarga)
                {
                    if (detalle.MG_FichaCarga_ID == 0)
                    {
                        detalle.MG_FichaCarga_ID = FichaCarga.MG_FichaCarga_ID;
                        _DetalleFichaCargaRepositorio.Add(detalle);
                    }
                    else
                    {
                        _DetalleFichaCargaRepositorio.Modify(detalle);
                    }
                }

                FichaCarga.DetalleFichaCarga = null;
                //FichaMovimiento.ComprobantePago = null;
                _FichaCargaRepositorio.Modify(FichaCarga);
            }
            catch (Exception e)
            {
                throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
            }
            //return "Ficha de Carga grada satisfactoriamente:" + FichaMovimiento.MG_FichaCarga_ID;
            return MENSAJE_ACTUALIZADO;
        }

         public string EliminarFichaCarga(MGFichaCarga FichaCargaAdd)
        {
            try
            {
                _FichaCargaRepositorio.Remove(FichaCargaAdd);
            }
            catch (Exception e)
            {
                throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
            }
            return "Ficha de Carga eliminada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
        }

         public string AnularFichaCarga(MGFichaCarga FichaCargaAdd)
         {
             try
             {
                 FichaCargaAdd.Estado = ESTADO_ANULADO;

                 FichaCargaAdd.UsuarioModifica = usuario;
                 FichaCargaAdd.FechaModifica = DateTime.Now;

                 _FichaCargaRepositorio.Modify(FichaCargaAdd);


                 MGProgramacionRuta ProgramacionRuta = _ProgramacionRutaRepositorio.Get(FichaCargaAdd.MK_ProgramacionRuta_ID);

                 MGFichaMovimiento FichaMovimiento = new MGFichaMovimiento()
                 {
                     MG_Agencia_ID = ProgramacionRuta.Ruta.MG_Agencia_Origen_ID,
                     MG_FichaCarga_ID = FichaCargaAdd.MG_FichaCarga_ID,
                     MG_Tipo_Movimiento_ID = FichaCargaAdd.Estado,
                     UsuarioRegistra = usuario,
                     FechaRegistra = DateTime.Now,
                     UsuarioModifica = usuario,
                     FechaModifica = DateTime.Now
                 };

                 _FichaMovimientoRepositorio.Add(FichaMovimiento);


             }
             catch (Exception e)
             {
                 throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
             }
             //return "Ficha de Carga eliminada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
             return MENSAJE_ANULADO;
         }

         public List<MGFichaCarga> BuscarFichaCarga(string Nombre, string Dni)
         {
             string NombreParam = Nombre.ToUpper();

             List<MGFichaCarga> listaFichaCargas = new List<MGFichaCarga>();

             foreach (MGFichaCarga FichaCarga in _FichaCargaRepositorio.GetAll().Where(
                         b => ((b.Remitente.Nombres.ToUpper().Contains(NombreParam) || b.Destinatario.Nombres.Contains(NombreParam))
                             && (b.Remitente.Documento.Contains(Dni) || b.Destinatario.Documento.Contains(Dni))
                             )
                        ).ToList()
                     )
             {
                 listaFichaCargas.Add(FichaCarga);
             }
             return listaFichaCargas;
        }
        
         public List<MGFichaCarga> BuscarFichaCarga(string Nombre, string Dni, string ApellidoPaterno, string ApellidoMaterno)
         {
             string NombreParam = Nombre.ToUpper();
             string ApePatParam = ApellidoPaterno.ToUpper();
             string ApeMatParam = ApellidoMaterno.ToUpper();

             List<MGFichaCarga> listaFichaCargas = new List<MGFichaCarga>();

             foreach (MGFichaCarga FichaCarga in _FichaCargaRepositorio.GetAll().Where(
                         b => ((b.Remitente.Nombres.ToUpper().Contains(NombreParam) || b.Destinatario.Nombres.Contains(NombreParam))
                             && (b.Remitente.Documento.Contains(Dni) || b.Destinatario.Documento.Contains(Dni))
                             && (b.Remitente.ApellidosPaterno.ToUpper().Contains(ApePatParam) || b.Destinatario.ApellidosPaterno.ToUpper().Contains(ApePatParam))
                             && (b.Remitente.ApellidosMaterno.ToUpper().Contains(ApeMatParam) || b.Destinatario.ApellidosMaterno.ToUpper().Contains(ApeMatParam))
                             )
                        ).ToList()
                     )
             {
                 listaFichaCargas.Add(FichaCarga);
             }
             return listaFichaCargas;
         }

         public List<MGFichaCarga> ListarFichaCarga()
        {
            return _FichaCargaRepositorio.GetAll().ToList();
        }


         public string EncriptarClaveSeguridad(string ClaveSeguridad)
         {
             /*if (ClaveSeguridad == null || ClaveSeguridad == "")
             {
                 throw new ValidationException(MENSAJE_CLAVE_VACIA);
             }
             else if (ClaveSeguridad.Length < 4)
             {
                 throw new ValidationException(MENSAJE_CLAVE_MIN);
             }*/
             var claveEncriptada = System.Text.Encoding.UTF8.GetBytes(ClaveSeguridad);
             return System.Convert.ToBase64String(claveEncriptada);
         }

         public string DesencriptarClaveSeguridad(string ClaveSeguridad)
         {
             /*if (ClaveSeguridad == null || ClaveSeguridad == "")
             {
                 throw new ValidationException(MENSAJE_CLAVE_VACIA);
             }
             else if (ClaveSeguridad.Length < 4)
             {
                 throw new ValidationException(MENSAJE_CLAVE_MIN);
             }*/

             var claveDesencriptada = System.Convert.FromBase64String(ClaveSeguridad);
             return System.Text.Encoding.UTF8.GetString(claveDesencriptada);
         }


         public string ValidarPagoFichaCarga(string ComprobantePagoIDIngresado, MGFichaCarga FichaCarga)
         {

             if (FichaCarga.ComprobantePago == null || FichaCarga.ComprobantePago.MG_ComprobantePago_ID == null)
             {
                 throw new ValidationException(MENSAJE_NO_PAGADA);
             }
             else if (FichaCarga.ComprobantePago.MG_ComprobantePago_ID != ComprobantePagoIDIngresado)
             {
                 throw new ValidationException(MENSAJE_COMPROBANTE_INCORRECTO);
             }


             try
             {
                 FichaCarga.EstadoPago = true;
                 FichaCarga.UsuarioModifica = usuario;
                 FichaCarga.FechaModifica = DateTime.Now;

                 FichaCarga.ProgramacionRuta = null;
                 FichaCarga.Destinatario = null;
                 FichaCarga.Remitente = null;
                 FichaCarga.ComprobantePago = null;
                 _FichaCargaRepositorio.Modify(FichaCarga);
             }
             catch (Exception e)
             {
                 throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
             }
             //return "Ficha de Carga eliminada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
             return MENSAJE_VALIDA_PAGO;
         }


         public string ValidarFichaCarga(string ClaveSeguridadIngresado, MGFichaCarga FichaCargaAdd)
         {

             if (FichaCargaAdd.ClaveSeguridad != ClaveSeguridadIngresado)
             {
                 throw new ValidationException(MENSAJE_CLAVE_INCORRECTA);
             }

             try
             {

                 FichaCargaAdd.Estado = ESTADO_ENTREGADO;

                 FichaCargaAdd.UsuarioModifica = usuario;
                 FichaCargaAdd.FechaModifica = DateTime.Now;
                 FichaCargaAdd.FechaEntrega = DateTime.Now;

                 FichaCargaAdd.ProgramacionRuta = null;
                 FichaCargaAdd.Destinatario = null;
                 FichaCargaAdd.Remitente = null;
                 _FichaCargaRepositorio.Modify(FichaCargaAdd);

                MGProgramacionRuta ProgramacionRuta = _ProgramacionRutaRepositorio.Get(FichaCargaAdd.MK_ProgramacionRuta_ID);

                 MGFichaMovimiento FichaMovimiento = new MGFichaMovimiento()
                 {
                     MG_Agencia_ID = ProgramacionRuta.Ruta.MG_Agencia_Destino_ID,
                     MG_FichaCarga_ID = FichaCargaAdd.MG_FichaCarga_ID,
                     MG_Tipo_Movimiento_ID = FichaCargaAdd.Estado,
                     UsuarioRegistra = usuario,
                     FechaRegistra = DateTime.Now,
                     UsuarioModifica = usuario,
                     FechaModifica = DateTime.Now
                 };

                 _FichaMovimientoRepositorio.Add(FichaMovimiento);

             }
             catch (Exception e)
             {
                 throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
             }
             //return "Ficha de Carga eliminada satisfactoriamente:" + FichaCargaAdd.MG_FichaCarga_ID;
             return MENSAJE_VERIFICADO;
         }


         public MGFichaMovimiento ObtenerFichaMovimiento(int Id)
         {
             MGFichaMovimiento FichaMovimiento = _FichaMovimientoRepositorio.Get(Id);
             if (FichaMovimiento == null)
             {
                 throw new ValidationException(MENSAJE_NO_DISPONIBLE);
             }
             return FichaMovimiento;
         }


         public List<MGFichaMovimiento> ListarFichaMovimiento()
         {
             return _FichaMovimientoRepositorio.GetAll().ToList();
         }


         public List<MGFichaMovimiento> BuscarFichaMovimiento(string FichaMovimientoID, string FichaCargaID, string TipoMovimientoID, string AgenciaID)
         {

             List<MGFichaMovimiento> listaFichaMovimiento = new List<MGFichaMovimiento>();

             foreach (MGFichaMovimiento FichaMovimiento in _FichaMovimientoRepositorio.GetAll().Where(
                         b => (b.MG_FichaMovimiento_ID.ToString().Contains(FichaMovimientoID) && b.MG_FichaCarga_ID.ToString().Contains(FichaCargaID)
                             && b.MG_Tipo_Movimiento_ID.ToString().Contains(TipoMovimientoID) && b.MG_Agencia_ID.ToString().Contains(AgenciaID)
                             )
                        ).ToList()
                     )
             {
                 listaFichaMovimiento.Add(FichaMovimiento);
             }
             return listaFichaMovimiento;
         }

         public string ModificarFichaMovimiento(MGFichaMovimiento FichaMovimiento)
         {
             try
             {

                 FichaMovimiento.UsuarioModifica = usuario;
                 FichaMovimiento.FechaModifica = DateTime.Now; 

                 FichaMovimiento.Agencia = null;
                 FichaMovimiento.TipoMovimiento = null;
                 _FichaMovimientoRepositorio.Modify(FichaMovimiento);
             }
             catch (Exception e)
             {
                 throw new ValidationException(MENSAJE_ERROR_GENERAL, e);
             }
             //return "Ficha de Carga grada satisfactoriamente:" + FichaMovimiento.MG_FichaCarga_ID;
             return MENSAJE_ACTUALIZADO;
         }
    }
}
