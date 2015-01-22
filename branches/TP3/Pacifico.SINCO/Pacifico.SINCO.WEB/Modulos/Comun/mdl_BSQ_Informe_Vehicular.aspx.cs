﻿using Pacifico.SINCO.EN;
using Pacifico.SINCO.UTL;
using Pacifico.SINCO.WEB.wsInformeAccidente;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pacifico.SINCO.WEB.Modulos.Comun
{
    public partial class mdl_BSQ_Informe_Vehicular : System.Web.UI.Page
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

                InformeAccidenteWSClient owsInformeAccidenteClient = new InformeAccidenteWSClient();
                
                //Obtiene Listado de Siniestros
                string listadoJson = owsInformeAccidenteClient.Listar();
                //List<InformeAccidente> listadoResult = new List<InformeAccidente>();
                List<InformeAccidenteEN> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidenteEN>>(listadoJson);
                /*
                foreach (InformeAccidente item in listado.Where(b => b.Estado == Constantes.iEstado_Registrado )) {
                    listadoResult.Add(item);
                }


                rptListadoInformes.DataSource = listadoResult;*/
                rptListadoInformes.DataSource = listado;
                rptListadoInformes.DataBind();

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
                InformeAccidenteWSClient owsInformeAccidenteClient = new InformeAccidenteWSClient();


                string numInforme= txtNumInforme.Value.ToUpper();
                string asegurado = txtAsegurado.Value.ToUpper();

                //Obtiene Listado de Siniestros
                string listadoJson = owsInformeAccidenteClient.BuscarParaPresupuesto(numInforme, asegurado);
                //List<InformeAccidenteEN> listadoResult = new List<InformeAccidenteEN>();
                List<InformeAccidenteEN> listado = new JavaScriptSerializer().Deserialize<List<InformeAccidenteEN>>(listadoJson);

                /*foreach (InformeAccidenteEN item in listado)
                {
                    string asegurado = item.Siniestro.Poliza.Asegurado.Nombre + " " + item.Siniestro.Poliza.Asegurado.ApellidoPaterno + " " + item.Siniestro.Poliza.Asegurado.ApellidoMaterno;
                    if (asegurado.ToUpper().Contains(Asegurado)) {
                        listadoResult.Add(item);
                    }
                }*/


                rptListadoInformes.DataSource = listado;
                rptListadoInformes.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                lblMensajeError.InnerText = ex.Message;
            }
        }
    }
}