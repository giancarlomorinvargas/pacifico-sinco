using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.Facade.Informe;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Siniestro
{
    public partial class frm_AGR_Siniestro : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion


        /// <summary>
        /// Page_Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMensajeError.InnerText = "";
                //IsPostBack
            if (!this.IsPostBack)
            { 
                txtNumSiniestro.Value = Utilitario.getNumDocument(Constantes.sNum_Siniestro);

                List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

                foreach (string tipo in tipoSiniestro)
                {
                    cmbTipoSiniestro.Items.Add(tipo);
                }

                txtFechaSiniestro.Value = DateTime.Now.ToString("d");
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
                //SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();
                SiniestroFacade siniestroFacade = new SiniestroFacade();

                //Validación

                //Parametros
                SiniestroEN oEnSiniestro = new SiniestroEN();
                oEnSiniestro.NumSiniestro = txtNumSiniestro.Value;
                oEnSiniestro.Tipo = cmbTipoSiniestro.Value.ToString();
                oEnSiniestro.FechaSiniestro = Convert.ToDateTime(txtFechaSiniestro.Value);
                oEnSiniestro.Lugar = txtLugar.Value;
                oEnSiniestro.Descripcion = txaDescripcion.Value;
                oEnSiniestro.Estado = Constantes.sEstado_Pendiente;
                oEnSiniestro.UsuarioRegistro = Constantes.sUsuario_Login;
                oEnSiniestro.UsuarioModifico = Constantes.sUsuario_Login;
                oEnSiniestro.MP_Poliza_Id = int.Parse(hddCodPoliza.Value);
                oEnSiniestro.MS_Procurador_Id = int.Parse(hddCodProcurador.Value);

                //Obtiene Listado de Siniestros
                //bool exito = owsSiniestroClient.IngresarSiniestro(oEnSiniestro);
                string mensaje = siniestroFacade.Registrar(oEnSiniestro);


                HttpContext.Current.Session["SINIESTRO_MENSAJE"] = mensaje;
                Response.Redirect("~/Modulos/Siniestro/frm_BSQ_Siniestro.aspx", false);
                

            }
            catch (Exception ex)
            {
                //throw ex;
                HttpContext.Current.Session["SINIESTRO_MENSAJE_ERROR"] = ex.Message;
            }
        }
    }
}