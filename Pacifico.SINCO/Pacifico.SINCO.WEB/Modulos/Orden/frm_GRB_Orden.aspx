<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_GRB_Orden.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Orden.frm_GRB_Orden" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">
    	
	<script type='text/javascript'>

	    $(document).ready(function () {
	        //Seta Calendarios
	        //fn_util_SeteaCalendario($('input[id*=txtFec]')[0]);
	    });
	    var objItemSeleccionado;

	    function fn_Grabar() {
	        var sError = "";

	        //Valida cada campo
	        sHddCodSiniestro = $("#hdnSiniestroId").val();
	        console.log('sHddCodSiniestro', sHddCodSiniestro);

	        sTxtNumLiquidacion = $("#txtNumLiquidacion").val();
	        sTxtFechaLiquidacion = $("#txtFechaLiquidacion").val();
	        sTxtDescripcion = $("#txtDescripcion").val();
	        sTxtMontoLiquidacion = $("#txtMontoLiquidacion").val();
	        sTxtMontoCobertura = $("#txtMontoCobertura").val();

	        
	        //Valida Final
	        if (sError == "") {
	            fn_mdl_confirma("¿Está seguro que desea generar la Orden de Cobro?",
                                function () {
                                    $("#btnGrabar").click();
                                },
                                null,
                                null,
                                "CONFIRMACIÓN"
                                );
	        } else {
	            fn_mdl_alert(sError, null, "VALIDACIONES");
	        }

	    }
	</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    
    <asp:Button ID="btnGrabar" runat="server" Text="" OnClientClick="" OnClick="btnGrabar_Click" ClientIDMode="Static" Style="display: none;" />
    
						
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
							<a href="javascript:fn_Grabar();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
								Grabar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Orden.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cancelar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Registrar Orden de Cobro</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
						
						
	<!-- INCIO PANEL-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_panel">
		<tr class="cabecera"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
		<tr class="body">	
			<td class="left"></td>				
			<td class="center">							
									
				<div class="css_tb_cuerpoPanel">
					<table width="100%" border="0" cellpadding="10" cellspacing="0" class="css_tb_formPanel"><tr><td>
                        
                        <fieldset>
							<legend>DATOS DE LIQUIDACIÓN</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número Liquidación
									</td>
									<td>
										<input id="txtNumLiquidacion" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Fecha Liquidación
									</td>
									<td>
										<input id="txtFechaLiquidacion" type="text" size="50" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Descripción
									</td>
									<td>
										<textarea id="txtDescripcion" cols="100" rows="5" runat="server" class="css_input_inactivo"  ClientIDMode="Static" readonly="readonly"></textarea>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Liquidación
									</td>
									<td>
										<input id="txtMontoLiquidacion" type="text" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/>
                                        </td>												
								</tr>                                
							</table>
												
						</fieldset>									
																							
						<fieldset>
							<legend>DATOS DEL SINIESTRO</legend>
                            <asp:HiddenField ID="hdnSiniestroId" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            <asp:HiddenField ID="hdnLiquidacionId" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            												
                            <asp:HiddenField ID="UsuarioRegistro" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            <asp:HiddenField ID="FechaRegistro" runat="server" ClientIDMode="Static" EnableViewState="false" />
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Siniestro
									</td>
									<td>
										<input id="txtNumSiniestro" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>&nbsp;
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Tipo
									</td>
									<td>
										<input id="txtTipoSiniestro" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Fecha del Siniestro
									</td>
									<td>
										<input id="txtFecSiniestro" type="text" class="css_frm_inactivo" size="8" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
								<tr>
									<td class="label" style="width: 120px;">
										Lugar
									</td>
									<td>
										<input id="txtLugar" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
							</table>																								
						</fieldset>
                        
						<fieldset>
							<legend>DATOS DE PÓLIZA</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Póliza
									</td>
									<td>
										<input id="txtNumPoliza" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" size="50" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Vigencia
									</td>
									<td>
										<input id="txtInicio" type="text" size="8" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/> al 
										<input id="txtFin" type="text" size="8" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Cobertura
									</td>
									<td>
										<input id="txtMontoCobertura" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>												
								</tr>																												
							</table>
												
						</fieldset>                        
						

					</td></tr>
                    <tr><td><label id="lblMensaje" class="operation-success" runat="server" ></label><label id="lblMensajeError" class="validation-summary-errors" runat="server" ></label></td></tr>
					</table>							
										
													
				</div>
									
			</td>
			<td class="right"></td>												
		</tr>
		<tr class="pie"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
	</table>	
	<!-- FIN PANEL-->

    
</asp:Content>

