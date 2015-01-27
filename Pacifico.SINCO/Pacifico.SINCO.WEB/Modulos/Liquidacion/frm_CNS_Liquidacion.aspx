<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_CNS_Liquidacion.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Liquidacion.frm_CNS_Liquidacion" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">
    	
	<script type='text/javascript'>

	    $(document).ready(function () {
	        //Seta Calendarios
	        //fn_util_SeteaCalendario($('input[id*=txtFec]')[0]);
	    });
	</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    
    
						
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Liquidación Vehicular </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>										
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Liquidacion.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cancelar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Consultar Liquidación Vehicular</td>
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
							<legend>DATOS DEL SINIESTRO</legend>
                            <asp:HiddenField ID="hdnSiniestroId" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            												
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Siniestro
									</td>
									<td>
										<input id="txtNumSiniestro" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
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
										<input id="txtNumPoliza" type="text" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" size="50" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Vigencia
									</td>
									<td>
										<input id="txtInicio" type="text" size="8" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/> al 
										<input id="txtFin" type="text" size="8" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Cobertura
									</td>
									<td>
										<input id="txtMontoCobertura" type="text" class="css_input_inactivo"  ClientIDMode="Static" runat="server" readonly/>
									</td>												
								</tr>																												
							</table>
												
						</fieldset>
                        
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
										<textarea id="txtDescripcion" cols="100" rows="5" class="css_input_inactivo" style="background-color: #EEE;"  runat="server" ClientIDMode="Static" readonly></textarea>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Liquidación
									</td>
									<td>
										<input id="txtMontoLiquidacion" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
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

