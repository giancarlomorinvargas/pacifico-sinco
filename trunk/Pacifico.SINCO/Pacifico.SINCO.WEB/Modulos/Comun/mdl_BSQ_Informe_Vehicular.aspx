<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Informe_Vehicular.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Informe_Vehicular" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Informe Vehicular </td>
			<td rowspan="2" class="botones">
				
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>		
						<td class="boton">
							<a href="#">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_dominio.jpg" border="0" /><br />
								Aceptar
							</a>
						</td>						
						<td class="boton">
							<a href="#">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="#">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cerrar
							</a>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr>
			<td class="subModulo">Búsqueda de Informe Vehicular</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
	
	
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
							<td class="label">
								Nro. Accidente Vehicular
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
							<td class="label">
								Asegurado
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>							
							<td class="label">
								Estado
							</td>
							<td>
								<select>
									<option> [SELECCIONAR] </option>
								</select>
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
	
	<table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		<tr>
			<th>_</th>
			<th>Número Accidente</th>			
			<th>Número Siniestro</th>
			<th>Asegurado</th>
			<th>Lugar del Siniestro</th>			
			<th>Estado</th>
		</tr>	
		<tr class="even">
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">AC-00154</td>			
			<td style="text-align:center;">SI-0005814</td>	
			<td style="text-align:center;">Fernando Gonzales Romero</td>
			<td style="text-align:center;">Carretera Central Km35</td>
			<td style="text-align:center;"> PENDIENTE </td>
		</tr>
		<tr>
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">AC-00154</td>			
			<td style="text-align:center;">SI-0003514</td>	
			<td style="text-align:center;">Pedro Luis Gallo</td>
			<td style="text-align:center;">Carretera Panamerica Sur Km75</td>
			<td style="text-align:center;"> PENDIENTE </td>
		</tr>
	</table>

</asp:Content>