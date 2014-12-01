<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_AGR_Presupuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Presupuesto.frm_AGR_Presupuesto" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">
    	
	<script type='text/javascript'>

	    var prefixServer = 'cphCuerpo_';
	    $(document).ready(function () {
	        //Seta Calendarios
	        fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);
	    });
	    function fn_abreBsqInformeVehicular() {
	        fn_util_AbreModal("Consulta de Informe Vehicular", "../Comun/mdl_BSQ_Informe_Vehicular.aspx", 900, 500, null);
	    }

	    function cargarInforme(json) {
	        console.log('cargando...', json);
	        $("#hdnInformeAccidenteId").val(json.informeAccidenteId);

	        $("#txtNumInforme").val(json.numInforme);
	        $("#txtNumSiniestro").val(json.numSiniestro);

	        $("#cmbTipoSiniestro").find("option[value='" + json.tipo + "']").attr({selected:true});
	        $("#txtFecSiniestro").val(json.fechaSiniestro);

	        $("#txtLugar").val(json.lugar);
	        $("#txtNumPoliza").val(json.numPoliza);

	        $("#txtAsegurado").val(json.asegurado);

	        $("#hdnMarcaId").val(json.marcaId);
	        $("#hdnModeloId").val(json.modeloId);

	        fn_util_CierraModal();
	    }

	    function fn_abreBsqRepuestos() {
	        $("#lblDetalleError").empty();
	        var marcaId = $("#hdnMarcaId").val();
	        var modeloId = $("#hdnModeloId").val();

	        if (!marcaId || !modeloId) {
	            $("#lblDetalleError").append("Se requiere consultar Informe Accidente Vehicular");
	        } else {
	            fn_util_AbreModal("Búsqueda de Repuestos", "../Comun/mdl_BSQ_Repuesto.aspx?marcaId=" + marcaId + "&modeloId=" + modeloId, 900, 500, null);
	        }
	    }

	    function cargarListaPrecio(json) {
	        console.log('cargando...', json);

	        var table = $("#tblDetalle");

	        var detalle = $("#rowDetalle").find("tbody tr").clone();

	        detalle.find("#lblListaPrecioId").append(json.listaPrecioId);
	        detalle.find("#lblDescripcion").append(json.descripcion);
	        detalle.find("#lblPrecio").append(json.precio);

	        table.find("tbody").append(detalle);

	        detalle.find("#lnkEliminar").click(function () {
	            detalle.remove();
	            calcularTotalesDetalle();
	        });

	        calcularTotalesDetalle();

	        fn_util_CierraModal();

	    }

	    function calcularTotalesDetalle() {
	        var SubTotal = 0;
	        var Igv = 0;
	        var Total = 0;

	        var PesoTotal = 0;
	        var ImporteTotal = 0;
	        $("#tblDetalle tbody tr").map(function (index, elem) {
	            var precio = $(this).find('#lblPrecio').text();
	            if (precio && precio != '') {
	                Total += parseFloat(precio);
	            }
	        });

	        SubTotal = (Total / 1.18).toFixed(2);
	        Igv = (Total - SubTotal).toFixed(2);

	        $("#" + prefixServer + "txtSubTotal").val(SubTotal);
	        $("#" + prefixServer + "txtIGV").val(Igv);
	        $("#" + prefixServer + "txtTotal").val(Total);
	    }

	    function cargarDetallePresupuesto() {
	        var detallePresupuesto = {};
	        var listDetalle = [];

	        var isValid = true;
	        $("#lblDetalleError").empty();
	        $("#tblDetalle .inputValue").removeClass("input-validation-error");

	        $("#tblDetalle tbody tr").map(function (index, elem) {
	            if (isValid) {

	                var detalle = {};

	                $('.inputValue', this).each(function () {
	                    var k = $(this).data("name");
	                    var v = $(this).val() || $(this).text();
	                    var val = $(this).data("val");
	                    var val_dec = $(this).data("val-decimal");
	                    var val_range = $(this).data("val-range");
	                    var val_range_min = $(this).data("val-range-min");

	                    if (isValid && val && val_dec && (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(v) || v <= val_range_min)) {
	                        $(this).addClass("input-validation-error");
	                        $("#lblDetalleError").append(val_range);
	                        isValid = false;
	                    } else if (isValid && val && !val_dec && (!/^\d+$/.test(v) || v <= val_range_min)) {
	                        $(this).addClass("input-validation-error");
	                        $("#lblDetalleError").append(val_range);
	                        isValid = false;
	                    } else if (isValid) {

	                        if (v && v != '') {
	                            detalle[k] = v;
	                        }
	                    }
	                    console.log('k', k, 'v', v, 'valid', isValid, 'detalle', detalle);
	                });

	                if (isValid) {
	                    listDetalle.push(detalle);
	                }
	                console.log('listDetalle', listDetalle);
	            }
	        });

	        if (isValid) {
	            detallePresupuesto["DetallePresupuesto"] = listDetalle;
	            console.log("detallePresupuesto", detallePresupuesto);
	            $("#cphCuerpo_txtDetalle").val(JSON.stringify(detallePresupuesto));
	            console.log('detalle json', $("#cphCuerpo_txtDetalle").val());
	        }
	        return isValid;
	    }

	    function fn_GrabarPresupuesto() {
	        $("#btnGrabar").click();
	    }
	</script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    
    <asp:Button ID="btnGrabar" runat="server" Text="" OnClientClick="return cargarDetallePresupuesto();" OnClick="btnGrabar_Click" ClientIDMode="Static" Style="display: none;" />
    <asp:HiddenField ID="hdnInformeAccidenteId" runat="server" ClientIDMode="Static" EnableViewState="false" />
						
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
							<a href="javascript:fn_GrabarPresupuesto();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_grabar.jpg" border="0" /><br />
								Grabar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:window.location='frm_BSQ_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cancelar
							</a>
						</td>											
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Agregar Presupuestos</td>
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
							<legend>DATOS DEL ACCIDENTE VEHICULAR</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Accidente Vehicular
									</td>
									<td>
										<input id="txtNumInforme" type="text" class="css_frm_inactivo" readonly />
										<input type="button" value="Consultar" class="css_btn_general" onclick="javascript: fn_abreBsqInformeVehicular();" />
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Número de Siniestro
									</td>
									<td>
										<input id="txtNumSiniestro" type="text" class="css_frm_inactivo" readonly/>
									</td>
								</tr>
								<tr>												
									<td class="label">
										Tipo de Siniestro
									</td>
									<td>
										<select id="cmbTipoSiniestro" class="css_frm_inactivo" runat="server" readonly/>
									</td>												
								</tr>
								<tr>
									<td class="label" style="width:120px;">
										Fecha de Siniestro
									</td>
									<td>
										<input id="txtFecSiniestro" type="text" class="css_frm_inactivo" readonly/>
									</td>
								</tr>
								<tr>
									<td class="label" style="width: 120px;">
										Lugar
									</td>
									<td>
										<input id="txtLugar" type="text" class="css_frm_inactivo" readonly/>
									</td>
								</tr>														
								<tr>
									<td class="label" style="width: 120px;">
										Número de Póliza
									</td>
									<td>
										<input id="txtNumPoliza" type="text" class="css_frm_inactivo" readonly/>
									</td>
								</tr>														
								<tr>
									<td class="label" style="width: 120px;">
										Asegurado
									</td>
									<td>
										<input id="txtAsegurado" type="text" class="css_frm_inactivo" readonly/>
									</td>
								</tr>																											
							</table>
											
                            <input id="hdnMarcaId" type="hidden" />
        
                            <input id="hdnModeloId" type="hidden"  />	
						</fieldset>
											
						<fieldset>
							<legend>DATOS DEL PRESUPUESTO</legend>
												
							<table border="0" cellpadding="5" cellspacing="0">
								<tr>
									<td class="label" style="width: 120px;">
										Número de Presupuesto
									</td>
									<td>
										<input id="txtNumPresupuesto" type="text" class="css_frm_inactivo" runat="server" />
									</td>
								</tr>	
								<tr>
									<td class="label" style="width: 120px;">
										Fecha
									</td>
									<td>
										<input id="txtFechaPresupuesto" type="text" class="" size="8" runat="server" onKeyUp="return fn_util_FormatDate(this);" onBlur="return fn_util_UpdateDate(this);" />
									</td>
								</tr>
							</table>
																								
						</fieldset>
											
						<fieldset>
							<legend>DETALLE DEL PRESUPUESTO</legend>
												
							<div style="padding:3px 3px 3px 550px;">
								<input type="button" value="Agregar" class="css_btn_general" onclick="javascript: fn_abreBsqRepuestos();" />
								<input type="button" value="Eliminar" class="css_btn_general" />
							</div>

                            
                            <div id="rowDetalle" style="display:none;">   
                                <table>
                                    <tr>
                                        <td>
                                            <a id="lnkEliminar" href="#" >Eliminar</a>           
                                        </td>
                                        <td style="text-align:center;">
                                            <label id="lblListaPrecioId" class="inputValue" data-name="MS_Lista_Precio_Id" ></label>
                                        </td>
                                        <td>
                                            <label id="lblDescripcion"></label>
                                        </td>
                                        <td style="text-align:right;">
                                            <label id="lblPrecio" class="inputValue" data-name="Importe" ></label>
                                        </td>
                                        <td>
                                            <input id="txtObservacion" class="inputValue" data-name="Observacion" />
                                        </td>
                                    </tr>
                                </table>
                            </div>

							<input id="txtDetalle" type="hidden" runat="server"/>
							<table id="tblDetalle" width="700px" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
                                <thead>
								    <tr>
									    <th style="width: 30px;">_</th>
									    <th style="width: 100px;">Código</th>
									    <th style="width: 450px;">Descripción</th>
									    <th style="width: 120px;">Precio Unidad (S/.)</th>		
									    <th style="width: 120px;">Observacion</th>													
								    </tr>	
                                </thead>
                                <tbody></tbody>
							</table>
                            <b><label id="LabelIGV">Todos los precios incluyen IGV.</label></b>
                            <label id="lblDetalleError" class="validation-summary-errors"></label>
												
							<table width="700px" border="0" cellpadding="3" cellspacing="0">
								<tr>
									<td style="width: 480px; height:22px;">&nbsp;</td>																						
									<td style="text-align:right;width: 100px;"><strong>SUBTOTAL</strong></td>
									<th style="width: 120px; font-weight:normal;border-bottom:1px solid #D4D0C8;">
                                        <input id="txtSubTotal" type="text" class="css_frm_inactivo" runat="server" />
									</th>														
								</tr>
								<tr>
									<td style="height:22px;">&nbsp;</td>																						
									<td style="text-align:right;"><strong>IGV</strong></td>
									<th style="font-weight:normal;">
                                        <input id="txtIGV" type="text" class="css_frm_inactivo" runat="server" />
									</th>														
								</tr>
								<tr>
									<td style="height:22px;">&nbsp;</td>																						
									<td style="text-align:right;"><strong>TOTAL</strong></td>
									<th style="background-color:#F8F8F8; border-top:2px solid #FD9A00;">
                                        <input id="txtTotal" type="text" class="css_frm_inactivo" runat="server" />
									</th>														
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

