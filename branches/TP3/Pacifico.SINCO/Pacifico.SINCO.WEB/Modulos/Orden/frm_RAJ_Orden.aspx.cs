using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.Facade.Orden;
using Pacifico.SINCO.WEB.Facade.Informe;
using Pacifico.SINCO.WEB.Facade.Liquidacion;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsLiquidacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Orden
{
    public partial class frm_RAJ_Orden : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensajeError.InnerText = "";
            //IsPostBack
            if (!this.IsPostBack)
            {

                //Valores
                int id = int.Parse(Request.QueryString["pIdLiquidacion"]);

                //WS-SINIESTRO
                LiquidacionWSClient service = new LiquidacionWSClient();

                string modelJson = service.Obtener(id);

                LiquidacionEN model = new JavaScriptSerializer().Deserialize<LiquidacionEN>(modelJson);
                hdnLiquidacionId.Value = model.LiquidacionId.ToString();
                txtNumLiquidacion.Value = model.NumLiquidacion.ToString();
                txtFechaLiquidacion.Value = model.FechaLiquidacion.ToString("d");
                txtDescripcion.Value = model.Descripcion;
                txtMontoLiquidacion.Value = model.MontoLiquidacion.ToString();

                hdnSiniestroId.Value = model.SiniestroId.ToString();

                txtTipoSiniestro.Value = model.Siniestro.Tipo;
                txtNumSiniestro.Value = model.Siniestro.NumSiniestro;
                txtFecSiniestro.Value = model.Siniestro.FechaRegistro.ToString("d");
                txtLugar.Value = model.Siniestro.Lugar;

                txtNumPoliza.Value = model.Siniestro.Poliza.NumPoliza;
                txtAsegurado.Value = model.Siniestro.Poliza.Asegurado.Nombre + " " + model.Siniestro.Poliza.Asegurado.ApellidoPaterno
                     + " " + model.Siniestro.Poliza.Asegurado.ApellidoMaterno;
                txtInicio.Value = model.Siniestro.Poliza.FechaInicio.ToString("d");
                txtFin.Value = model.Siniestro.Poliza.FechaFin.ToString("d");
                txtMontoCobertura.Value = model.Siniestro.Poliza.MontoCobertura.ToString();


                UsuarioRegistro.Value = model.UsuarioRegistro;
                FechaRegistro.Value = model.FechaRegistro.ToString("d");
            }
        }


        /// <summary>
        /// btnGrabar_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGrabar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensajeError.InnerText = "";
                //WS-SINIESTRO
                //InformeAccidenteWSClient service = new InformeAccidenteWSClient();
                OrdenFacade facade = new OrdenFacade();
                //Validación

                //Parametros
                int idLiquidacion = int.Parse(hdnLiquidacionId.Value);
                float descuento = float.Parse(txtMontoDescuento.Value);
                string mensaje = facade.ActualizarGenerado(idLiquidacion, descuento);
                
                HttpContext.Current.Session["INFORME_MENSAJE"] = mensaje;
                Response.Redirect("~/Modulos/Orden/frm_BSQ_Orden.aspx", false);

            }
            catch (Exception ex)
            {
                //throw ex;
                HttpContext.Current.Session["INFORME_MENSAJE_ERROR"] = ex.Message;
            }
        }
    }
}