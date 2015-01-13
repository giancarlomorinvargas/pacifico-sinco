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
    public partial class frm_AGR_Informe : System.Web.UI.Page
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
                txtNumInforme.Value = Utilitario.getNumDocument(Constantes.iNum_Informe);
                List<String> distritos = Utilitario.getDistritos();

                foreach (string distrito in distritos)
                {
                    cmbDistrito.Items.Add(distrito);
                }

                txtFecInforme.Value = DateTime.Now.ToString("d");
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
                IwsInformeAccidenteClient service = new IwsInformeAccidenteClient();

                //Validación

                //Parametros
                MSInformeAccidente model = new MSInformeAccidente();
                model.NumInforme = txtNumInforme.Value;
                model.Distrito = cmbDistrito.Value;
                model.Direccion = txtDireccion.Value;
                model.FechaInforme = Convert.ToDateTime(txtFecInforme.Value);

                model.MS_Siniestro_Id = int.Parse(hdnSiniestroId.Value);

                string mensaje = service.Agregar(model);

                HttpContext.Current.Session["INFORME_MENSAJE"] = mensaje;
                Response.Redirect("~/Modulos/Informe/frm_BSQ_Informe.aspx", false);

            }
            catch (Exception ex)
            {
                //throw ex;
                HttpContext.Current.Session["INFORME_MENSAJE_ERROR"] = ex.Message;
            }
        }
    }
}