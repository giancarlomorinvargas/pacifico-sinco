using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsLiquidacion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Liquidacion
{
    public partial class frm_CNS_Liquidacion : System.Web.UI.Page
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
                    int id = int.Parse(Request.QueryString["pIdLiquidacion"]);

                    //WS-SINIESTRO
                    LiquidacionWSClient service = new LiquidacionWSClient();

                    //Parametros
                    string modelJson = service.Obtener(id);

                    LiquidacionEN model = new JavaScriptSerializer().Deserialize<LiquidacionEN>(modelJson);
                    txtNumLiquidacion.Value = model.NumLiquidacion.ToString();
                    txtFechaLiquidacion.Value = model.FechaLiquidacion.ToString("d");
                    txtDescripcion.Value = model.Descripcion;
                    txtMontoLiquidacion.Value = model.MontoLiquidacion.ToString();

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

                }

            }
            catch (Exception ex)
            {
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}