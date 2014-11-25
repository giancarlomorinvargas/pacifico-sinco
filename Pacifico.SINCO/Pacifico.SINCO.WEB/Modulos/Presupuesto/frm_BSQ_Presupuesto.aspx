<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_BSQ_Presupuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Presupuesto.frm_BSQ_Presupuesto" %>

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
							<a href="javascript:window.location='frm_AGR_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_nuevo.jpg" border="0" /><br />
								Agregar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_MOD_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_editar.jpg" border="0" /><br />
								Modificar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:window.location='frm_CNS_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_informes.jpg" border="0" /><br />
								Consultar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:window.location='../Principal.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_inicio.jpg" border="0" /><br />
								Inicio
							</a>
						</td>
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Mantenimiento de Presupuestos</td>
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
							<td class="label" style="width:120px;">
								Nro. de Presupuesto
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Nro. de Accidente Vehicular
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>												
						</tr>	
						<tr>												
							<td class="label">
								Nro. de Póliza
							</td>
							<td>
								<input name="" type="text" class="" />
							</td>
							<td>&nbsp;</td>
							<td class="label" style="width:120px;">
								Fecha
							</td>
							<td>
								<input name="" type="text" class="" size="8" />
								<img src="<%=sUrl %>Util/images/calendario.gif">
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
			<th>Nro. Presupuesto</th>
			<th>Nro. Accidente Vehicular</th>
			<th>Nro. de Poliza</th>
			<th>Asegurado</th>
			<th>Fecha</th>								
			<th>Estado de Presupuesto</th>
		</tr>	
		<tr class="even">
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PR-000324</td>
			<td style="text-align:center;">AV-00254</td>
			<td style="text-align:center;">PS-32000025</td>
			<td>Fernando Gonzales Romero</td>
			<td style="text-align:center;">15/09/2014</td>								
			<td style="text-align:center;color:red;">Pendiente</td>
		</tr>
		<tr>
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">PR-000743</td>
			<td style="text-align:center;">AV-00741</td>
			<td style="text-align:center;">PS-32000054</td>
			<td>Alicia Delgado Marroquin</td>
			<td style="text-align:center;">25/09/2014</td>								
			<td style="text-align:center;color:red;">Pendiente</td>
		</tr>
		<tr>
			<td><input type="checkbox"/></td>
			<td style="text-align:center;">S0000245</td>
			<td style="text-align:center;">AV-00981</td>
			<td style="text-align:center;">PS-13000083</td>
			<td>Reimond Manco Ramirez</td>
			<td style="text-align:center;">01/10/2014</td>								
			<td style="text-align:center;color:red;">Pendiente</td>
		</tr>
	</table>


</asp:Content>

