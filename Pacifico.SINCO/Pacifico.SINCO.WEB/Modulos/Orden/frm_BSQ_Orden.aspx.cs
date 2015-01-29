using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsLiquidacion;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Orden
{

    public partial class frm_BSQ_Liquidacion : System.Web.UI.Page
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
                string strMensaje = (string)HttpContext.Current.Session["INFORME_MENSAJE"];
                if (strMensaje == null) strMensaje = "";
                HttpContext.Current.Session.Remove("INFORME_MENSAJE");
                hddMensaje.Value = strMensaje;


                //Controla Mostrar MensajeError
                string strMensajeError = (string)HttpContext.Current.Session["INFORME_MENSAJE_ERROR"];
                if (strMensajeError == null) strMensajeError = "";
                HttpContext.Current.Session.Remove("INFORME_MENSAJE_ERROR");
                hddMensajeError.Value = strMensajeError;

                //lblMensajeError.InnerText = "";        
                //IsPostBack
                if (!this.IsPostBack)
                {

                    List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

                    cmbTipoSiniestro.Items.Clear();
                    cmbTipoSiniestro.Items.Add(new ListItem { Value = "", Text = "[SELECCIONE]" });
                    foreach (string tipo in tipoSiniestro)
                    {
                        cmbTipoSiniestro.Items.Add(tipo);
                    }

                    //WS-SINIESTRO
                    LiquidacionWSClient owsInformeClient = new LiquidacionWSClient();

                    //Obtiene Listado de Siniestros
                    string listadoJson = owsInformeClient.Listar();

                    List<LiquidacionEN> listado = new JavaScriptSerializer().Deserialize<List<LiquidacionEN>>(listadoJson);

                    rptListadoLiquidaciones.DataSource = listado;
                    rptListadoLiquidaciones.DataBind();
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
            try
            {
                lblMensajeError.InnerText = "";
                //WS-SINIESTRO
                LiquidacionWSClient owsLiquidacionClient = new LiquidacionWSClient();

                //Parametros
                string tipoSiniestro = cmbTipoSiniestro.Value;
                string fechaLiquidacion= txtFechaLiquidacion.Value;
                string numLiquidacion= txtNumLiquidacion.Value;

                //Obtiene Listado de Siniestros
                string listadoJson = owsLiquidacionClient.Buscar(numLiquidacion,
                    tipoSiniestro, fechaLiquidacion);

                List<LiquidacionEN> listado = new JavaScriptSerializer().Deserialize<List<LiquidacionEN>>(listadoJson);

                rptListadoLiquidaciones.DataSource = listado;
                rptListadoLiquidaciones.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                hddMensajeError.Value = ex.Message;
            }
        }


    }
}