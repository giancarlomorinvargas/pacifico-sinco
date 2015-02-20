using Pacifico.SINCO.EN;
using Pacifico.SINCO.WEB.wsPresupuesto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;



namespace Pacifico.SINCO.WEB.Modulos.Presupuesto
{
    public partial class frm_EVA_Presupuesto : System.Web.UI.Page
    {

        #region Variables Globales
        public string sUrl
        {
            get { return (Page.ResolveUrl("~")); }
        }
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            hddMensajeError.Value = "";
            if (!this.IsPostBack)
            {
                try{
                    //WS-SINIESTRO
                    PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
                    string modelJson = owsPresupuestoClient.ListarPresupuestoPendiente();
                    List<PresupuestoPendienteCabeceraEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteCabeceraEN>>(modelJson);

                    grvPresupuesto.DataSource = listado;
                    grvPresupuesto.DataBind();
                }
                catch (Exception ex)
                {
                    hddMensajeError.Value = ex.Message;
                }
            }

        }

        protected void imgDetalle_Click(object sender, ImageClickEventArgs e)
        {
            hddMensajeError.Value = "";
            int contador = 0;
            foreach (GridViewRow row in grvPresupuesto.Rows)
            {
                CheckBox check = (CheckBox)row.FindControl("CheckBox1");
                if (check.Checked)
                {
                    contador = contador + 1;
                    PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
                    int idPresupuesto = Convert.ToInt32(grvPresupuesto.DataKeys[row.RowIndex].Values[0].ToString());
                    string modelJson = owsPresupuestoClient.ObtenerPresupuestoDetalle(idPresupuesto);
                    List<PresupuestoPendienteDetalleEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteDetalleEN>>(modelJson);
                    grvDetallePresupuesto.DataSource = listado;
                    grvDetallePresupuesto.DataBind();
                    mpePresupuestoDetalle.Show();             
                }
        
            }
            if (contador == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alerta", "alert('Primero seleccione un registro');", true);
            }


        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {

            mpePresupuestoDetalle.Hide();
        }

        protected void imgAprobar_Click(object sender, ImageClickEventArgs e)
        {
            hddMensajeError.Value = "";

            int contador =0;
            foreach (GridViewRow row in grvPresupuesto.Rows)
            {
                CheckBox check = (CheckBox)row.FindControl("CheckBox1");
                if (check.Checked)
                {
                    contador = contador + 1;
                    PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
                    int idPresupuesto = Convert.ToInt32(grvPresupuesto.DataKeys[row.RowIndex].Values[0].ToString());
                    string modelJson = owsPresupuestoClient.AprobarPresupuestoPendiente(idPresupuesto);
                    string modelJson1 = owsPresupuestoClient.ListarPresupuestoPendiente();
                    List<PresupuestoPendienteCabeceraEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteCabeceraEN>>(modelJson1);
                    grvPresupuesto.DataSource = listado;
                    grvPresupuesto.DataBind();
                    return;

                }
        
           }
            if (contador == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alerta", "alert('Primero seleccione un registro');", true);
            }
        }
        protected void imgRechazar_Click(object sender, ImageClickEventArgs e)
        {
            hddMensajeError.Value = "";
          
            int contador =0;
            foreach (GridViewRow row in grvPresupuesto.Rows)
            {
                CheckBox check = (CheckBox)row.FindControl("CheckBox1");
                if (check.Checked)
                {
                    contador = contador + 1;
                    txtMotivorechazo.Enabled = true;
                    btnPnlRechazarPresupuesto.Enabled = true;
                mpeRechazarPresupuesto.Show();

                }
        
           }
            if (contador == 0)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alerta", "alert('Primero seleccione un registro');", true);
            }
        }
        

        protected void btnPnlRechazarPresupuesto_Click(object sender, EventArgs e)
        {
            if (txtMotivorechazo.Text != string.Empty)
            {

                foreach (GridViewRow row in grvPresupuesto.Rows)
                {
                    CheckBox check = (CheckBox)row.FindControl("CheckBox1");
                    if (check.Checked)
                    {

                        PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
                        int idPresupuesto = Convert.ToInt32(grvPresupuesto.DataKeys[row.RowIndex].Values[0].ToString());
                        string modelJson = owsPresupuestoClient.RechazarPresupuestoPendiente(idPresupuesto, txtMotivorechazo.Text);

                        lblMensaje.Text = "GRABACION EXITOSA";
                        txtMotivorechazo.Enabled = false;
                        btnPnlRechazarPresupuesto.Enabled = false;


                    }

                }
            }
            else
            {
                lblMensaje.ForeColor = Color.Red;
                lblMensaje.Text = "EL MOTIVO NO PUEDE ESTAR EN BLANCO";
            }

        }

        protected void btnCerrarPnlRechazarPresupuesto_Click(object sender, EventArgs e)
        {
            txtMotivorechazo.Enabled = true;
            txtMotivorechazo.Text = "";
            lblMensaje.Text = "";
            btnPnlRechazarPresupuesto.Enabled = true;
            mpeRechazarPresupuesto.Hide();

            PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();
            string modelJson = owsPresupuestoClient.ListarPresupuestoPendiente();
            List<PresupuestoPendienteCabeceraEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteCabeceraEN>>(modelJson);

            grvPresupuesto.DataSource = listado;
            grvPresupuesto.DataBind();
          
        }

        protected void imgBuscar_Click(object sender, ImageClickEventArgs e)
        {
            hddMensajeError.Value = "";
            //WS-SINIESTRO
            PresupuestoWSClient owsPresupuestoClient = new PresupuestoWSClient();

            try
            {
           
                //Parametros
                string NumPresupuesto = txtNumPresupuesto.Value;
                string NumInforme = txtNumInforme.Value;
                string NumPoliza = txtNumPoliza.Value;
                string FechaPresupuesto = txtFechaPresupuesto.Value;

                //Obtiene Listado de Siniestros
                string listadoJson = owsPresupuestoClient.BuscarPresupuestoPendiente(NumPresupuesto, NumInforme, NumPoliza, FechaPresupuesto);

                List<PresupuestoPendienteCabeceraEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteCabeceraEN>>(listadoJson);

                grvPresupuesto.DataSource = listado;
                grvPresupuesto.DataBind();

            }
            catch (Exception ex)
            {
                //throw ex;
                hddMensajeError.Value = ex.Message;
                try
                {
                    //Obtiene Listado de Siniestros
                    string modelJson = owsPresupuestoClient.ListarPresupuestoPendiente();
                    List<PresupuestoPendienteCabeceraEN> listado = new JavaScriptSerializer().Deserialize<List<PresupuestoPendienteCabeceraEN>>(modelJson);

                    grvPresupuesto.DataSource = listado;
                    grvPresupuesto.DataBind();
                }
                catch (Exception)
                {
                }
                
            }

        }

        /*protected void grvPresupuesto_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int estado =Convert.ToInt32( grvPresupuesto.DataKeys[e.Row.RowIndex].Values[1].ToString());
                if (estado == 41)
                {
                    e.Row.Cells[5].Text = "REGISTRADO";
                   // e.Row.BackColor = Color.FromName("#c6efce");
                  
                }
                else if(estado==42)
                {
                      e.Row.Cells[5].Text = "APROBADO";
                      CheckBox chk = (CheckBox)e.Row.FindControl("CheckBox1");
                      chk.Enabled = false;
                     
                }
                    else if(estado==43)
                {
                      e.Row.Cells[5].Text = "RECHAZADO";
                      CheckBox chk = (CheckBox)e.Row.FindControl("CheckBox1");
                      chk.Enabled = false;
                }
            }
            }*/
    }
    }


