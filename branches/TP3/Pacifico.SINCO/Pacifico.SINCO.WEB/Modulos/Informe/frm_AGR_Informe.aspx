<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_AGR_Informe.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Informe.frm_AGR_Informe" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">
    	
	<script type='text/javascript'>

	    $(document).ready(function () {
	        //Seta Calendarios
	        //fn_util_SeteaCalendario($('input[id*=txtFec]')[0]);
	    });
	    var objItemSeleccionado;

	    function fn_abreBsqSiniestro() {
	        fn_util_AbreModal("Consulta de Siniestro", "../Comun/mdl_BSQ_Siniestro.aspx", 900, 500, null);
	    }

	    function cargarSiniestro(json) {
	        console.log('cargando...', json);
	        $("#hdnSiniestroId").val(json.siniestroId);

	        $("#txtNumSiniestro").val(json.numSiniestro);
	        $("#txtTipoSiniestro").val(json.tipo);
	        $("#txtFecSiniestro").val(json.fechaSiniestro);

	        $("#txtLugar").val(json.lugar);
	        $("#txtNumPoliza").val(json.numPoliza);

	        $("#txtNumProcurador").val(json.numProcurador);
	        $("#txtProcurador").val(json.procurador)

	        $("#txtAsegurado").val(json.asegurado);

	        fn_util_CierraModal();
	    }


	    function fn_GrabarInforme() {
	        var sError = "";

	        //Valida cada campo
	        sHddCodSiniestro = $("#hdnSiniestroId").val();
	        console.log('sHddCodSiniestro', sHddCodSiniestro);


	        sTxtNumInforme = $("#txtNumInforme").val();
	        sTxtLugar = $("#txtDireccion").val();
	        sTxtDistrito = $("#cmbDistrito").val();
	        sTxtFechaInforme = $("#txtFecInforme").val();
            
	        //Codigo Informe Vehicular
	        if (fn_util_trim(sHddCodSiniestro) == "" || fn_util_trim(sHddCodSiniestro) == "0") {
	            sError = sError + "   - Debe seleccionar un Siniestro. <br/>";
	        }

	        //Número Siniestro
	        if (fn_util_trim(sTxtNumInforme) == "" || fn_util_trim(sTxtNumInforme) == "0") {
	            sError = sError + "   - Debe ingresar el Número de Informe. <br/>";
	        }

	        if (fn_util_trim(sTxtFechaInforme) == "") {
	            sError = sError + "   - Debe ingresar la Fecha de Informe. <br/>";
	        }

	        if (fn_util_trim(sTxtLugar) == "" || fn_util_trim(sTxtLugar) == "0") {
	            sError = sError + "   - Debe ingresar La Descripción del Accidente. <br/>";
	        }

	        if (fn_util_trim(sTxtDistrito) == "" || fn_util_trim(sTxtDistrito) == "0") {
	            sError = sError + "   - Debe seleccionar un Distrito. <br/>";
	        }


	        //Valida Final
	        if (sError == "") {
	            fn_mdl_confirma("¿Está seguro que desea guardar los cambios del Informe?",
                                function () {
                                    $("#btnGrabar").click();
                                },
                                null,
                                null,
                                "CONFIRMACIÓN"
                                );
	        } else {
	            fn_mdl_alert(sError, null, "VALIDACIONES");
	        }

	    }
	</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    
    <asp:Button ID="btnGrabar" runat="server" Text="" OnClientClick="" OnClick="btnGrabar_Click" ClientIDMode="Static" Style="display: none;" />
    
						
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Informe de Accidente Vehicular </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:fn_GrabarInforme();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
								Grabar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Informe.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cancelar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Agregar Informe de Accidente Vehicular</td>
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
                            <asp:HiddenField ID="hdnSiniestroId" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Informe
									</td>
									<td>
										<input id="txtNumInforme" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly/>
										
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Descripción del Accidente
									</td>
									<td>
										<textarea id="txtDireccion" cols="100" rows="5"  ClientIDMode="Static" runat="server" />
									</td>
								</tr>
								<tr>												
									<td class="label">
										Distrito
									</td>
									<td>
										<select id="cmbDistrito"  ClientIDMode="Static" runat="server" />
									</td>												
								</tr>
								<tr>
									<td class="label" style="width:120px;">
										Fecha de Siniestro
									</td>
									<td>
                                        <input id="txtFecInforme" type="text" class="css_frm_inactivo" size="8" ClientIDMode="Static" runat="server" readonly/>
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
                                        <input id="btnConsultarSiniestro" type="button" value="Consultar Siniestro" class="css_btn_general" onclick="javascript: fn_abreBsqSiniestro();" />
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
										<input id="txtAsegurado" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly/>
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

