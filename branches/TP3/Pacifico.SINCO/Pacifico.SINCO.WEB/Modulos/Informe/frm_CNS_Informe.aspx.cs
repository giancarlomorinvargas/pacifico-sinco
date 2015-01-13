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
    public partial class frm_CNS_Informe : System.Web.UI.Page
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


                    //Valores
                    int id = int.Parse(Request.QueryString["pIdInforme"]);

                    //WS-SINIESTRO
                    IwsInformeAccidenteClient service = new IwsInformeAccidenteClient();

                    //Parametros
                    string modelJson = service.Obtener(id);

                    MSInformeAccidente model = new JavaScriptSerializer().Deserialize<MSInformeAccidente>(modelJson);
                    txtNumInforme.Value = model.NumInforme.ToString();
                    txtDireccion.Value = model.Direccion;
                    txtDistrito.Value = model.Distrito;
                    txtFecInforme.Value = model.FechaInforme.ToString("d");

                    txtTipoSiniestro.Value = model.Siniestro.Tipo;
                    txtNumSiniestro.Value = model.Siniestro.NumSiniestro;
                    txtFecSiniestro.Value = model.Siniestro.FechaRegistro.ToString("d");
                    txtAsegurado.Value = model.Siniestro.Poliza.Asegurado.Nombre + " " + model.Siniestro.Poliza.Asegurado.ApellidoPaterno
                         + " " + model.Siniestro.Poliza.Asegurado.ApellidoMaterno;

                    txtNumProcurador.Value = model.Siniestro.Procurador.NumProcurador;
                    txtProcurador.Value = model.Siniestro.Procurador.Nombre + " " + model.Siniestro.Procurador.ApellidoPaterno
                         + " " + model.Siniestro.Procurador.ApellidoMaterno;

                }

            }
            catch (Exception ex)
            {
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}