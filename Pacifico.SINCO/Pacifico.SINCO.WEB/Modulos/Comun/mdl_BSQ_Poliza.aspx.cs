using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsUtil;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Comun
{
    public partial class mdl_BSQ_Poliza : System.Web.UI.Page
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
                    //DateTime Now = DateTime.Now;
                    //WS-SINIESTRO
                    UtilWSClient owsUtilClient = new UtilWSClient();

                    //Parametros
                    //enPoliza oEnPoliza = new enPoliza();

                    //Obtiene Listado de Siniestros
                    string listadoSerializado = owsUtilClient.ListarPoliza();
                    List<PolizaEN> lsitado = new JavaScriptSerializer().Deserialize<List<PolizaEN>>(listadoSerializado);
                    /*
                    foreach (enPoliza poliza in olEnPoliza.Where(
                        b => (b.FechaInicio<=Now  && Now <= b.FechaFin)))
                    {
                        olEnPolizaResult.Add(poliza);
                    }*/

                    rptListadoPolizas.DataSource = lsitado;
                    rptListadoPolizas.DataBind();
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

                //DateTime Now = DateTime.Now;
                //List<enPoliza> olEnPolizaResult = new List<enPoliza>();

                //WS
                UtilWSClient owsUtilClient = new UtilWSClient();

                //Parametros
                //enPoliza oEnPoliza = new enPoliza();
                string dniAsegurado = txtDniAsegurado.Value;
                string numPoliza = txtNumeroPoliza.Value;
                string placa = txtNumeroPlaca.Value;

                //Obtiene Listado
                //List<enPoliza> olEnPoliza = owsUtilClient.ListarPoliza(oEnPoliza).Cast<enPoliza>().ToList();
                string listadoSerializado = owsUtilClient.BuscarPoliza(dniAsegurado, numPoliza, placa);
                List<PolizaEN> lsitado = new JavaScriptSerializer().Deserialize<List<PolizaEN>>(listadoSerializado);
                /*
                foreach (enPoliza poliza in olEnPoliza.Where(
                    b => (b.FechaInicio <= Now && Now <= b.FechaFin)))
                {
                    olEnPolizaResult.Add(poliza);
                }*/

                rptListadoPolizas.DataSource = lsitado;
                rptListadoPolizas.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }

        
    }
}