<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_AGR_Liquidacion.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Liquidacion.frm_AGR_Liquidacion" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">
    	
	<script type='text/javascript'>

	    $(document).ready(function () {
	        //Seta Calendarios
	        //fn_util_SeteaCalendario($('input[id*=txtFec]')[0]);
	    });
	    var objItemSeleccionado;

	    function fn_abreBsqSiniestro() {
	        fn_util_AbreModal("Consulta de Siniestro", "../Comun/mdl_BSQ_Siniestro_Asistido.aspx", 900, 500, null);
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


	        $("#txtInicio").val(json.fechaInicio);
	        $("#txtFin").val(json.fechaFin);
	        $("#txtMontoCobertura").val(json.montoCobertura);


	        fn_util_CierraModal();
	    }


	    function fn_Grabar() {
	        var sError = "";

	        //Valida cada campo
	        sHddCodSiniestro = $("#hdnSiniestroId").val();
	        console.log('sHddCodSiniestro', sHddCodSiniestro);


	        sTxtNumLiquidacion = $("#txtNumLiquidacion").val();
	        sTxtFechaLiquidacion = $("#txtFechaLiquidacion").val();
	        sTxtDescripcion = $("#txtDescripcion").val();
	        sTxtMontoLiquidacion = $("#txtMontoLiquidacion").val();

	        sTxtMontoCobertura = $("#txtMontoCobertura").val();
            
	        //Codigo Informe Vehicular
	        if (fn_util_trim(sHddCodSiniestro) == "" || fn_util_trim(sHddCodSiniestro) == "0") {
	            sError = sError + "   - Debe seleccionar un Siniestro. <br/>";
	        }

	        if (fn_util_trim(sTxtDescripcion) == "" || fn_util_trim(sTxtDescripcion) == "0") {
	            sError = sError + "   - Debe ingresar la descripción de liquidación. <br/>";
	        }

	        if (fn_util_trim(sTxtMontoLiquidacion) == "" || fn_util_trim(sTxtMontoLiquidacion) == "0") {
	            sError = sError + "   - Debe ingresar el monto de liquidación. <br/>";
	        }

	        if (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d{1,2})?$/.test(sTxtMontoLiquidacion)) {
	            sError = sError + "   - Debe ingresar el un monto válido para la liquidación. <br/>";
	        }

	        if (parseFloat(sTxtMontoLiquidacion) > parseFloat(sTxtMontoCobertura)) {
	            sError = sError + "   - El monto de la Liquidación no puede exceder al monto de cobertura de la Póliza. <br/>";
	        }


	        //Valida Final
	        if (sError == "") {
	            fn_mdl_confirma("¿Está seguro que desea guardar los cambios de la Liquidación?",
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
			<td class="modulo"> Liquidación Vehicular </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:fn_Grabar();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
								Grabar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Liquidacion.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cancelar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Registrar Liquidación</td>
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
                            <asp:HiddenField ID="hdnSiniestroId" runat="server" ClientIDMode="Static" EnableViewState="false" />
                            												
												
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
										Lugar
									</td>
									<td>
										<input id="txtLugar" type="text" class="css_frm_inactivo" ClientIDMode="Static" runat="server" readonly/>
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
										<input id="txtNumPoliza" type="text" class="css_input_inactivo"/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" size="50" class="css_input_inactivo" />
									</td>
								</tr>
								<tr>												
									<td class="label">
										Vigencia
									</td>
									<td>
										<input id="txtInicio" type="text" size="8" class="css_input_inactivo"/> al 
										<input id="txtFin" type="text" size="8" class="css_input_inactivo"/>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Cobertura
									</td>
									<td>
										<input id="txtMontoCobertura" type="text" class="css_input_inactivo"/>
									</td>												
								</tr>																												
							</table>
												
						</fieldset>
                        
						<fieldset>
							<legend>DATOS DE LIQUIDACIÓN</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número Liquidación
									</td>
									<td>
										<input id="txtNumLiquidacion" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Fecha Liquidación
									</td>
									<td>
										<input id="txtFechaLiquidacion" type="text" size="50" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly/>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Descripción
									</td>
									<td>
										<textarea id="txtDescripcion" cols="100" rows="5" runat="server" ClientIDMode="Static" ></textarea>
									</td>												
								</tr>
								<tr>												
									<td class="label">
										Monto Liquidación
									</td>
									<td>
										<input id="txtMontoLiquidacion" type="text" ClientIDMode="Static" runat="server" />
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

