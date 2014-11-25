<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_CNS_Presupuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Presupuesto.frm_CNS_Presupuesto" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Presupuestos </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cerrar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Consultar Presupuestos</td>
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
							<legend>DATOS DEL ACCIDENTE VEHICULAR</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Accidente Vehicular
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" value="AV-00254" />													
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Número de Siniestro
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" value="SI-000135" />
									</td>
								</tr>
								<tr>												
									<td class="label">
										Tipo de Siniestro
									</td>
									<td>
										<select class="css_frm_inactivo">
											<option value="0"> ACCIDENTE VEHICULAR </option>
										</select>
									</td>												
								</tr>
								<tr>
									<td class="label" style="width:120px;">
										Fecha de Siniestro
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" size="8" value="15/10/2014" />															
									</td>
								</tr>
								<tr>
									<td class="label" style="width: 120px;">
										Lugar
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" size="50" value="LIMA - Panamericana SUR Km34" />
									</td>
								</tr>														
								<tr>
									<td class="label" style="width: 120px;">
										Número de Póliza
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" size="10" value="PS-32000025" />
									</td>
								</tr>														
								<tr>
									<td class="label" style="width: 120px;">
										Asegurado
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" size="50" value="Fernando Gonzales Romero" />
									</td>
								</tr>																											
							</table>
												
						</fieldset>
											
						<fieldset>
							<legend>DATOS DEL PRESUPUESTO</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Presupuesto
									</td>
									<td>
										<input name="" type="text" class="css_frm_inactivo" value="AV-00254" />
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Fecha
									</td>
									<td>
										<input name="" type="text" value="" size="10" />
									</td>
								</tr>
							</table>
																								
						</fieldset>
											
						<fieldset>
							<legend>DETALLE DEL PRESUPUESTO</legend>
												
							<table width="700px" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
								<tr>
									<th style="width: 30px;">_</th>
									<th style="width: 100px;">Código</th>
									<th style="width: 450px;">Descripción</th>
									<th style="width: 120px;">Precio Unidad (S/.)</th>														
								</tr>
								<tr class="even">
									<td><input type="checkbox"/></td>
									<td style="text-align:center;">PT_001487</td>
									<td style="text-align:left;">Faros delanteros Kia Sportage 2013</td>
									<td style="text-align:center;"> 1 500.00 </td>														
								</tr>
								<tr class="even">
									<td><input type="checkbox"/></td>
									<td style="text-align:center;">PT_009872</td>
									<td style="text-align:left;">Parachoque delantero Kia Sportage 2013</td>
									<td style="text-align:center;"> 2 350.00 </td>														
								</tr>
							</table>
												
							<table width="700px" border="0" cellpadding="3" cellspacing="0">
								<tr>
									<td style="width: 480px; height:22px;">&nbsp;</td>																						
									<td style="text-align:right;width: 100px;"><strong>SUBTOTAL</strong></td>
									<th style="width: 120px; font-weight:normal;border-bottom:1px solid #D4D0C8;">3 850.00</th>														
								</tr>
								<tr>
									<td style="height:22px;">&nbsp;</td>																						
									<td style="text-align:right;"><strong>IGV</strong></td>
									<th style="font-weight:normal;">&nbsp;&nbsp;&nbsp;693.00</th>														
								</tr>
								<tr>
									<td style="height:22px;">&nbsp;</td>																						
									<td style="text-align:right;"><strong>TOTAL</strong></td>
									<th style="background-color:#F8F8F8; border-top:2px solid #FD9A00;"> 4 543.00</th>														
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

