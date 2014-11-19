using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Pacifico.SINCO.WEB.wsUtil;
using Pacifico.SINCO.WEB.wsPresupuesto;
using Pacifico.SINCO.WEB.wsSiniestro;

namespace Pacifico.SINCO.WEB.Modulos
{
    public partial class Principal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //WS-PRESUPUESTO
            IwsPresupuestoClient owsPresupuestoClient = new IwsPresupuestoClient();
            lblwsPresupuesto.InnerText = owsPresupuestoClient.wsObtenerNombreWS();

            //WS-SINIESTRO
            IwsSiniestroClient owsSiniestroClient = new IwsSiniestroClient();
            lblwsSiniestro.InnerText = owsSiniestroClient.wsObtenerNombreWS();

            //WSUTIL
            IwsUtilClient owsUtil = new IwsUtilClient();            
            lblwsUtil.InnerText = owsUtil.wsObtenerNombreWS();

        }
    }
}