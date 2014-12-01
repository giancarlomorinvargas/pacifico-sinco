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
    public partial class frm_MOD_Presupuesto : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {


            List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

            foreach (string tipo in tipoSiniestro)
            {
                cmbTipoSiniestro.Items.Add(tipo);
            }

            try
            {
                if (!this.IsPostBack)
                {

                    //Valores
                    int id = int.Parse(Request.QueryString["pIdPresupuesto"]);

                    //WS-SINIESTRO
                    IwsPresupuestoClient service = new IwsPresupuestoClient();

                    //Parametros
                    string modelJson = service.ObtenerPresupuesto(id);

                    MSPresupuesto model = new JavaScriptSerializer().Deserialize<MSPresupuesto>(modelJson);
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
                IwsPresupuestoClient service = new IwsPresupuestoClient();

                //Validación

                //Parametros
                MSPresupuesto model = new MSPresupuesto();
                model.MS_Presupuesto_Id = int.Parse(MS_Presupuesto_Id.Value);
                model.NumPresupuesto = txtNumPresupuesto.Value;
                model.FechaPresupuesto = Convert.ToDateTime(txtFechaPresupuesto.Value);
                model.SubTotal = float.Parse(txtSubTotal.Value);
                model.IGV = float.Parse(txtIGV.Value);
                model.Total = float.Parse(txtTotal.Value);
                model.UsuarioRegistro = UsuarioRegistro.Value;
                model.FechaRegistro = Convert.ToDateTime(FechaRegistro.Value);
                model.MS_Informe_Accidente_Id = int.Parse(hdnInformeAccidenteId.Value);

                string DetalleFichaCargaSerializado = txtDetalle.Value;

                MSPresupuesto modelJson = new JavaScriptSerializer().Deserialize<MSPresupuesto>(DetalleFichaCargaSerializado);

                model.DetallePresupuesto = (ICollection<MSDetallePresupuesto>)Session["detallePresupuestoAnterior"];
                Session["detallePresupuestoAnterior"] = null;

                string mensaje = service.ModificarPresupuesto(model, modelJson.DetallePresupuesto.ToArray());

                lblMensaje.InnerText = mensaje;
                Response.Redirect("~/Modulos/Presupuesto/frm_BSQ_Presupuesto.aspx");

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}