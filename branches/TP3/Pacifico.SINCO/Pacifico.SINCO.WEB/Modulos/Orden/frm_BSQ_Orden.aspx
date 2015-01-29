<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_BSQ_Orden.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Orden.frm_BSQ_Liquidacion" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        $(document).ready(function () {
            //Seta Calendarios
            fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);

            //Valida Mostrar Mensaje
            var strMensaje = $("#hddMensaje").val();
            if (fn_util_trim(strMensaje) != "") {
                fn_mdl_mensajeIco(strMensaje,'/Util/images/ok.gif');
            }
            var strMensajeError = $("#hddMensajeError").val();
            if (fn_util_trim(strMensajeError) != "") {
                fn_mdl_mensajeIco(strMensajeError,'/Util/images/warning.gif');
            }

        });

        function fn_buscar() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck, estado) {
            $('input[id*="chkIdLiquidacion"]').prop('checked', false);
            objCheck.checked = true;
            $("#hddCodLiquidacion").val(objCheck.value);
            $("#hddEstadoLiquidacion").val(estado);
        }

        function fn_redirect(pUrl) {
            var hddCodLiquidacion = $("#hddCodLiquidacion").val();
            if (hddCodLiquidacion != "") {
                var hddEstado = $("#hddEstadoLiquidacion").val();

                if (hddEstado == "<%=Pacifico.SINCO.UTL.Constantes.lEstado_Registrado%>") {
                    window.location = pUrl + "?pIdLiquidacion=" + hddCodLiquidacion;
                } else {
                    fn_mdl_alert("No se puede generar una Orden de Cobro a partir de estado actual de la Liquidación.", null, "VALIDACIONES");
                }
            } else {
                fn_mdl_alert("Debe seleccionar un registro", null, "VALIDACIONES");
            }
        }
        
        function fn_redirectView(pUrl) {
            var hddCodigo = $("#hddCodLiquidacion").val();
            if (hddCodigo != "") {
                window.location = pUrl + "?pIdLiquidacion=" + hddCodigo;
            } else {
                fn_mdl_alert("Debe seleccionar un registro", null, "VALIDACIONES");
            }
        }

    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">

	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Orden de Cobro </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:fn_redirect('frm_GRB_Orden.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
								Grabar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_redirect('frm_RAJ_Orden.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_dominio.jpg" border="0" /><br />
								Realizar Ajuste
							</a>
						</td>
						<td class="boton">
							<a href="javascript:fn_redirect('frm_REC_Orden.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Rechazar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_redirectView('frm_CNS_Orden.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_informes.jpg" border="0" /><br />
								Consultar
							</a>
						</td>
                        <td class="boton">
							<a href="javascript:fn_buscar();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:window.location='../Principal.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_inicio.jpg" border="0" /><br />
								Salir
							</a>
						</td>
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Mantenimiento de Orden de Cobro</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
						

   <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
   <asp:HiddenField ID="hddCodLiquidacion" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddEstadoLiquidacion" runat="server" ClientIDMode="Static" EnableViewState="false" />	

   <asp:HiddenField ID="hddMensaje" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddMensajeError" runat="server" ClientIDMode="Static" EnableViewState="false" />	
						
	<!-- INCIO PANEL-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_panel">
		<tr class="cabecera"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
		<tr class="body">	
			<td class="left"></td>				
			<td class="center">							
									
				<div class="css_lbl_tituloModal">Criterios de búsqueda</div>
				<div class="css_tb_cuerpoPanel">
									
					<table width="100%" border="0" cellpadding="5" cellspacing="0" class="css_tb_formPanel">
						<tr>				
							<td class="label"style="width:180px;">
								Número de Liquidación
							</td>
							<td><input id="txtNumLiquidacion" type="text" class="" runat="server"/>
							</td>	<!--
							<td class="label" style="width:120px;">
								Número de Siniestro
							</td>
							<td>
								<input id="txtNumSiniestro" type="text" class="" runat="server"/>
							</td>-->
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Tipo Siniestro
							</td>
							<td>
								<select id="cmbTipoSiniestro" class="" runat="server"/>
							</td>	
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Fecha de Liquidacion
							</td>
							<td><input id="txtFechaLiquidacion" type="text" class="" size="8"  runat="server" onKeyUp="return fn_util_FormatDate(this);" onBlur="return fn_util_UpdateDate(this);" />
							</td>												
						</tr>											
					</table>
									
				</div>
									
			</td>
			<td class="right"></td>												
		</tr>
		<tr class="pie"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
	</table>	
	<!-- FIN PANEL-->
						
			
	<br/><br/>
    	
    <asp:Repeater ID="rptListadoLiquidaciones" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th title="Número de Informe">Número Liquidación</th>
                        <th />
			            <th>Fecha Liquidación</th>		
                        <th />					
			            <th title="Número de Póliza">Número de Poliza</th>
                        <th />
			            <th title="Documento del Asegurado">Asegurado</th>
                        <th />
			            <th >Tipo Siniestro</th>
                        <th />	
			            <th >Monto Liquidación</th>
                        <th />						
			            <th >Estado</th>
                        <th />
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr <%#Int32.Parse(Eval("Estado").ToString())%2==0?"class=\"even\"":"" %> >
			            <td><input id="chkIdLiquidacion" type="checkbox" value="<%#Eval("LiquidacionId") %>" onclick="javascript: fn_checkLista(this,'<%#Eval("Estado")%>')"/></td>
			            <td style="text-align:center;"><%#Eval("NumLiquidacion") %><td>
			            <td style="text-align:center;"><%#Eval("FechaLiquidacion") %><td>
			            <td><%#Eval("Siniestro.Poliza.NumPoliza") %><td>
			            <td style="text-align:center;"><%#Eval("Siniestro.Poliza.Asegurado.Nombre") %> <%#Eval("Siniestro.Poliza.Asegurado.ApellidoPaterno") %> <%#Eval("Siniestro.Poliza.Asegurado.ApellidoMaterno") %><td>
			            
			            <td><%#Eval("Siniestro.Tipo") %><td>
                            <td><%#Eval("MontoLiquidacion") %><td>
			            <td style="text-align:center;color:<%#Int32.Parse(Eval("Estado").ToString())==Pacifico.SINCO.UTL.Constantes.lEstado_Registrado ? "green": "red"%>;"><%#Eval("EstadoEntity.Nombre") %><td>
		            </tr>                                       
               </ItemTemplate>
            <FooterTemplate>
            </tbody>
         </table>
         </FooterTemplate>
      </asp:Repeater>
    <p>
        <label id="lblMensaje" class="operation-success" runat="server" ></label><label id="lblMensajeError" class="validation-summary-errors" runat="server" ></label>
    </p>

</asp:Content>

