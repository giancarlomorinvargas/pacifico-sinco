using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsPresupuesto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Presupuesto
{
    public partial class frm_CNS_Presupuesto : System.Web.UI.Page
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
                    int id = int.Parse(Request.QueryString["pIdPresupuesto"]);

                    //WS-SINIESTRO
                    PresupuestoWSClient service = new PresupuestoWSClient();

                    //Parametros
                    string modelJson = service.ObtenerPresupuesto(id);

                    PresupuestoEN model = new JavaScriptSerializer().Deserialize<PresupuestoEN>(modelJson);
                    MS_Presupuesto_Id.Value = model.MS_Presupuesto_Id.ToString();
                    UsuarioRegistro.Value = model.UsuarioRegistro;
                    FechaRegistro.Value = model.FechaModifico.ToString("d");
                    txtNumPresupuesto.Value = model.NumPresupuesto;
                    txtFechaPresupuesto.Value = model.FechaPresupuesto.ToString("d");
                    txtSubTotal.Value = model.SubTotal.ToString();
                    txtIGV.Value = model.IGV.ToString();
                    txtTotal.Value = model.Total.ToString();

                    hdnInformeAccidenteId.Value = model.MS_Informe_Accidente_Id.ToString();

                    txtNumInforme.Value = model.InformeAccidente.NumInforme;
                    cmbTipoSiniestro.Value = model.InformeAccidente.Siniestro.Tipo;
                    txtNumSiniestro.Value = model.InformeAccidente.Siniestro.NumSiniestro;
                    txtFecSiniestro.Value = model.InformeAccidente.Siniestro.FechaRegistro.ToString("d");
                    txtLugar.Value = model.InformeAccidente.Siniestro.Lugar;
                    txtNumPoliza.Value = model.InformeAccidente.Siniestro.Poliza.NumPoliza;
                    txtAsegurado.Value = model.InformeAccidente.Siniestro.Poliza.Asegurado.Nombre + " " + model.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoPaterno
                         + " " + model.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoMaterno;

                    hdnMarcaId.Value = model.InformeAccidente.Siniestro.Poliza.Vehiculo.MP_Marca_Id.ToString();
                    hdnModeloId.Value = model.InformeAccidente.Siniestro.Poliza.Vehiculo.MP_Modelo_Id.ToString();


                    string DetalleFichaCargaSerializado = new JavaScriptSerializer().Serialize(model.DetallePresupuesto);

                    txtDetalle.Value = DetalleFichaCargaSerializado;
                    Session["detallePresupuestoAnterior"] = model.DetallePresupuesto;
                }

            }
            catch (Exception ex)
            {
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}