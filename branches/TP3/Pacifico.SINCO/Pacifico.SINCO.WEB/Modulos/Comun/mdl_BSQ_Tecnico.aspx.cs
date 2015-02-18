using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using Pacifico.SINCO.WEB.wsTecnico;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Comun
{
    public partial class mdl_BSQ_Tecnico : System.Web.UI.Page
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

                TecnicoWSClient tecnicoWSClient = new TecnicoWSClient();
                
                //Obtiene Listado de Siniestros
                string listadoJson = tecnicoWSClient.Listar();
                //List<InformeAccidente> listadoResult = new List<InformeAccidente>();
                List<Pacifico.SINCO.EN.TecnicoEN> listado = new JavaScriptSerializer().Deserialize<List<Pacifico.SINCO.EN.TecnicoEN>>(listadoJson);
                /*
                foreach (InformeAccidente item in listado.Where(b => b.Estado == Constantes.iEstado_Registrado )) {
                    listadoResult.Add(item);
                }


                rptListadoTecnico.DataSource = listadoResult;*/
                rptListadoTecnicos.DataSource = listado;
                rptListadoTecnicos.DataBind();

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
            TecnicoWSClient tecnicoWSClient = new TecnicoWSClient();
            try
            {


                string numTecnico = txtNumTecnico.Value.ToUpper();
                string tecnico = txtTecnico.Value.ToUpper();

                //Obtiene Listado de Siniestros
                string listadoJson = tecnicoWSClient.ConsultarDisponibilidad(numTecnico, tecnico);
                //List<InformeAccidenteEN> listadoResult = new List<InformeAccidenteEN>();
                List<Pacifico.SINCO.EN.TecnicoEN> listado = new JavaScriptSerializer().Deserialize<List<Pacifico.SINCO.EN.TecnicoEN>>(listadoJson);

                /*foreach (InformeAccidenteEN item in listado)
                {
                    string asegurado = item.Siniestro.Poliza.Asegurado.Nombre + " " + item.Siniestro.Poliza.Asegurado.ApellidoPaterno + " " + item.Siniestro.Poliza.Asegurado.ApellidoMaterno;
                    if (asegurado.ToUpper().Contains(Asegurado)) {
                        listadoResult.Add(item);
                    }
                }*/


                rptListadoTecnicos.DataSource = listado;
                rptListadoTecnicos.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
                try
                {
                    //Obtiene Listado de Siniestros
                    string listadoJson = tecnicoWSClient.Listar();
                    //List<InformeAccidenteEN> listadoResult = new List<InformeAccidenteEN>();
                    List<Pacifico.SINCO.EN.TecnicoEN> listado = new JavaScriptSerializer().Deserialize<List<Pacifico.SINCO.EN.TecnicoEN>>(listadoJson);

                    rptListadoTecnicos.DataSource = listado;
                    rptListadoTecnicos.DataBind();
                }
                catch (Exception) { 
                }
            }
        }
    }
}