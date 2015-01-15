<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarSiniestro() {
            $("#btnBuscar").click();
        }
        var informeSeleccionado;

        function fn_checkLista(objCheck, json) {
            $('input[id*="chkIdInforme"]').prop('checked', false);
            objCheck.checked = true;

            informeSeleccionado = json;
            /*
            $("#hdnInformeAccidenteId").val(json.informeAccidenteId);

            $("#hdnNumInforme").val(json.numInforme);
            $("#hdnNumSiniestro").val(json.numSiniestro);

            $("#hdnTipoSiniestro").val(json.tipo);
            $("#hdnFecSiniestro").val(json.fechaSiniestro);

            $("#hdnLugar").val(json.lugar);
            $("#hdnNumPoliza").val(json.numPoliza);

            $("#hdnAsegurado").val(json.asegurado);

            $("#hdnMarcaId").val(json.marcaId);
            $("#hdnModeloId").val(json.modeloId);*/
        }

        function fn_seleccionar() {
            /*parent.document.getElementById("hddCodPoliza").value = $("#hddCodPoliza").val();
            parent.document.getElementById("txtNumPoliza").value = $("#hddNumPoliza").val();
            parent.document.getElementById("txtAsegurado").value = $("#hddAsegurado").val();
            parent.document.getElementById("txtInicio").value = $("#hddFechaIni").val();
            parent.document.getElementById("txtFin").value = $("#hddFechaFin").val();
            parent.fn_util_CierraModal();*/
            if (informeSeleccionado && informeSeleccionado != null) {
                console.log("informeSeleccionado",informeSeleccionado)
                if(informeSeleccionado.estado == "<%=Pacifico.SINCO.UTL.Constantes.sEstado_Pendiente%>"){
                    parent.cargarSiniestro(informeSeleccionado);
                }else{
                    fn_mdl_alert("Siniestro no se encuentra Pendiente", null, "VALIDACIONES");
                }
            }else{
                fn_mdl_alert("Debe seleccionar un registro", null, "VALIDACIONES");
            }
        }
        
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Siniestro </td>
			<td rowspan="2" class="botones">
				
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:fn_seleccionar();">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_dominio.jpg" border="0" /><br />
								Aceptar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:fn_buscarSiniestro();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:parent.fn_util_CierraModal();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cerrar
							</a>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr>
			<td class="subModulo">Búsqueda de Siniestro</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
	
    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
	
	<!-- INCIO PANEL
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
								<input id="txtNumInforme" type="text" class="" runat="server"/>
							</td>
							<td class="label">
								Asegurado
							</td>
							<td>
								<input id="txtAsegurado" type="text" class="" runat="server"/>
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
    
    <asp:Repeater ID="rptListadoSiniestros" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Número Siniestro</th>
                         <th />
			            <th>Tipo Siniestro</th>
                         <th />
			            <th>Lugar del Siniestro</th>	
                         <th />		
			            <th>Asegurado</th>
                         <th /> 	
			            <th>Código Procurador</th>
                         <th /> 
			            <th>Procurador</th>
                         <th /> 
			            <th>Estado</th>
                         <th />
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr <%#Int32.Parse(Eval("Estado").ToString())%2==0?"class=\"even\"":"" %> >
			            <td>
                            <input id="chkIdInforme" type="checkbox" value="<%#Eval("MS_Siniestro_Id")%>"
                                onclick="fn_checkLista(this,{siniestroId:'<%# Eval("MS_Siniestro_Id") %>',
                                numSiniestro:'<%# Eval("NumSiniestro") %>', estado:'<%# Eval("Estado")%>',
                                tipo:'<%# Eval("Tipo") %>',
                                fechaSiniestro:'<%# ((DateTime)Eval("FechaSiniestro")).ToString("d")%>',
                                lugar:'<%# Eval("Lugar")%>',
                                numPoliza:'<%# Eval("NumPoliza") %>',    
                                numProcurador:'<%# Eval("NumProcurador") %>',
                                procurador:'<%# Eval("NombreProcurador")%>',
                                asegurado:'<%# Eval("NombreAsegurado")%>'})"/>                            
			            </td>
                            
			            <td style="text-align:center;"><%#Eval("NumSiniestro") %><td>
			            <td style="text-align:center;"><%#Eval("Tipo") %><td>
			            <td style="text-align:center;"><%#Eval("Lugar") %><td>
			            <td style="text-align:center;"><%# Eval("NombreAsegurado")%><td>
			            <td style="text-align:center;"><%#Eval("NumProcurador") %><td>
                        <td style="text-align:center;"><%#Eval("NombreProcurador")%><td>
			            <td style="text-align:center;color:<%# Int32.Parse(Eval("Estado").ToString())  == Pacifico.SINCO.UTL.Constantes.sEstado_Pendiente ? "green" : "red" %>;";"><%#Eval("vEstado") %><td>
		            </tr>                                       
               </ItemTemplate>
            <FooterTemplate>
            </tbody>
         </table>
         </FooterTemplate>
      </asp:Repeater>
        <p>
            <label id="lblMensaje" class="operation-success" runat="server" ></label><label id="lblMensajeError" class="validation-summary-errors" runat="server" ></label>
        </p>

</asp:Content>