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
    public partial class frm_MOD_Informe : System.Web.UI.Page
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
                lblMensajeError.InnerText = "";
                if (!this.IsPostBack)
                {
                    List<String> distritos = Utilitario.getDistritos();

                    foreach (string distrito in distritos)
                    {
                        cmbDistrito.Items.Add(distrito);
                    }

                    //Valores
                    int id = int.Parse(Request.QueryString["pIdInforme"]);

                    //WS-SINIESTRO
                    InformeAccidenteWSClient service = new InformeAccidenteWSClient();

                    //Parametros
                    string modelJson = service.Obtener(id);

                    InformeAccidente model = new JavaScriptSerializer().Deserialize<InformeAccidente>(modelJson);

                    MS_Informe_Accidente_Id.Value = model.MS_Informe_Accidente_Id.ToString();

                    txtNumInforme.Value = model.NumInforme.ToString();
                    txtDireccion.Value = model.Direccion;
                    cmbDistrito.Value = model.Distrito;
                    txtFecInforme.Value = model.FechaInforme.ToString("d");

                    txtTipoSiniestro.Value = model.Siniestro.Tipo;
                    txtNumSiniestro.Value = model.Siniestro.NumSiniestro;
                    txtFecSiniestro.Value = model.Siniestro.FechaRegistro.ToString("d");
                    txtAsegurado.Value = model.Siniestro.Poliza.Asegurado.Nombre + " " + model.Siniestro.Poliza.Asegurado.ApellidoPaterno
                         + " " + model.Siniestro.Poliza.Asegurado.ApellidoMaterno;

                    txtNumProcurador.Value = model.Siniestro.Procurador.NumProcurador;
                    txtProcurador.Value = model.Siniestro.Procurador.Nombre + " " + model.Siniestro.Procurador.ApellidoPaterno
                         + " " + model.Siniestro.Procurador.ApellidoMaterno;

                    UsuarioRegistro.Value = model.UsuarioRegistro;
                    FechaRegistro.Value = model.FechaRegistro.ToString("d");

                    hdnSiniestroId.Value = model.MS_Siniestro_Id.ToString();

                }

            }
            catch (Exception ex)
            {
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
                //InformeAccidenteWSClient service = new InformeAccidenteWSClient();
                InformeFacade informeFacade = new InformeFacade();
                //Validación

                //Parametros
                InformeAccidente model = new InformeAccidente();
                model.MS_Informe_Accidente_Id = int.Parse(MS_Informe_Accidente_Id.Value);
                model.NumInforme = txtNumInforme.Value;
                model.Distrito = cmbDistrito.Value;
                model.Direccion = txtDireccion.Value;
                model.FechaInforme = Convert.ToDateTime(txtFecInforme.Value);

                model.UsuarioRegistro = UsuarioRegistro.Value;
                model.FechaRegistro = Convert.ToDateTime(FechaRegistro.Value);

                model.MS_Siniestro_Id = int.Parse(hdnSiniestroId.Value);

                //string mensaje = service.Modificar(model);
                string mensaje = informeFacade.Modificar(model);

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