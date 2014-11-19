<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_AGR_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Siniestro.frm_AGR_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_abreBsqPoliza() {
            fn_util_AbreModal("Búsqueda de Póliza", "../Comun/mdl_BSQ_Poliza.aspx", 900, 500, null);
        }
        function fn_abreBsqProcurador() {
            fn_util_AbreModal("Búsqueda de Procuradores", "../Comun/mdl_BSQ_Procurador.aspx", 900, 500, null);
        }
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">

    <!-- INICIO CUERPO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_cuerpo">
		<tr>					
			<td>
						
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
											<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
											Grabar
										</a>
									</td>											
									<td class="boton">
										<a href="javascript:window.location='frm_BSQ_Siniestro.aspx';">
											<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
											Cancelar
										</a>
									</td>											
								</tr>
							</table>
									
						</td>
					</tr>
					<tr>
						<td class="subModulo">Agregar Siniestro</td>
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
													<input name="" type="text" class="" style="background-color: #EEE;" />
												</td>
											</tr>	
											<tr>												
												<td class="label">
													Tipo de Siniestro
												</td>
												<td>
													<select>
														<option value="0"> [SELECCIONE] </option>
													</select>
												</td>												
											</tr>	
											<tr>												
												<td class="label">
													Descripción
												</td>
												<td>
													<textarea cols="100" rows="5" ></textarea>
												</td>												
											</tr>	
											<tr>												
												<td class="label">
													Fecha de Siniestro
												</td>
												<td>
													<input name="" type="text" class="" size="8" />
													<img src="<%=sUrl %>Util/images/calendario.gif">
												</td>												
											</tr>
											<tr>
												<td class="label">
													Lugar
												</td>
												<td>
													<input name="" type="text" class="" size="50" />
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
													<input name="" type="text" class="css_input_inactivo"/>
													<input type="button" value="Consultar Póliza" class="css_btn_general" onclick="javascript: fn_abreBsqPoliza();" />
												</td>
											</tr>	
											<tr>
												<td class="label">
													Asegurado
												</td>
												<td>
													<input name="" type="text" size="50" class="css_input_inactivo" />
												</td>
											</tr>
											<tr>												
												<td class="label">
													Vigencia
												</td>
												<td>
													<input name="" type="text" size="8" class="css_input_inactivo"/> al 
													<input name="" type="text" size="8" class="css_input_inactivo"/>
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
													<input name="" type="text" class="css_input_inactivo" size="5"/>
													<input type="button" value="Consultar Procurador" class="css_btn_general" onclick="javascript: fn_abreBsqProcurador();" />
												</td>
											</tr>	
											<tr>
												<td class="label">
													Procurador
												</td>
												<td>
													<input name="" type="text" size="50" class="css_input_inactivo" />
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
						
			</td>
		</tr>
	</table>			
			
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_cuerpoPie">
		<tr class="pie"><td class="left"></td><td></td><td class="right"></td></tr>
	</table>			
			<!-- FIN CUERPO-->
    
</asp:Content>

