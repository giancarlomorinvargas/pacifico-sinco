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
            txtNumSiniestro.Value = "SI-000000";
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
                //WS-SINIESTRO
                IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();

                //Validación

                //Parametros
                enSiniestro oEnSiniestro = new enSiniestro();
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
                bool exito = owsSiniestroClient.IngresarSiniestro(oEnSiniestro);

                if (exito)
                {
                    Response.Redirect("~/Modulos/Siniestro/frm_BSQ_Siniestro.aspx");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}