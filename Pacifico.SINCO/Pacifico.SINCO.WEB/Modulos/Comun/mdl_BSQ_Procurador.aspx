<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Procurador.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Procurador" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">

	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Procurador </td>
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
			<td class="subModulo">Búsqueda de Procuradores</td>
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
								Código de Procurador
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
							<td class="label">
								Nombre de Procurador
							</td>
							<td>
								<input name="" type="text" class="" />
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
			<th>Código Procurador</th>						
			<th>Nombre Procurador</th>
			<th>Teléfono </th>
			<th>Estado Disponibilidad</th>			
		</tr>	
		<tr class="even">
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PC032</td>
			<td style="text-align:center;">Lucero Margot Perales Punk</td>
			<td>963 158 145</td>
			<td style="text-align:center;color:green;"> DISPONIBLE </td>						
		</tr>
		<tr class="even">
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PC018</td>
			<td style="text-align:center;">Pedro Luis Gallo Gallozo</td>
			<td>351 781 325</td>
			<td style="text-align:center;color:red;"> NO DISPONIBLE </td>						
		</tr>
	</table>

</asp:Content>