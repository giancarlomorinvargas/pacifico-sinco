using MvcAppServicioCarga.Controllers.ServicioCarga;
using MvcAppServicioCarga.Controllers.ServicioCarga.Service;
using MvcAppServicioCarga.Models.ServicioCarga;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace MvcModuloServicioCarga.Controllers.ServicioCarga
{
    public class FichaCargaController : Controller
    {
        /*Inyección de dependencias*/
        IFichaCargaAppService service = new FichaCargaAppService(new FichaCargaDAO(), new DetalleFCargaDAO(), new FichaMovimientoDAO());


        IProgramacionRutaAppService serviceProgramacionRuta = new ProgramacionRutaAppService(new ProgramacionRutaDAO());
        IClienteAppService serviceCliente = new ClienteServiceAppService(new ClienteDAO());
        IProductoAppService serviceProducto = new ProductoServiceAppService(new ProductoDAO());
        IAgenciaAppService serviceAgencia = new AgenciaAppService(new AgenciaDAO());
        ITipoFichaMovimientoAppService serviceTipoMovimiento = new TipoFichaMovimientoAppService(new TipoMovimientoDAO());


        private List<SelectListItem> ObtenerListadoTipoCarga()
        {
            List<TipoCargaDTO> ListaTipoCarga = service.ListarTipoCarga();

            List<SelectListItem> Listado = new List<SelectListItem>();
            foreach (TipoCargaDTO item in ListaTipoCarga)
            {
                Listado.Add(new SelectListItem { Value = item.Id, Text = item.Descripcion });
            }
            return Listado;
        }

        private List<SelectListItem> ObtenerListadoTipoPago()
        {
            List<TipoPagoDTO> ListaTipoPago = service.ListarTipoPago();
            List<SelectListItem> Listado = new List<SelectListItem>();
            foreach (TipoPagoDTO item in ListaTipoPago)
            {
                Listado.Add(new SelectListItem { Value = item.Id, Text = item.Descripcion });
            }
            return Listado;
        }

        private List<SelectListItem> ObtenerListadoAgencia()
        {
            List<MGAgencia> ListaAgencia = serviceAgencia.ListarAgencia();
            List<SelectListItem> Listado = new List<SelectListItem>();
            Listado.Add(new SelectListItem { Value = "", Text = "Seleccione" });
            foreach (MGAgencia item in ListaAgencia)
            {
                Listado.Add(new SelectListItem { Value = item.MG_Agencia_ID + "", Text = item.Descripcion });
            }
            return Listado;
        }

        private List<SelectListItem> ObtenerListadoTipoMovimiento()
        {
            List<MGTipoMovimiento> Lista = serviceTipoMovimiento.ListarTipoMovimiento();
            List<SelectListItem> Listado = new List<SelectListItem>();
            Listado.Add(new SelectListItem { Value = "", Text = "Seleccione" });
            foreach (MGTipoMovimiento item in Lista)
            {
                Listado.Add(new SelectListItem { Value = item.MG_Tipo_Movimiento_ID + "", Text = item.Descripcion });
            }
            return Listado;
        }


        //
        // GET: /ActualizarFichaCarga/

        public ActionResult Index()
        {

            try
            {


                List<MGFichaCarga> model = service.ListarFichaCarga().ToList();
                return View("ListadoFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListadoFichaCarga");
            }
        }

        [HttpPost]
        public ActionResult Index(string Nombre, string Dni, string ApellidoPaterno, string ApellidoMaterno)
        {
            Session["Mensaje"] = "";
            try
            {
                List<MGFichaCarga> model = service.BuscarFichaCarga(Nombre, Dni, ApellidoPaterno, ApellidoMaterno).ToList();
                return View("ListadoFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListadoFichaCarga");
            }
        }

        //
        // GET: Details/5

        public ActionResult Details(int id)
        {

            Session["Mensaje"] = "";

            try
            {
                MGFichaCarga model = service.ObtenerFichaCarga(id);

                return View(model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View();
            }
        }





        //TODO: Mover este metodo al controlador de Programacion
        public ActionResult ConsultarProgramacion()
        {
            ViewBag.ListadoProgramacionRuta = serviceProgramacionRuta.Listar().ToList();
            return View("ConsultarProgramacionRuta");
        }

        //TODO: Mover este metodo al controlador de Cliente
        public ActionResult ConsultarCliente()
        {
            ViewBag.ListadoCliente = serviceCliente.Listar().ToList();
            return View("ConsultarCliente");
        }



        //TODO: Mover este metodo al controlador de Programacion
        public ActionResult ConsultarProducto()
        {
            ViewBag.ListadoProducto = serviceProducto.Listar().ToList();
            return View("ConsultarProducto");
        }


        public ActionResult IngresarClaveSeguridad()
        {
            try
            {
                return View("IngresarClaveSeguridad");
            }
            catch (Exception ex)
            {
                Session["Mensaje"] = ex.Message;
                return View();
            }
        }

        [HttpPost]
        public ActionResult IngresarClaveSeguridad(string ClaveSeguridad)
        {
            try
            {
                string claveEncriptada = service.EncriptarClaveSeguridad(ClaveSeguridad);
                return Json(claveEncriptada);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View();
            }
        }



        //
        // GET: Create

        public ActionResult Create()
        {
            Session["Mensaje"] = "";
            if (Session["ListadoTipoPago"] == null)
                Session["ListadoTipoPago"] = ObtenerListadoTipoPago();

            if (Session["ListadoTipoCarga"] == null)
                Session["ListadoTipoCarga"] = ObtenerListadoTipoCarga();

            return View("CrearFichaCarga");
        }

        //
        // POST: Create

        [HttpPost]
        public ActionResult Create(MGFichaCarga model)
        {
            try
            {
                Session["Mensaje"] = "";

                string DetalleFichaCargaSerializado = Request["detalleFichaCarga"];

                MGFichaCarga FichaCargaDes = new JavaScriptSerializer().Deserialize<MGFichaCarga>(DetalleFichaCargaSerializado);
                
                model.DetalleFichaCarga = FichaCargaDes.DetalleFichaCarga;

                string mensaje= service.AgregarFichaCarga(model);

                //Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();
                Session["Mensaje"] = mensaje;

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("CrearFichaCarga", model);
            }
        }
        
        //
        // GET: Edit/5
 
        public ActionResult Edit(int id)
        {
            Session["Mensaje"] = "";
            if (Session["ListadoTipoPago"] == null)
                Session["ListadoTipoPago"] = ObtenerListadoTipoPago();

            if (Session["ListadoTipoCarga"] == null)
                Session["ListadoTipoCarga"] = ObtenerListadoTipoCarga();
            try
            {
                MGFichaCarga model = service.ObtenerFichaCarga(id);

                string DetalleFichaCargaSerializado = new JavaScriptSerializer().Serialize(model.DetalleFichaCarga);

                Session["detalleFichaCarga"] = DetalleFichaCargaSerializado;
                Session["detalleFichaCargaAnterior"] = model.DetalleFichaCarga;

                return View("ActualizarFichaCarga",model);

            }
            catch (Exception ex)
            {
                Session["Mensaje"] = ex.Message;
                return RedirectToAction("ListadoFichaCarga");
            }
        }

        //
        // POST: Edit/5

        [HttpPost]
        public ActionResult Edit(int id, MGFichaCarga model)
        {
            try
            {
                Session["Mensaje"] = "";

                string DetalleFichaCargaSerializado = Request["detalleFichaCarga"];
                Session["detalleFichaCarga"] = null;

                MGFichaCarga FichaCargaDes = new JavaScriptSerializer().Deserialize<MGFichaCarga>(DetalleFichaCargaSerializado);

                model.DetalleFichaCarga = (ICollection<MGDetalleFCarga>)Session["detalleFichaCargaAnterior"];
                Session["detalleFichaCargaAnterior"] = null;

                string mensaje = service.ModificarFichaCarga(model, FichaCargaDes.DetalleFichaCarga.ToList());

                //Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();
                Session["Mensaje"] = mensaje;

                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ActualizarFichaCarga", model);
            }
        }


        //
        // GET: Delete/5

        public ActionResult Anular(int id)
        {
            Session["Mensaje"] = "";
            try
            {
                MGFichaCarga model = service.ObtenerFichaCarga(id);

                return View("AnularFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return RedirectToAction("Index");
            }
        }

        //
        // POST: Delete/5

        [HttpPost]
        public ActionResult Anular(int id, MGFichaCarga model)
        {
            try
            {
                string mensaje = service.AnularFichaCarga(model);
                //Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();
                Session["Mensaje"] = mensaje;
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("AnularFichaCarga", model);
            }
        }


        public ActionResult ValidarPago(int id)
        {
            Session["Mensaje"] = "";
            try
            {
                MGFichaCarga model = service.ObtenerFichaCarga(id);
                /*ViewBag["Remitente"] = model.Remitente;
                ViewBag["Destinatario"] = model.Destinatario;
                ViewBag["ProgramacionRuta"] = model.ProgramacionRuta;*/
                return View("ValidarPagoFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return RedirectToAction("Index");
            }
        }


        [HttpPost]
        public ActionResult ValidarPago(int id, string ComprobantePagoIDIngresado, MGFichaCarga model)
        {
            try
            {
                /*ViewBag["Remitente"] = model.Remitente;
                ViewBag["Destinatario"] = model.Destinatario;
                ViewBag["ProgramacionRuta"] = model.ProgramacionRuta;*/

                string mensaje = service.ValidarPagoFichaCarga(ComprobantePagoIDIngresado, model);
                //Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();
                Session["Mensaje"] = mensaje;
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ValidarPagoFichaCarga", model);
            }
        }


        //
        // GET: /ActualizarFichaCarga/

        public ActionResult ListaValidarFichaCarga()
        {


            try
            {


                /*if (Session["ListadoFichaCarga"] == null)
                    Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();*/


                List<MGFichaCarga> model = service.ListarFichaCarga().ToList();
                return View("ListadoValidarFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListaValidarFichaCarga");
            }
        }

        [HttpPost]
        public ActionResult ListaValidarFichaCarga(string Nombre, string Dni, string ApellidoPaterno, string ApellidoMaterno)
        {
            Session["Mensaje"] = "";
            try
            {
                List<MGFichaCarga> model = service.BuscarFichaCarga(Nombre, Dni, ApellidoPaterno, ApellidoMaterno).ToList();
                return View("ListadoValidarFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListaValidarFichaCarga");
            }
        }


        public ActionResult Validar(int id)
        {
            Session["DetalleValidarFichaCarga"] = "";
            Session["Mensaje"] = "";
            try
            {
                MGFichaCarga model = service.ObtenerFichaCarga(id);
                /*ViewBag["Remitente"] = model.Remitente;
                ViewBag["Destinatario"] = model.Destinatario;
                ViewBag["ProgramacionRuta"] = model.ProgramacionRuta;*/
                Session["DetalleValidarFichaCarga"] = model.DetalleFichaCarga;
                return View("ValidarFichaCarga", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return RedirectToAction("ListaValidarFichaCarga");
            }
        }
         

        [HttpPost]
        public ActionResult Validar(int id, string ClaveSeguridadIngresada, MGFichaCarga model)
        {
            try
            {
                /*ViewBag["Remitente"] = model.Remitente;
                ViewBag["Destinatario"] = model.Destinatario;
                ViewBag["ProgramacionRuta"] = model.ProgramacionRuta;*/

                string mensaje = service.ValidarFichaCarga(ClaveSeguridadIngresada, model);
                //Session["ListadoFichaCarga"] = service.ListarFichaCarga().ToList();
                Session["Mensaje"] = mensaje;
                Session["DetalleValidarFichaCarga"] = null;
                return RedirectToAction("ListaValidarFichaCarga");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                model.DetalleFichaCarga = (ICollection<MGDetalleFCarga>)Session["DetalleValidarFichaCarga"];
                return View("ValidarFichaCarga", model);
            }
        }


        public ActionResult ListaFichaMovimiento()
        {
            try
            {                
                if (Session["ListadoAgencia"] == null)
                    Session["ListadoAgencia"] = ObtenerListadoAgencia();
                if (Session["ListadoTipoMovimiento"] == null)
                    Session["ListadoTipoMovimiento"] = ObtenerListadoTipoMovimiento();

                List<MGFichaMovimiento> model = service.ListarFichaMovimiento().ToList();
                return View("ListadoFichaMovimiento", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListaFichaMovimiento");
            }
        }

        [HttpPost]
        public ActionResult ListaFichaMovimiento(string FichaMovimientoID, string FichaCargaID, string TipoMovimiento, string Agencia)
        {
            Session["Mensaje"] = "";
            try
            {
                List<MGFichaMovimiento> model = service.BuscarFichaMovimiento(FichaMovimientoID, FichaCargaID, TipoMovimiento, Agencia).ToList();
                return View("ListadoFichaMovimiento", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ListaFichaMovimiento");
            }
        }


        public ActionResult ModificarFichaMovimiento(int id)
        {
            Session["Mensaje"] = "";
            try
            {
                MGFichaMovimiento model = service.ObtenerFichaMovimiento(id);

                return View("ActualizarFichaMovimiento", model);
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return RedirectToAction("ListaFichaMovimiento");
            }
        }

        [HttpPost]
        public ActionResult ModificarFichaMovimiento(int id, MGFichaMovimiento model)
        {
            try
            {

                string mensaje = service.ModificarFichaMovimiento(model);
                Session["Mensaje"] = mensaje;
                return RedirectToAction("ListaFichaMovimiento");
            }
            catch (Exception ex)
            {
                ViewData["Mensaje"] = ex.Message;
                return View("ActualizarFichaMovimiento", model);
            }
        }
    
    }
}
