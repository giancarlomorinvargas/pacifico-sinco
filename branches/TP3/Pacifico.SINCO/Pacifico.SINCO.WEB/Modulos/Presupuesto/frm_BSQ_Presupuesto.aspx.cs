using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsPresupuesto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Presupuesto
{

    public partial class frm_BSQ_Presupuesto : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                //Controla Mostrar Mensaje
                string strMensaje = (string)HttpContext.Current.Session["PRESUPUESTO_MENSAJE"];
                if (strMensaje == null) strMensaje = "";
                HttpContext.Current.Session.Remove("PRESUPUESTO_MENSAJE");
                hddMensaje.Value = strMensaje;


                //Controla Mostrar MensajeError
                string strMensajeError = (string)HttpContext.Current.Session["PRESUPUESTO_MENSAJE_ERROR"];
                if (strMensaje == null) strMensaje = "";
                HttpContext.Current.Session.Remove("PRESUPUESTO_MENSAJE_ERROR");
                hddMensajeError.Value = strMensajeError;

                //lblMensajeError.InnerText = "";        
                //IsPostBack
                if (!this.IsPostBack)
                {
                    //WS-SINIESTRO
                    PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();

                    //Obtiene Listado de Siniestros
                    string listadoJson = owsPresupuestoClient.ListarPresupuesto();

                    List<PresupuestoEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoEN>>(listadoJson);

                    rptListadoPresupuestos.DataSource = listado;
                    rptListadoPresupuestos.DataBind();
                }

            }
            catch (Exception ex)
            {
                //throw ex;
                hddMensajeError.Value = ex.Message;
            }
        }


        /// <summary>
        /// btnBuscar_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            lblMensajeError.InnerText = "";
            //WS-SINIESTRO
            PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
            try
            {

                //Parametros
                string NumPresupuesto = txtNumPresupuesto.Value;
                string NumInforme = txtNumInforme.Value;
                string NumPoliza = txtNumPoliza.Value;
                string FechaPresupuesto = txtFechaPresupuesto.Value;

                //Obtiene Listado de Siniestros
                string listadoJson = owsPresupuestoClient.BuscarPresupuesto(NumPresupuesto, NumInforme, NumPoliza, FechaPresupuesto);

                List<PresupuestoEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoEN>>(listadoJson);

                rptListadoPresupuestos.DataSource = listado;
                rptListadoPresupuestos.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                hddMensajeError.Value = ex.Message;
                try
                {
                    //Obtiene Listado de Siniestros
                    string listadoJson = owsPresupuestoClient.ListarPresupuesto();

                    List<PresupuestoEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoEN>>(listadoJson);

                    rptListadoPresupuestos.DataSource = listado;
                    rptListadoPresupuestos.DataBind();
                }
                catch (Exception) { }

            }
        }
        

    }
}