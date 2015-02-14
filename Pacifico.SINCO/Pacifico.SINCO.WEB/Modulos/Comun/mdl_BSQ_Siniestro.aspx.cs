using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Comun
{
    public partial class mdl_BSQ_Siniestro : System.Web.UI.Page
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
                    List<String> tipoSiniestro = Utilitario.getTipoSiniestro();

                    cmbTipoSiniestro.Items.Clear();
                    cmbTipoSiniestro.Items.Add(new ListItem { Value = "", Text = "[SELECCIONE]" });
                    foreach (string tipo in tipoSiniestro)
                    {
                        cmbTipoSiniestro.Items.Add(tipo);
                    }


                    SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();

                    //Obtiene Listado de Siniestros
                    //List<InformeAccidente> listadoResult = new List<InformeAccidente>();
                    string listadoSerializado = owsSiniestroClient.Listar();
                    List<SiniestroEN> listado = new JavaScriptSerializer().Deserialize<List<SiniestroEN>>(listadoSerializado);
                    /*
                    foreach (InformeAccidente item in listado.Where(b => b.Estado == Constantes.iEstado_Registrado )) {
                        listadoResult.Add(item);
                    }
                

                    rptListadoInformes.DataSource = listadoResult;*/
                    rptListadoSiniestros.DataSource = listado;
                    rptListadoSiniestros.DataBind();
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
            lblMensajeError.InnerText = "";
            SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();

            try
            {


                string numSiniestro= txtNumSiniestro.Value;
                string tipoSiniestro = cmbTipoSiniestro.Value;

                //Obtiene Listado de Siniestros
                string listadoSerializado = owsSiniestroClient.Consultar(numSiniestro, tipoSiniestro);
                List<SiniestroEN> listado = new JavaScriptSerializer().Deserialize<List<SiniestroEN>>(listadoSerializado);

                rptListadoSiniestros.DataSource = listado;
                rptListadoSiniestros.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;

                string listadoSerializado = owsSiniestroClient.Listar();
                List<SiniestroEN> listado = new JavaScriptSerializer().Deserialize<List<SiniestroEN>>(listadoSerializado);

                rptListadoSiniestros.DataSource = listado;
                rptListadoSiniestros.DataBind();

            }
        }
    }
}