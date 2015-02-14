<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_AGR_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Siniestro.frm_AGR_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>

        $(document).ready(function () {
            //Seta Calendarios
            //fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);
        });

        function fn_abreBsqPoliza() {
            fn_util_AbreModal("Búsqueda de Póliza", "../Comun/mdl_BSQ_Poliza.aspx", 900, 500, null);
        }

        function fn_abreBsqProcurador() {
            fn_util_AbreModal("Búsqueda de Procuradores", "../Comun/mdl_BSQ_Procurador.aspx", 900, 500, null);
        }

        function fn_GrabarSiniestro() {
            var sError = "";

            //Valida cada campo
            sHddCodPoliza = $("#hddCodPoliza").val();
            sHddCodProcurador = $("#hddCodProcurador").val();

            sTxtNumSiniestro = $("#txtNumSiniestro").val();
            sCmbTipoSiniestro = $("#cmbTipoSiniestro").val();
            sTxaDescripcion = $("#txaDescripcion").val();
            sTxtFechaSiniestro = $("#txtFechaSiniestro").val();
            sTxtLugar = $("#txtLugar").val();

            //alert(sHddCodPoliza+"-"+sHddCodProcurador+"-"+sHddCodProcurador+"-"+sTxtNumSiniestro+"-"+sCmbTipoSiniestro+"-"+sTxaDescripcion+"-"+sTxaDescripcion+"-"+sTxtFechaSiniestro+"-"+sTxtLugar);
           
            //Número Siniestro
            if (fn_util_trim(sTxtNumSiniestro) == "" || fn_util_trim(sTxtNumSiniestro) == "0") {
                sError = sError + "   - Debe ingresar un Número de Póliza. <br/>";
            }
            //Tipo Siniestro
            if (fn_util_trim(sCmbTipoSiniestro) == "" || fn_util_trim(sCmbTipoSiniestro) == "0") {
                sError = sError + "   - Debe seleccionar el Tipo de Siniestro. <br/>";
            }
            //Descripción
            if (fn_util_trim(sTxaDescripcion) == "") {
                sError = sError + "   - Debe ingresar una Descripción. <br/>";
            }
            //Fecha de Siniestro
            if (fn_util_trim(sTxtFechaSiniestro) == "") {
                sError = sError + "   - Debe ingresar una Fecha de Siniestro. <br/>";
            }
            //Lugar
            if (fn_util_trim(sTxtLugar) == "") {
                sError = sError + "   - Debe ingresar el Lugar. <br/>";
            }


            //Codigo de Póliza
            if (fn_util_trim(sHddCodPoliza) == "" || fn_util_trim(sHddCodPoliza) == "0") {
                sError = sError + "   - Debe seleccionar una Póliza. <br/>";
            }
            //Codigo de Procurador
            if (fn_util_trim(sHddCodProcurador) == "" || fn_util_trim(sHddCodProcurador) == "0") {
                sError = sError + "   - Debe seleccionar un Procurador. <br/>";
            }


            //Valida Final
            if (sError == "") {
                fn_mdl_confirma("¿Está seguro que desea guardar los cambios del Siniestro?",
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

    <asp:Button ID="btnGrabar" runat="server" Text="" OnClick="btnGrabar_Click" ClientIDMode="Static" Style="display: none;" />
    <asp:HiddenField ID="hddCodSiniestro" runat="server" ClientIDMode="Static" EnableViewState="false" />
    <asp:HiddenField ID="hddCodPoliza" runat="server" ClientIDMode="Static" EnableViewState="false" Value="" />
    <asp:HiddenField ID="hddCodProcurador" runat="server" ClientIDMode="Static" EnableViewState="false" Value="" />
        						
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
										<a href="javascript:fn_GrabarSiniestro();">
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
													<input id="txtNumSiniestro" type="text" class="" style="background-color: #EEE;" ClientIDMode="Static" runat="server" readonly/>
												</td>
											</tr>	
											<tr>												
												<td class="label">
													Tipo de Siniestro
												</td>
												<td>
													<select id="cmbTipoSiniestro"  runat="server" ClientIDMode="Static"/>
												</td>												
											</tr>	
											<tr>												
												<td class="label">
													Descripción
												</td>
												<td>
													<textarea id="txaDescripcion" cols="100" rows="5" runat="server" ClientIDMode="Static" ></textarea>
												</td>												
											</tr>	
											<tr>												
												<td class="label">
													Fecha de Siniestro
												</td>
												<td>
													<input id="txtFechaSiniestro" type="text" class="css_input_inactivo" size="8" runat="server" ClientIDMode="Static"  readonly/>
												</td>												
											</tr>
											<tr>
												<td class="label">
													Lugar
												</td>
												<td>
													<input id="txtLugar" type="text" class="" size="50" runat="server" ClientIDMode="Static" />
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
													<input id="txtNumPoliza" type="text" class="css_input_inactivo" readonly/>
													<input type="button" value="Consultar Póliza" class="css_btn_general" onclick="javascript: fn_abreBsqPoliza();" />
												</td>
											</tr>	
											<tr>
												<td class="label">
													Asegurado
												</td>
												<td>
													<input id="txtAsegurado" type="text" size="50" class="css_input_inactivo" readonly />
												</td>
											</tr>
											<tr>												
												<td class="label">
													Vigencia
												</td>
												<td>
													<input id="txtInicio" type="text" size="8" class="css_input_inactivo" readonly/> al 
													<input id="txtFin" type="text" size="8" class="css_input_inactivo" readonly/>
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
													<input id="txtCodProcurador" type="text" class="css_input_inactivo" readonly/>
													<input type="button" value="Consultar Procurador" class="css_btn_general" onclick="javascript: fn_abreBsqProcurador();" />
												</td>
											</tr>	
											<tr>
												<td class="label">
													Procurador
												</td>
												<td>
													<input id="txtNombreProcurador" type="text" size="50" class="css_input_inactivo" readonly/>
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

