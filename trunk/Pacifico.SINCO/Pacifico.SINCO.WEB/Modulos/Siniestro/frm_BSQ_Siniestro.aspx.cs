using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsSiniestro;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Siniestro
{

    public partial class frm_BSQ_Siniestro : System.Web.UI.Page
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

                //WS-SINIESTRO
                IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();
                
                //Parametros
                enSiniestro oEnSiniestro = new enSiniestro();

                //Obtiene Listado de Siniestros
                List<enSiniestro> loEnSiniestro = owsSiniestroClient.ListarSiniestro(oEnSiniestro).Cast<enSiniestro>().ToList();

                rptListadoSiniestros.DataSource = loEnSiniestro;
                rptListadoSiniestros.DataBind();


            }
            catch(Exception ex) {
                throw ex;
            }

        }
    }
}