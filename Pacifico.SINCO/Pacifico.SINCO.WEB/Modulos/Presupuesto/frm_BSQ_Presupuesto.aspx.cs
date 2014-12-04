using Pacifico.SINCO.EN;
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
    public partial class frm_BSQ_Presupuesto : System.Web.UI.Page
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
                //IsPostBack
                if (!this.IsPostBack)
                {
                    //WS-SINIESTRO
                    IwsPresupuestoClient owsPresupuestoClient = new IwsPresupuestoClient();

                    //Obtiene Listado de Siniestros
                    string listadoJson = owsPresupuestoClient.ListarPresupuesto();

                    List<MSPresupuesto> listado = new JavaScriptSerializer().Deserialize<List<MSPresupuesto>>(listadoJson);

                    rptListadoPresupuestos.DataSource = listado;
                    rptListadoPresupuestos.DataBind();
                }

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }


        /// <summary>
        /// btnBuscar_Click
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                lblMensajeError.InnerText = "";        
                //WS-SINIESTRO
                IwsPresupuestoClient owsPresupuestoClient = new IwsPresupuestoClient();

                //Parametros
                string NumPresupuesto = txtNumPresupuesto.Value;
                string NumInforme = txtNumInforme.Value;
                string NumPoliza = txtNumPoliza.Value;
                string FechaPresupuesto = txtFechaPresupuesto.Value;

                //Obtiene Listado de Siniestros
                string listadoJson = owsPresupuestoClient.BuscarPresupuesto(NumPresupuesto, NumInforme, NumPoliza, FechaPresupuesto);

                List<MSPresupuesto> listado = new JavaScriptSerializer().Deserialize<List<MSPresupuesto>>(listadoJson);

                rptListadoPresupuestos.DataSource = listado;
                rptListadoPresupuestos.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }
        

    }
}