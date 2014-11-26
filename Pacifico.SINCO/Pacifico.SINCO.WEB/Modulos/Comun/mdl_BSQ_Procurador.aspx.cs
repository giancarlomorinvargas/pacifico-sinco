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

                //WS
                IwsUtilClient owsUtilClient = new IwsUtilClient();

                //Parametros
                enProcurador oEnProcurador = new enProcurador();

                //Obtiene Listado
                List<enProcurador> olEnPoliza = owsUtilClient.ListarProcurador(oEnProcurador).Cast<enProcurador>().ToList();

                rptListadoProcurador.DataSource = olEnPoliza;
                rptListadoProcurador.DataBind();


            }
            catch (Exception ex)
            {
                throw ex;
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
                //WS
                IwsUtilClient owsUtilClient = new IwsUtilClient();

                //Parametros
                enProcurador oEnProcurador = new enProcurador();

                //Obtiene Listado
                List<enProcurador> olEnPoliza = owsUtilClient.ListarProcurador(oEnProcurador).Cast<enProcurador>().ToList();

                rptListadoProcurador.DataSource = olEnPoliza;
                rptListadoProcurador.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}