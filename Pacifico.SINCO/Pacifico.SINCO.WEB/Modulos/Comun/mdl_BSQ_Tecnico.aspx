<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Tecnico.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Tecnico" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarTecnico() {
            $("#btnBuscar").click();
        }
        var informeSeleccionado;

        function fn_checkLista(objCheck, json) {
            $('input[id*="chkIdTecnico"]').prop('checked', false);
            objCheck.checked = true;

            informeSeleccionado = json;
            /*
            $("#hdnTecnicoAccidenteId").val(json.informeAccidenteId);

            $("#hdnNumTecnico").val(json.numTecnico);
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
                if(informeSeleccionado.disponible == "true" || informeSeleccionado.disponible == "True"){
                    parent.cargarTecnico(informeSeleccionado);
                }else{
                    fn_mdl_alert("Técnico no se encuentra disponible", null, "VALIDACIONES");
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
			<td class="modulo"> Técnico </td>
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
							<a href="javascript:fn_buscarTecnico();">
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
			<td class="subModulo">Consultar Disponibilidad Técnico</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
	
    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
	
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
								Código Técnico
							</td>
							<td>
								<input id="txtNumTecnico" type="text" class="" runat="server"/>
							</td>
							<td class="label">
								Nombre Técnico
							</td>
							<td>
								<input id="txtTecnico" type="text" class="" runat="server"/>
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
    
    <asp:Repeater ID="rptListadoTecnicos" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Código Técnico</th>	
                         <th />		
			            <th>Técnico</th>
                         <th />
			            <th>Taller</th>
                         <th />
			            <th>Disponbilidad</th>	
                         <th />
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr class="even">
			            <td>
                            <input id="chkIdTecnico" type="checkbox" value="<%#Eval("TecnicoId")%>"
                                onclick="fn_checkLista(this,{tecnicoId:'<%# Eval("TecnicoId") %>',
                                numTecnico:'<%# Eval("NumTecnico") %>', taller:'<%# Eval("Taller.Nombre")%>',
                                tecnico:'<%# Eval("Nombre") + " " + Eval("ApellidoPaterno") + " " + Eval("ApellidoMaterno")%>',
                                disponible:'<%# Eval("Disponible")%>'})"/>                            
			            </td>
                            
			            <td style="text-align:center;"><%#Eval("NumTecnico") %><td>
			            <td><%# Eval("Nombre") + " " + Eval("ApellidoPaterno") + " " + Eval("ApellidoMaterno")%><td>
			            <td style="text-align:center;"><%#Eval("Taller.Nombre") %><td>
                        <td style="text-align:center;color:<%# bool.Parse(Eval("Disponible").ToString()) ? "green" : "red" %>;"> <%# bool.Parse(Eval("Disponible").ToString()) ? "Disponible" : "No Disponible" %> </td>
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