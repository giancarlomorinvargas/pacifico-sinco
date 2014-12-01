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
    public partial class frm_AGR_Presupuesto : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            txtNumPresupuesto.Value = Utilitario.getNumDocument(Constantes.pNum_Presupuesto);

            List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

            foreach (string tipo in tipoSiniestro)
            {
                cmbTipoSiniestro.Items.Add(tipo);
            }

            txtFechaPresupuesto.Value = DateTime.Now.ToString("d");
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
                model.NumPresupuesto = txtNumPresupuesto.Value;
                model.FechaPresupuesto = Convert.ToDateTime(txtFechaPresupuesto.Value);
                model.SubTotal = float.Parse(txtSubTotal.Value);
                model.IGV = float.Parse(txtIGV.Value);
                model.Total = float.Parse(txtTotal.Value);
                model.MS_Informe_Accidente_Id = int.Parse(hdnInformeAccidenteId.Value);

                string DetalleFichaCargaSerializado = txtDetalle.Value;

                MSPresupuesto FichaCargaDes = new JavaScriptSerializer().Deserialize<MSPresupuesto>(DetalleFichaCargaSerializado);

                model.DetallePresupuesto = FichaCargaDes.DetallePresupuesto;

                string mensaje = service.AgregarPresupuesto(model);

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