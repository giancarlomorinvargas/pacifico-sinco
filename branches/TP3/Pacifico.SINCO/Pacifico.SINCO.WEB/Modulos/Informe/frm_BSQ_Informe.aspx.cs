using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Informe
{

    public partial class frm_BSQ_Informe : System.Web.UI.Page
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
                    InformeAccidenteWSClient owsInformeClient = new InformeAccidenteWSClient();

                    //Obtiene Listado de Siniestros
                    string listadoJson = owsInformeClient.Listar();

                    List<InformeAccidenteEN> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidenteEN>>(listadoJson);

                    rptListadoInformes.DataSource = listado;
                    rptListadoInformes.DataBind();
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
            InformeAccidenteWSClient owsInformeClient = new InformeAccidenteWSClient();
            try
            {

                //Parametros
                string NumPoliza = txtNumPoliza.Value;
                string Tipo = cmbTipoSiniestro.Value;
                string FechaSiniestro= txtFechaSiniestro.Value;

                //Obtiene Listado de Siniestros
                string listadoJson = owsInformeClient.Buscar(NumPoliza, Tipo, FechaSiniestro);

                List<InformeAccidenteEN> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidenteEN>>(listadoJson);

                rptListadoInformes.DataSource = listado;
                rptListadoInformes.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                hddMensajeError.Value = ex.Message;
                try
                {
                    //Obtiene Listado de Siniestros
                    string listadoJson = owsInformeClient.Listar();

                    List<InformeAccidenteEN> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidenteEN>>(listadoJson);

                    rptListadoInformes.DataSource = listado;
                    rptListadoInformes.DataBind();
                }
                catch (Exception) { 
                }                
            }
        }


    }
}