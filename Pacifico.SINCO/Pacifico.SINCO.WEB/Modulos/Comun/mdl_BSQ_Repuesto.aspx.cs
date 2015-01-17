using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsListaPrecio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Comun
{
    public partial class mdl_BSQ_Repuesto : System.Web.UI.Page
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
                ListaPrecioWSClient serviceListaPrecio = new ListaPrecioWSClient();

                int marcaId = Int32.Parse(Request.QueryString["marcaId"]);
                int modeloId = Int32.Parse(Request.QueryString["modeloId"]);

                string listadoJson = serviceListaPrecio.Buscar(marcaId, modeloId);
                List<ListaPrecioEN> listado = new JavaScriptSerializer().Deserialize<List<ListaPrecioEN>>(listadoJson);

                rptListadoPrecios.DataSource = listado;
                rptListadoPrecios.DataBind();

            }
            catch (Exception ex)
            {
                lblMensajeError.InnerText = ex.Message;
            }
        }

    }
}