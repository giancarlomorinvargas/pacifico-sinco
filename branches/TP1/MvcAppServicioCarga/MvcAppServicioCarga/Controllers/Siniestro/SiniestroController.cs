using MvcAppServicioCarga.Controllers.Siniestro.Service;
using MvcAppServicioCarga.Models.Siniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace MvcModuloServicioCarga.Controllers.Siniestro
{
    public class SiniestroController : Controller
    {

        private static string NUM_PRESUPUESTO = "PR";

        /*Inyección de dependencias*/
        IPresupuestoAppService service = new PresupuestoAppService();
        IListaPrecioAppService serviceListaPrecio = new ListaPrecioAppService();
        IInformeAccidenteAppService serviceInformeAccidente = new InformeAccidenteAppService();

        /*
        IProgramacionRutaAppService serviceProgramacionRuta = new ProgramacionRutaAppService(new ProgramacionRutaDAO());
        IClienteAppService serviceCliente = new ClienteServiceAppService(new ClienteDAO());
        IProductoAppService serviceProducto = new ProductoServiceAppService(new ProductoDAO());
        IAgenciaAppService serviceAgencia = new AgenciaAppService(new AgenciaDAO());
        ITipoFichaMovimientoAppService serviceTipoMovimiento = new TipoFichaMovimientoAppService(new TipoMovimientoDAO());*/
        
        /*

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

        */

        private String getNumDocument(String codDoc) {
            return codDoc + DateTime.Now.ToString("yyyyMMddHHmmss");
        }


        public ActionResult ListaPresupuesto()
        {

            try
            {
                List<MSPresupuesto> model = service.ListarPresupuesto().ToList();
                return View("ListadoPresupuesto", model);
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View("ListadoPresupuesto");
            }
        }

        [HttpPost]
        public ActionResult ListaPresupuesto(string NumPresupuesto, string NumInforme, string NumPoliza)
        {
            try
            {
                List<MSPresupuesto> model = service.BuscarPresupuesto(NumPresupuesto, NumInforme, NumPoliza).ToList();
                return View("ListadoPresupuesto", model);
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View("ListadoPresupuesto");
            }
        }



        public ActionResult Create()
        {

            return View("CrearPresupuesto", new MSPresupuesto { NumPresupuesto = getNumDocument(NUM_PRESUPUESTO), FechaPresupuesto = DateTime.Now });
        }


        [HttpPost]
        public ActionResult Create(MSPresupuesto model)
        {
            try
            {

                string DetalleFichaCargaSerializado = Request["detallePresupuesto"];

                MSPresupuesto FichaCargaDes = new JavaScriptSerializer().Deserialize<MSPresupuesto>(DetalleFichaCargaSerializado);

                model.DetallePresupuesto = FichaCargaDes.DetallePresupuesto;

                string mensaje = service.AgregarPresupuesto(model);

                TempData["Mensaje"] = mensaje;

                return RedirectToAction("ListaPresupuesto");
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View("CrearPresupuesto", model);
            }
        }


        public ActionResult Edit(int id)
        {  
            try
            {
                MSPresupuesto model = service.ObtenerPresupuesto(id);

                string DetalleFichaCargaSerializado = new JavaScriptSerializer().Serialize(model.DetallePresupuesto);

                Session["detallePresupuesto"] = DetalleFichaCargaSerializado;
                Session["detallePresupuestoAnterior"] = model.DetallePresupuesto;

                return View("ActualizarPresupuesto", model);

            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return RedirectToAction("ListaPresupuesto");
            }
        }

        [HttpPost]
        public ActionResult Edit(int id, MSPresupuesto model)
        {
            try
            {

                string DetalleFichaCargaSerializado = Request["detallePresupuesto"];
                Session["detallePresupuesto"] = null;

                MSPresupuesto FichaCargaDes = new JavaScriptSerializer().Deserialize<MSPresupuesto>(DetalleFichaCargaSerializado);

                model.DetallePresupuesto = (ICollection<MSDetallePresupuesto>)Session["detallePresupuestoAnterior"];
                Session["detallePresupuestoAnterior"] = null;

                string mensaje = service.ModificarPresupuesto(model, FichaCargaDes.DetallePresupuesto.ToList());

                TempData["Mensaje"] = mensaje;

                return RedirectToAction("ListaPresupuesto");
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View("ActualizarPresupuesto", model);
            }
        }


        public ActionResult Details(int id)
        {

            try
            {
                MSPresupuesto model = service.ObtenerPresupuesto(id);

                return View(model);
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View();
            }
        }


        
        //TODO: Mover este metodo al controlador de Programacion
        public ActionResult ConsultarInforme()
        {
            try
            {
                ViewBag.ListadoInformeAccidente = serviceInformeAccidente.Listar().ToList();
                return View("ConsultarInformeAccidente");
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View();
            }
        }


        public ActionResult ConsultarListaPrecio()
        {
            try
            {
                int marcaId = Int32.Parse(Request["marcaId"]);
                int modeloId = Int32.Parse(Request["modeloId"]);

                ViewBag.ListadoPrecio = serviceListaPrecio.Buscar(marcaId, modeloId).ToList();
                return View("ConsultarListaPrecio");
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View();
            }
        }
        /*
        public ActionResult ConsultarListaPrecio(int marcaId, int modeloId)
        {
            try
            {
                ViewBag.ListadoPrecio = serviceListaPrecio.Buscar(marcaId, modeloId).ToList();
                return View("ConsultarListaPrecio");
            }
            catch (Exception ex)
            {
                TempData["MensajeError"] = ex.Message;
                return View();
            }
        }*/

        /*
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
        }*/
          
    
    }
}
