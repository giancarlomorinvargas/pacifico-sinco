<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_CNS_Informe.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Informe.frm_CNS_Informe" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

	<script type='text/javascript'>

	    $(document).ready(function () {
	        console.log('onload');
	        //Seta Calendarios
	        //fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);

	    });

	</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    
				<!-- INCIO TITULO-->
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
					<tr>
						<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
						<td class="modulo"> Informe de Accidente Vehicular </td>
						<td rowspan="2" class="botones">
									
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
								<tr>
									<td>&nbsp;</td>
									<!--<td class="boton">
										<a href="javascript:fn_GrabarInforme();">
											<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
											Grabar
										</a>
									</td>	-->										
									<td class="boton">
										<a href="javascript:window.location='frm_BSQ_Informe.aspx';">
											<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
											Cerrar
										</a>
									</td>											
								</tr>
							</table>
									
						</td>
					</tr>
					<tr>
						<td class="subModulo">Consultar Informe de Accidente Vehicular</td>
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
							<legend>DATOS DEL INFORME DE ACCIDENTE VEHICULAR</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Informe
									</td>
									<td>
										<input id="txtNumInforme" type="text" class="css_frm_inactivo"  ClientIDMode="Static" runat="server" readonly />
										
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Descripción del Accidente
									</td>
									<td>                                        
										<textarea id="txtDireccion" cols="100" rows="5" runat="server" style="background-color: #EEE;" readonly="readonly" ></textarea>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Distrito
									</td>
									<td>
										<input id="txtDistrito" type="text" class="css_frm_inactivo"   ClientIDMode="Static" runat="server" readonly disabled/>
									</td>												
								</tr>
								<tr>
									<td class="label" style="width:120px;">
										Fecha de Informe
									</td>
									<td>
                                        <input id="txtFecInforme" type="text" class="css_frm_inactivo"  size="8" ClientIDMode="Static" runat="server" readonly disabled/>
									</td>
								</tr>																									
							</table>

						</fieldset>
											
						<fieldset>
							<legend>DATOS DEL SINIESTRO</legend>
												
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
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" class="css_frm_inactivo" size="8" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
							</table>																								
						</fieldset>

						<fieldset>
							<legend>DATOS DEL PROCURADOR</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Código del Procurador
									</td>
									<td>
										<input id="txtNumProcurador" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Nombres y Apellidos del Procurador
									</td>
									<td>
										<input id="txtProcurador" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
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

