<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Pacifico.SINCO.WEB.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

	<title>SINCO :: Sistema de Siniestros y Conciliaciones</title>
	<link rel="SHORTCUT ICON" href="Util/images/PV16x16.ico" />
	
	<script type='text/javascript' src="Util/js/jquery/jquery-1.6.2.min.js"> </script>
	<script type='text/javascript' src="Util/js/jquery/jquery-ui-1.8.13.custom.min.js"> </script>
	<script type='text/javascript' src="Util/js/js_util.modal.js"> </script>
	<script type='text/javascript' src="Util/js/js_util.funcion.js"> </script>	
	<script type='text/javascript' src="Util/js/js_util.date.js"> </script>		

    <link type="text/css" rel="stylesheet" href="Util/css/jquery/jquery-ui-1.8.15.custom.css" />					
	<link type="text/css" rel="stylesheet" href="Util/css/css_global.css" />
	<link type="text/css" rel="stylesheet" href="Util/css/css_formulario.css" />
	<link type="text/css" rel="stylesheet" href="Util/css/css_fuente.css" />
	<link type="text/css" rel="stylesheet" href="Util/css/css_tema.css" />
	<link type="text/css" rel="stylesheet" href="Util/css/css_tema_A.css" />	
	
	<script type='text/javascript' src="index.js"> </script>
	
</head>

<body class="css_body_sistema">

<form id="frmLogin" style="height: 100%" runat="server">

<table width="450px" border="0" cellpadding="0" cellspacing="0" class="css_body_contenedorLogin" align="center">
	<tr>
		<td>
			
			
			<!-- INICIO CABECERA-->
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_cabecera_table">
				<tr>
					<td class="left">&nbsp;
						
					</td>
					<td class="cuerpo">
						
						<table width="100%" border="0"cellpadding="0" cellspacing="0" > 
							<tr>
								<td align="left">
									<img src="Util/images/img_logo.jpg" border="0" />
								</td>								
							</tr>							
						</table>
												
					</td>
					<td class="right">&nbsp;
						
					</td>
				</tr>
			</table>			
			<!-- FIN CABECERA-->		
			
			
			<!-- INICIO LINEA-->
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_lineaCabecera">
				<tr>
					<td></td>					
				</tr>
			</table>			
			<!-- FIN LINEA-->	
			
					
			<!-- INICIO CUERPO-->
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_cuerpo">
				<tr>					
					<td>
						
									
									
						<div class="css_lbl_tituloModal" style="text-align:right;">Ingreso al Sistema</div>
						<div class="css_tb_cuerpoPanel">
									
							<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_formPanel">
								<tr>
									<td rowspan="3" width="140px" align="center">
										<img src="Util/images/img_login.jpg" />
									</td>												
									<td valign="bottom">
													
										<table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_tb_formPanel">
											<tr>
												<td style="width:60px;font-weight:bold;text-align:right;">
													Usuario
												</td>
												<td>
													<input name="" type="text" />
												</td>
											</tr>
											<tr>
												<td style="width:60px;font-weight:bold;text-align:right;">
													Clave
												</td>
												<td>
													<input name="" type="text" />
												</td>
											</tr>
											<tr>
												<td colspan="2" align="right" style="padding-right:10px;height:40px;">
													<input name="" type="button" value="Ingresar" class="css_btn_login" onclick="javascript: $('#btnLogin').click();" />
                                                    <asp:Button ID="btnLogin" runat="server" Text="" OnClick="btnAyuda_Click" ClientIDMode="Static" Style="display: none;" />
												</td>
											</tr>
										</table>
													
									</td>
												
								</tr>											
							</table>
									
						</div>
									
						
					</td>
				</tr>
			</table>			
			<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tema_cuerpoPie">
				<tr class="pie"><td class="left"></td><td></td><td class="right"></td></tr>
			</table>			
			<!-- FIN CUERPO-->	
			
			<div class="css_lbl_pie">
				Copyright © 2014 Pacifico Seguros, inc. Todos los derechos reservados. 
			</div>
	
			
									
		</td>
	</tr>	

</table>
    
</form>

</body>
</html>
