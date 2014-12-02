using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsUtil;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
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
                    List<enProcurador> olEnPolizaResult = new List<enProcurador>();
                    //WS
                    IwsUtilClient owsUtilClient = new IwsUtilClient();

                    //Parametros
                    enProcurador oEnProcurador = new enProcurador();

                    //Obtiene Listado
                    List<enProcurador> olEnPoliza = owsUtilClient.ListarProcurador(oEnProcurador).Cast<enProcurador>().ToList();
                    /*
                    foreach (enProcurador procurador in olEnPoliza.Where(b => b.Disponible))
                    {
                        olEnPolizaResult.Add(procurador);
                    }*/

                    rptListadoProcurador.DataSource = olEnPoliza;
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
            try
            {
                lblMensajeError.InnerText = "";
                //WS
                IwsUtilClient owsUtilClient = new IwsUtilClient();

                List<enProcurador> olEnPolizaResult = new List<enProcurador>();
                //Parametros
                enProcurador oEnProcurador = new enProcurador();
                oEnProcurador.NumProcurador = txtCodigoProcurador.Value;
                oEnProcurador.ApellidoPaterno = txtNombreProcurador.Value;
                oEnProcurador.Nombre = txtNombreProcurador.Value;
                oEnProcurador.ApellidoMaterno = txtNombreProcurador.Value;

                //Obtiene Listado
                List<enProcurador> olEnPoliza = owsUtilClient.ListarProcurador(oEnProcurador).Cast<enProcurador>().ToList();
                /*
                foreach (enProcurador procurador in olEnPoliza.Where(b => b.Disponible))
                {
                    olEnPolizaResult.Add(procurador);
                }*/

                rptListadoProcurador.DataSource = olEnPoliza;
                rptListadoProcurador.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }

    }
}