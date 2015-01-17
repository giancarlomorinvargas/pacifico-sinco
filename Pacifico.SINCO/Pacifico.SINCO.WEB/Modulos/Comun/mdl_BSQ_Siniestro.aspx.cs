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

                SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();
                
                //Obtiene Listado de Siniestros
                //List<InformeAccidente> listadoResult = new List<InformeAccidente>();
                List<enSiniestro> listado = owsSiniestroClient.ListarSiniestro(new enSiniestro()).Cast<enSiniestro>().ToList();
                /*
                foreach (InformeAccidente item in listado.Where(b => b.Estado == Constantes.iEstado_Registrado )) {
                    listadoResult.Add(item);
                }
                

                rptListadoInformes.DataSource = listadoResult;*/
                rptListadoSiniestros.DataSource = listado;
                rptListadoSiniestros.DataBind();

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
                SiniestroWSClient owsSiniestroClient = new SiniestroWSClient();


                string NumInforme= txtNumInforme.Value.ToUpper();
                string Asegurado = txtAsegurado.Value.ToUpper();

                //Obtiene Listado de Siniestros
                List<enSiniestro> listadoResult = owsSiniestroClient.ListarSiniestro(new enSiniestro()).Cast<enSiniestro>().ToList();
                /*List<InformeAccidente> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidente>>(listadoJson);

                foreach (InformeAccidente item in listado)
                {
                    string asegurado = item.Siniestro.Poliza.Asegurado.Nombre + " " + item.Siniestro.Poliza.Asegurado.ApellidoPaterno + " " + item.Siniestro.Poliza.Asegurado.ApellidoMaterno;
                    if (asegurado.ToUpper().Contains(Asegurado)) {
                        listadoResult.Add(item);
                    }
                }*/


                rptListadoSiniestros.DataSource = listadoResult;
                rptListadoSiniestros.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}