<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_REG_APR_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Siniestro.Apertura.frm_REG_APR_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        $(document).ready(function () {
            //Seta Calendarios
            //fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);
        });
        
        function fn_abreBsqTecnico() {
            fn_util_AbreModal("Consultar Disponibilidad Técnico", "../../Comun/mdl_BSQ_Tecnico.aspx", 900, 500, null);
        }
        function fn_GrabarSiniestro() {
            var sError = "";

            //Valida cada campo
            sHddTecnicoId = $("#hddTecnicoId").val();


            //Codigo de Procurador
            if (fn_util_trim(sHddTecnicoId) == "" || fn_util_trim(sHddTecnicoId) == "0") {
                sError = sError + "   - Debe seleccionar un Tecnico. <br/>";
            }


            //Valida Final
            if (sError == "") {
                fn_mdl_confirma("¿Está seguro que desea realizar la asignación del Técnico?",
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


        function cargarTecnico(json) {
            console.log('cargando...', json);
            $("#hddTecnicoId").val(json.tecnicoId);

            $("#txtCodigoTecnico").val(json.numTecnico);
            $("#txtTecnico").val(json.tecnico);

            $("#txtTaller").val(json.taller);

            fn_util_CierraModal();
        }

    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">

	<asp:Button ID="btnGrabar" runat="server" Text="" OnClick="btnGrabar_Click" ClientIDMode="Static" Style="display: none;" />
    <asp:HiddenField ID="hddCodSiniestro" runat="server" ClientIDMode="Static" EnableViewState="false" />
    <asp:HiddenField ID="hddCodPoliza" runat="server" ClientIDMode="Static" EnableViewState="false" />
    <asp:HiddenField ID="hddCodProcurador" runat="server" ClientIDMode="Static" EnableViewState="false" />
    
    <asp:HiddenField ID="hddTecnicoId" runat="server" ClientIDMode="Static" EnableViewState="false" />

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
		    <td class="subModulo">Registrar la asignación del Técnico</td>
	    </tr>
    </table>
    <!-- FIN TITULO-->
						
    <asp:HiddenField ID="UsuarioRegistro" runat="server" ClientIDMode="Static" EnableViewState="false" />
    <asp:HiddenField ID="FechaRegistro" runat="server" ClientIDMode="Static" EnableViewState="false" />
						
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
										<input id="txtNumSiniestro" type="text" class="css_input_inactivo" style="background-color: #EEE;" runat="server" readonly="readonly" ClientIDMode="Static" />
									</td>
								</tr>	
								<tr>												
									<td class="label">
										Tipo de Siniestro
									</td>
									<td>
										<input id="txtTipoSiniestro" type="text" class="css_input_inactivo"  runat="server" ClientIDMode="Static" readonly="readonly"/>
									</td>												
								</tr>	
								<tr>												
									<td class="label">
										Descripción
									</td>
									<td>
										<textarea id="txaDescripcion" cols="100" rows="5" runat="server"  readonly="readonly" class="css_input_inactivo" style="background-color: #EEE;"></textarea>
									</td>												
								</tr>	
								<tr>												
									<td class="label">
										Fecha de Siniestro
									</td>
									<td>
										<input id="txtFechaSiniestro" type="text" class="css_input_inactivo" size="8" runat="server"  readonly="readonly" />										
									</td>												
								</tr>
								<tr>
									<td class="label">
										Lugar
									</td>
									<td>
										<input id="txtLugar" type="text"  size="50" runat="server"  readonly="readonly" class="css_input_inactivo"/>
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
										<input id="txtNumPoliza" type="text" class="css_input_inactivo" runat="server" readonly="readonly"/>										
									</td>
								</tr>	
								<tr>
									<td class="label">
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" size="50" class="css_input_inactivo" runat="server" readonly="readonly" />
									</td>
								</tr>
								<tr>												
									<td class="label">
										Vigencia
									</td>
									<td>
										<input id="txtInicio" type="text" size="8" class="css_input_inactivo" runat="server" readonly="readonly"/> al 
										<input id="txtFin" type="text" size="8" class="css_input_inactivo" runat="server" readonly="readonly"/>
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
										<input id="txtCodProcurador" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Nombres y Apellidos del Procurador
									</td>
									<td>
										<input id="txtNombreProcurador" type="text" size="50" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly="readonly" />
									</td>
								</tr>																																						
							</table>
												
						</fieldset>
										
						<fieldset>
							<legend>DATOS DEL TECNICO</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Código de Técnico
									</td>
									<td>
										<input id="txtCodigoTecnico" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
										<input type="btnConsultarTecnico" value="Consultar Técnico" class="css_btn_general" onclick="javascript: fn_abreBsqTecnico();" />
									</td>
								</tr>	
								<tr>
									<td class="label">
										Nombre del Técnico
									</td>
									<td>
										<input id="txtTecnico" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
									</td>
								</tr>	
								<tr>
									<td class="label">
										Taller
									</td>
									<td>
										<input id="txtTaller" type="text" class="css_input_inactivo" ClientIDMode="Static" runat="server" readonly="readonly"/>
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

