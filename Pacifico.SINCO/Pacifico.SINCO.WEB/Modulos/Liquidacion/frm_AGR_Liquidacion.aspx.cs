using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.Facade.Liquidacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Liquidacion
{
    public partial class frm_AGR_Liquidacion : System.Web.UI.Page
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
                txtNumLiquidacion.Value = Utilitario.getNumDocument(Constantes.lNum_Liquidacion);

                txtFechaLiquidacion.Value = DateTime.Now.ToString("d");
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
                LiquidacionFacade facade = new LiquidacionFacade();
                //Validación

                //Parametros
                LiquidacionEN model = new LiquidacionEN();
                model.NumLiquidacion = txtNumLiquidacion.Value;
                model.FechaLiquidacion = Convert.ToDateTime(txtFechaLiquidacion.Value);
                model.Descripcion = txtDescripcion.Value;
                model.MontoLiquidacion = float.Parse(txtMontoLiquidacion.Value);

                model.SiniestroId = int.Parse(hdnSiniestroId.Value);

                //string mensaje = service.Agregar(model);
                string mensaje = facade.Registrar(model);

                HttpContext.Current.Session["INFORME_MENSAJE"] = mensaje;
                Response.Redirect("~/Modulos/Liquidacion/frm_BSQ_Liquidacion.aspx", false);

            }
            catch (Exception ex)
            {
                //throw ex;
                HttpContext.Current.Session["INFORME_MENSAJE_ERROR"] = ex.Message;
            }
        }
    }
}