using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.Facade.Informe;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Siniestro
{
    public partial class frm_MOD_Siniestro : System.Web.UI.Page
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
                    SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();

                    //Parametros
                    int siniestroId = int.Parse(vIdSiniestro);

                    //Obtiene Listado de Siniestros
                    string siniestroSerializado = owsSiniestroClient.Obtener(siniestroId);
                    SiniestroEN beanEnSiniestro = new JavaScriptSerializer().Deserialize<SiniestroEN>(siniestroSerializado);

                    UsuarioRegistro.Value = beanEnSiniestro.UsuarioRegistro;
                    FechaRegistro.Value = beanEnSiniestro.FechaModifico.ToString("d");

                    hddCodSiniestro.Value = beanEnSiniestro.MS_Siniestro_Id.ToString();
                    hddCodPoliza.Value = beanEnSiniestro.MP_Poliza_Id.ToString();
                    hddCodProcurador.Value = beanEnSiniestro.MS_Procurador_Id.ToString();

                    txtNumSiniestro.Value = beanEnSiniestro.NumSiniestro;
                    cmbTipoSiniestro.Value = beanEnSiniestro.Tipo;
                    txaDescripcion.Value = beanEnSiniestro.Descripcion;
                    txtFechaSiniestro.Value = beanEnSiniestro.FechaSiniestro.ToString("d");
                    txtLugar.Value = beanEnSiniestro.Lugar;

                    txtNumPoliza.Value = beanEnSiniestro.Poliza.NumPoliza;
                    txtAsegurado.Value = beanEnSiniestro.Poliza.Asegurado.Nombre +
                        " " + beanEnSiniestro.Poliza.Asegurado.ApellidoPaterno + " " + beanEnSiniestro.Poliza.Asegurado.ApellidoMaterno;
                    txtInicio.Value = beanEnSiniestro.Poliza.FechaInicio.ToString("d");
                    txtFin.Value = beanEnSiniestro.Poliza.FechaFin.ToString("d");

                    txtCodProcurador.Value = beanEnSiniestro.Procurador.NumProcurador;
                    txtNombreProcurador.Value = beanEnSiniestro.Procurador.Nombre +
                        " " + beanEnSiniestro.Procurador.ApellidoPaterno + " " + beanEnSiniestro.Procurador.ApellidoMaterno;

                }

            }
            catch (Exception ex) {
                //throw ex; 
                lblMensajeError.InnerText = ex.Message;
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
                oEnSiniestro.MS_Siniestro_Id = int.Parse(hddCodSiniestro.Value);
                oEnSiniestro.NumSiniestro = txtNumSiniestro.Value;
                oEnSiniestro.Tipo = cmbTipoSiniestro.Value.ToString();
                oEnSiniestro.FechaSiniestro = Convert.ToDateTime(txtFechaSiniestro.Value);
                oEnSiniestro.Lugar = txtLugar.Value;
                oEnSiniestro.Descripcion = txaDescripcion.Value;
                oEnSiniestro.Estado = Constantes.sEstado_Pendiente;
                oEnSiniestro.UsuarioRegistro = UsuarioRegistro.Value;
                oEnSiniestro.FechaRegistro = Convert.ToDateTime(FechaRegistro.Value);
                oEnSiniestro.UsuarioModifico = Constantes.sUsuario_Login;
                oEnSiniestro.MP_Poliza_Id = int.Parse(hddCodPoliza.Value);
                oEnSiniestro.MS_Procurador_Id = int.Parse(hddCodProcurador.Value);

                //Obtiene Listado de Siniestros
                //bool exito = owsSiniestroClient.ActualizaSiniestro(oEnSiniestro);
                string mensaje = siniestroFacade.Modificar(oEnSiniestro);

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