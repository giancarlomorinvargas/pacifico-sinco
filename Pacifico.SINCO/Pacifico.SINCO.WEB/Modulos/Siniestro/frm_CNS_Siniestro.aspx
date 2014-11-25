<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_CNS_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Siniestro.frm_CNS_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Siniestros </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Siniestro.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cerrar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Consultar Siniestro</td>
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
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Siniestro
									</td>
									<td>
										<input name="" value="S0000324" type="text" class="css_frm_inactivo" />
									</td>
								</tr>	
								<tr>												
									<td class="label">
										Tipo de Siniestro
									</td>
									<td>
										<select  class="css_frm_inactivo">
											<option value="0"> Accidente Vehicular </option>
										</select>
									</td>												
								</tr>	
								<tr>												
									<td class="label">
										Descripción
									</td>
									<td>
										<textarea class="css_frm_inactivo" cols="100" rows="5" >El accidente sucedió en la altura del kilomentro 34 de la panamericana Sur. Fue contra una camionetaNissan debido a una inperfección en la via.</textarea>
									</td>												
								</tr>	
								<tr>												
									<td class="label">
										Fecha de Siniestro
									</td>
									<td>
										<input name="" type="text" size="8" value="15/09/2014" class="css_frm_inactivo" />															
									</td>												
								</tr>
								<tr>
									<td class="label">
										Lugar
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" size="50" value="LIMA - Panamericana SUR Km34" />
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
										<input name="" type="text" value="PS-32000025" class="css_input_inactivo"/>															
									</td>
								</tr>	
								<tr>
									<td class="label">
										Asegurado
									</td>
									<td>
										<input name="" type="text" size="50" value="Fernando Gonzales Romero" class="css_input_inactivo" />
									</td>
								</tr>
								<tr>												
									<td class="label">
										Vigencia
									</td>
									<td>
										<input name="" type="text" size="8" value="10/10/2013" class="css_input_inactivo"/> al 
										<input name="" type="text" size="8" value="10/10/2015" class="css_input_inactivo"/>
									</td>												
								</tr>																											
							</table>
												
						</fieldset>
											
						<fieldset>
							<legend>DATOS DEL PROCURADOR</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Código de Procurador
									</td>
									<td>
										<input name="" type="text" class="css_input_inactivo" value="PC032" size="5"/>																
									</td>
								</tr>	
								<tr>
									<td class="label">
										Procurador
									</td>
									<td>
										<input name="" type="text" size="50" value="Samuel Torrealva Villanueva" class="css_input_inactivo" />
									</td>
								</tr>																																						
							</table>
												
						</fieldset>
										
					</td></tr></table>
										
										
													
				</div>
									
			</td>
			<td class="right"></td>												
		</tr>
		<tr class="pie"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
	</table>	
	<!-- FIN PANEL-->
		
</asp:Content>

