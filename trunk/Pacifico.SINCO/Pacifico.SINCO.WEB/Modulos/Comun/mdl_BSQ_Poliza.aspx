<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Poliza.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Poliza" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Pólizas </td>
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
			<td class="subModulo">Búsqueda de Pólizas</td>
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
								Número de Póliza
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
							<td class="label">
								Número de Placa Vehículo
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
						</tr>											
						<tr>
							<td class="label">
								DNI Asegurado
							</td>
							<td>
								<input name="" type="text" class="" size="9" />
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
			<th>Número de Póliza</th>			
			<th>Asegurado</th>
			<th>Marca vehículo</th>
			<th>Modelo vehículo </th>
			<th>Placa vehículo</th>
			<th>Estado Poliza</th>
		</tr>	
		<tr class="even">
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PS-32000025</td>			
			<td>Fernando Gonzales Romero</td>
			<td style="text-align:center;">Nissan</td>
			<td style="text-align:center;">Sentra 2.0</td>
			<td style="text-align:center;">CGP-963</td>
			<td style="text-align:center;color:green;">ACTIVO</td>
		</tr>
		<tr>
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PS-32000036</td>			
			<td>Fernando Gonzales Romero</td>
			<td style="text-align:center;">KIA</td>
			<td style="text-align:center;">Sportage 4WD</td>
			<td style="text-align:center;">IJR-471</td>
			<td style="text-align:center;color:red;">INACTIVO</td>
		</tr>
	</table>
				
</asp:Content>
