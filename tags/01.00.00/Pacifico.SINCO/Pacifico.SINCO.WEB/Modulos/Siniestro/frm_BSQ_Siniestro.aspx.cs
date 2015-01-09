using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Siniestro
{

    public partial class frm_BSQ_Siniestro : System.Web.UI.Page
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
                string strMensaje = (string)HttpContext.Current.Session["SINIESTRO_MENSAJE"];
                if (strMensaje == null) strMensaje = "";
                HttpContext.Current.Session.Remove("SINIESTRO_MENSAJE");
                hddMensaje.Value = strMensaje;


                //Controla Mostrar MensajeError
                string strMensajeError = (string)HttpContext.Current.Session["SINIESTRO_MENSAJE_ERROR"];
                if (strMensaje == null) strMensaje = "";
                HttpContext.Current.Session.Remove("SINIESTRO_MENSAJE_ERROR");
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
                    IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();

                    //Parametros
                    enSiniestro oEnSiniestro = new enSiniestro();

                    //Obtiene Listado de Siniestros
                    List<enSiniestro> loEnSiniestro = owsSiniestroClient.ListarSiniestro(oEnSiniestro).Cast<enSiniestro>().ToList();

                    rptListadoSiniestros.DataSource = loEnSiniestro;
                    rptListadoSiniestros.DataBind();

                }
            }
            catch(Exception ex) {
                //throw ex;
                //lblMensajeError.InnerText = ex.Message;
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
                IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();

                //Parametros
                enSiniestro oEnSiniestro = new enSiniestro();
                oEnSiniestro.NumPoliza = txtNumPoliza.Value;
                oEnSiniestro.Tipo = cmbTipoSiniestro.Value.ToString();
                oEnSiniestro.vFechaRegistro = txtFechaSiniestro.Value;

                //Obtiene Listado de Siniestros
                List<enSiniestro> loEnSiniestro = owsSiniestroClient.ListarSiniestro(oEnSiniestro).Cast<enSiniestro>().ToList();

                rptListadoSiniestros.DataSource = loEnSiniestro;
                rptListadoSiniestros.DataBind();
         
            }
            catch (Exception ex)
            {
                //throw ex;
                //lblMensajeError.InnerText = ex.Message;
                hddMensajeError.Value = ex.Message;
            }
        }
        

    }
}