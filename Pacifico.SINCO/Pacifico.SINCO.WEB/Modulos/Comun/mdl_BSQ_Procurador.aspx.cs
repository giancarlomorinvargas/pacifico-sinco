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
    public partial class mdl_BSQ_Procurador : System.Web.UI.Page
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
                    //List<enProcurador> olEnPolizaResult = new List<enProcurador>();
                    //WS
                    UtilWSClient owsUtilClient = new UtilWSClient();

                    //Parametros
                    //enProcurador oEnProcurador = new enProcurador();

                    //Obtiene Listado
                    string listadoSerializado = owsUtilClient.ListarProcurador();
                    List<ProcuradorEN> listado = new JavaScriptSerializer().Deserialize<List<ProcuradorEN>> (listadoSerializado);
                    /*
                    foreach (enProcurador procurador in olEnPoliza.Where(b => b.Disponible))
                    {
                        olEnPolizaResult.Add(procurador);
                    }*/

                    rptListadoProcurador.DataSource = listado;
                    rptListadoProcurador.DataBind();
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
            //WS
            UtilWSClient owsUtilClient = new UtilWSClient();
            try
            {
                //List<enProcurador> olEnPolizaResult = new List<enProcurador>();
                //Parametros
                //enProcurador oEnProcurador = new enProcurador();
                string numProcurador = txtCodigoProcurador.Value;
                //string apellidoPaterno = txtNombreProcurador.Value;
                string nombre = txtNombreProcurador.Value;
                //string apellidoMaterno = txtNombreProcurador.Value;

                //Obtiene Listado
                //List<enProcurador> olEnPoliza = owsUtilClient.ListarProcurador(oEnProcurador).Cast<enProcurador>().ToList();
                string listadoSerializado = owsUtilClient.BuscarProcurador(numProcurador, nombre);
                List<ProcuradorEN> listado = new JavaScriptSerializer().Deserialize<List<ProcuradorEN>>(listadoSerializado);
                /*
                foreach (enProcurador procurador in olEnPoliza.Where(b => b.Disponible))
                {
                    olEnPolizaResult.Add(procurador);
                }*/

                rptListadoProcurador.DataSource = listado;
                rptListadoProcurador.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
                try
                {
                    string listadoSerializado = owsUtilClient.ListarProcurador();
                    List<ProcuradorEN> listado = new JavaScriptSerializer().Deserialize<List<ProcuradorEN>>(listadoSerializado);

                    rptListadoProcurador.DataSource = listado;
                    rptListadoProcurador.DataBind();
                }
                catch (Exception) { 
                }
                
            }
        }

    }
}