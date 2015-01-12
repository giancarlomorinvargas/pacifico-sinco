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
    public partial class frm_CNS_Siniestro : System.Web.UI.Page
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
            try
            {
                lblMensajeError.InnerText = "";
                //IsPostBack
                if (!this.IsPostBack)
                {
                    List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

                    foreach (string tipo in tipoSiniestro)
                    {
                        cmbTipoSiniestro.Items.Add(tipo);
                    }

                    //Valores
                    string vIdSiniestro = Request.QueryString["pIdSiniestro"];

                    //WS-SINIESTRO
                    IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();

                    //Parametros
                    enSiniestro oEnSiniestro = new enSiniestro();
                    oEnSiniestro.MS_Siniestro_Id = int.Parse(vIdSiniestro);

                    //Obtiene Listado de Siniestros
                    enSiniestro beanEnSiniestro = owsSiniestroClient.ObtenerSiniestro(oEnSiniestro);

                    //hddCodSiniestro.Value = beanEnSiniestro.MS_Siniestro_Id.ToString();
                    //hddCodPoliza.Value = beanEnSiniestro.MP_Poliza_Id.ToString();
                    //hddCodProcurador.Value = beanEnSiniestro.MS_Procurador_Id.ToString();

                    txtNumSiniestro.Value = beanEnSiniestro.NumSiniestro;
                    cmbTipoSiniestro.Value = beanEnSiniestro.Tipo;
                    txtDescripcion.Value = beanEnSiniestro.Descripcion;
                    txtFechaSiniestro.Value = beanEnSiniestro.vFechaSiniestro;
                    txtLugar.Value = beanEnSiniestro.Lugar;

                    txtNumPoliza.Value = beanEnSiniestro.NumPoliza;
                    txtAsegurado.Value = beanEnSiniestro.NombreAsegurado;
                    txtInicio.Value = beanEnSiniestro.vFechaInicio;
                    txtFin.Value = beanEnSiniestro.vFechaFin;

                    txtCodProcurador.Value = beanEnSiniestro.NumProcurador;
                    txtNombreProcurador.Value = beanEnSiniestro.NombreProcurador;

                }
            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }

    }
}