<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="frm_EVA_Presupuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Presupuesto.frm_EVA_Presupuesto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="server">

    <script type="text/javascript">

        function CheckBoxCheck(rb) {

            var gv = document.getElementById("<%=grvPresupuesto.ClientID%>");
            var chk = gv.getElementsByTagName("input");
            var row = rb.parentNode.parentNode;
            for (var i = 0; i < chk.length; i++) {
                if (chk[i].type == "checkbox") {
                    if (chk[i].checked && chk[i] != rb) {
                        chk[i].checked = false;
                        break;
                    }
                }
            }
        }
        $(document).ready(function () {
            //Seta Calendarios
            fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);

            //Valida Mostrar Mensaje
            var strMensaje = $("#hddMensaje").val();
            if (fn_util_trim(strMensaje) != "") {
                fn_mdl_mensajeIco(strMensaje, '/Util/images/ok.gif');
            }
            var strMensajeError = $("#hddMensajeError").val();
            if (fn_util_trim(strMensajeError) != "") {
                fn_mdl_mensajeIco(strMensajeError, '/Util/images/warning.gif');
            }

        });


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphCuerpo" runat="server">

    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
        <tr>
            <td rowspan="2" class="icono">
                <img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
            <td class="modulo">Presupuestos </td>
            <td rowspan="2" class="botones">

                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
                    <tr>
                        <td>&nbsp;</td>
                        <td class="boton">
                            <a></a>
                        </td>
                        <td class="boton">
                            <a>

                                <asp:ImageButton ID="imgDetalle" runat="server" ImageUrl="~/Util/images/iconos/ico_btn_editar.jpg" Width="30px" Height="30px" OnClick="imgDetalle_Click" />
                                Detalle
                            </a>
                        </td>
                        <td class="boton">
                            <a>
                                <asp:ImageButton ID="imgAprobar" runat="server" ImageUrl="~/Util/images/iconos/aprobar.jpg" Width="30px" Height="30px" OnClick="imgAprobar_Click" OnClientClick="return confirm('Esta apunto de aproba un presupuesto desea continuar ?');" />
                                Aprobar
                            </a>
                        </td>
                        <td class="boton">
                            <a>
                                <asp:ImageButton ID="imgRechazar" runat="server" ImageUrl="~/Util/images/iconos/rechazar.jpg" Width="30px" Height="30px" OnClick="imgRechazar_Click" />
                                Rechazar
                            </a>
                        </td>
                        <td class="boton">
                            <a>
                                <asp:ImageButton ID="imgBuscar" runat="server" ImageUrl="~/Util/images/iconos/ico_btn_buscar.jpg" Width="30px" Height="30px" OnClick="imgBuscar_Click" />

                                Buscar
                            </a>
                        </td>
                        <td class="boton">
                        <a href="javascript:window.location='../Principal.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_inicio.jpg" border="0" /><br />
								Inicio
							</a>
                        </td>
                    </tr>
                </table>

            </td>
        </tr>
        <tr>
            <td class="subModulo">Evaluación de Presupuestos</td>
        </tr>
    </table>
    <asp:HiddenField ID="hddMensaje" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddMensajeError" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_panel">
        <tr class="cabecera">
            <td class="left"></td>
            <td class="center"></td>
            <td class="right"></td>
        </tr>
        <tr class="body">
            <td class="left"></td>
            <td class="center">
                <div class="css_lbl_tituloModal">Criterios de búsqueda</div>
                <div class="css_tb_cuerpoPanel">

                    <table width="100%" border="0" cellpadding="5" cellspacing="0" class="css_tb_formPanel">
                        <tr>
                            <td class="label" style="width: 120px;">Nro. de Presupuesto
                            </td>
                            <td>
                                <input id="txtNumPresupuesto" type="text" class="" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                            <td class="label" style="width: 180px;">Nro. de Accidente Vehicular
                            </td>
                            <td>
                                <input id="txtNumInforme" type="text" class="" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="label">Nro. de Póliza
                            </td>
                            <td>
                                <input id="txtNumPoliza" type="text" class="" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                            <td class="label" style="width: 120px;">Fecha
                            </td>
                            <td>
                                <input id="txtFechaPresupuesto" type="text" class="" size="8" runat="server" onkeyup="return fn_util_FormatDate(this);" onblur="return fn_util_UpdateDate(this);" />
                            </td>
                        </tr>
                    </table>
                </div>

            </td>
            <td class="right"></td>
        </tr>
        <tr class="pie">
            <td class="left"></td>
            <td class="center"></td>
            <td class="right"></td>
        </tr>
    </table>
    			
	<br/><br/>
    	

    <div style="width: 100%">
        <asp:GridView ID="grvPresupuesto" runat="server" DataKeyNames="PresupuestoID,Estado"
            Width="100%" AutoGenerateColumns="false" CssClass="css_grilla" OnRowDataBound="grvPresupuesto_RowDataBound">

            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" onclick="CheckBoxCheck(this);" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="# Poliza" DataField="NumeroPoliza" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Matrícula" DataField="MatriculaVehiculo" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Sub Total" DataField="SubTotal" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Total" DataField="Total" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField HeaderText="Estado" ItemStyle-HorizontalAlign="Center" />

            </Columns>
        </asp:GridView>

    </div>

    <asp:HiddenField ID="HiddenField1" runat="server" />
    <asp:ModalPopupExtender ID="mpePresupuestoDetalle" runat="server"
        PopupControlID="pnlPresupuestoDetalle" TargetControlID="HiddenField1"
        BackgroundCssClass="backgroundColor">
    </asp:ModalPopupExtender>
    <div class="css_tb_cuerpoPanel">
        <asp:Panel ID="pnlPresupuestoDetalle" runat="server" BackColor="White" Width="30%" Style="display: none;">

            <asp:UpdatePanel ID="updatepanel1" runat="server">
                <ContentTemplate>
                    <!--<div class="css_lbl_tituloModal" style="text-align: center">Detalle de Presupuesto</div>-->
                    <h2 style="text-align: center">Detalle presupuesto</h2>
                    <div>

                        <asp:GridView ID="grvDetallePresupuesto" runat="server" CssClass="css_grilla" AutoGenerateColumns="false" Width="100%">
                            <Columns>
                                <asp:BoundField HeaderText="Servicio" DataField="Servicio" />
                                <asp:BoundField HeaderText="Importe" DataField="Importe" />
                                <asp:BoundField HeaderText="Descuento" DataField="Descuento" />
                                <asp:BoundField HeaderText="Precio" DataField="Precio" />

                            </Columns>

                        </asp:GridView>


                    </div>

                    <div>
                        <asp:Button ID="btnCerrar" runat="server" Text="Cerrar" OnClick="btnCerrar_Click" CssClass="css_btn_general" />

                    </div>

                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>
    </div>
    <asp:HiddenField ID="HiddenField2" runat="server" />
    <asp:ModalPopupExtender ID="mpeRechazarPresupuesto" runat="server"
        PopupControlID="pnlRechazarPresupuesto" TargetControlID="HiddenField2"
        BackgroundCssClass="backgroundColor">
    </asp:ModalPopupExtender>
    <div class="css_tb_cuerpoPanel">
        <asp:Panel ID="pnlRechazarPresupuesto" runat="server" BackColor="White" Width="30%" Style="display: none">

            <asp:UpdatePanel ID="updatepanel2" runat="server">
                <ContentTemplate>

                    <h2 style="text-align: center">RECHAZO DE PRESUPUESTO</h2>

                    <table border="0" cellpadding="10" cellspacing="0" class="css_tb_formPanel">
                        <tr style="height: 20%">
                            <td colspan="3" style="text-align: center">
                                <b>INGRESE UN MOTIVO DE RECHAZO</b>
                            </td>
                            <hr />
                        </tr>
                        <tr style="height: 60%">
                            <td colspan="3" style="height: 100%">
                                <asp:TextBox ID="txtMotivorechazo" runat="server" TextMode="MultiLine" Width="100%" Height="100%"></asp:TextBox>

                            </td>

                        </tr>
                        <tr style="height: 20%">
                            <td>
                                <asp:Button ID="btnCerrarPnlRechazarPresupuesto" runat="server" Text="Cerrar" OnClick="btnCerrarPnlRechazarPresupuesto_Click" CssClass="css_btn_general" />
                            </td>
                            <td></td>
                            <td>
                                <asp:Button ID="btnPnlRechazarPresupuesto" runat="server" Text="Rechazar" OnClick="btnPnlRechazarPresupuesto_Click" CssClass="css_btn_general" CausesValidation="true" />
                            </td>
                        </tr>

                        <tr style="height: 60%">
                            <td colspan="3" style="height: 100%">

                                <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
                            </td>

                        </tr>
                    </table>

                    </div>

         

                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnCerrarPnlRechazarPresupuesto" />
                </Triggers>
            </asp:UpdatePanel>

        </asp:Panel>
    </div>


</asp:Content>
