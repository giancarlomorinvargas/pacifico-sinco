<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Poliza.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Poliza" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarPoliza() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck, vNumPoliza, vAsegurado, vFechaIni, vFechaFin, vVigente) {
            $('input[id*="chkIdPoliza"]').prop('checked', false);
            objCheck.checked = true;

            $("#hddCodPoliza").val(objCheck.value);
            $("#hddNumPoliza").val(vNumPoliza); 
            $("#hddAsegurado").val(vAsegurado);  
            $("#hddFechaIni").val(vFechaIni);  
            $("#hddFechaFin").val(vFechaFin); 
            $("#hddVigente").val(vVigente);
        }

        function fn_seleccionar() {

            
            var hddCodPoliza = $("#hddCodPoliza").val();
            if (hddCodPoliza != "") {        
                var hddVigente = $("#hddVigente").val();
                console.log("hddVigente",hddVigente)
                if(hddVigente == "true" || hddVigente == "True"){
                    parent.document.getElementById("hddCodPoliza").value = $("#hddCodPoliza").val();
                    parent.document.getElementById("txtNumPoliza").value = $("#hddNumPoliza").val();
                    parent.document.getElementById("txtAsegurado").value = $("#hddAsegurado").val();
                    parent.document.getElementById("txtInicio").value = $("#hddFechaIni").val();
                    parent.document.getElementById("txtFin").value = $("#hddFechaFin").val();
                    parent.fn_util_CierraModal();        
                }else{
                    fn_mdl_alert("Póliza no se encuentra vigente", null, "VALIDACIONES");  
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
			<td class="modulo"> Pólizas </td>
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
							<a href="javascript:fn_buscarPoliza();">
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
			<td class="subModulo">Búsqueda de Pólizas</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
	
    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
    <asp:HiddenField ID="hddCodPoliza" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddNumPoliza" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddAsegurado" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddFechaIni" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddFechaFin" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddVigente" runat="server" ClientIDMode="Static" EnableViewState="false" />	
	
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
							<td class="label">Número de Póliza</td>
							<td><input id="txtNumeroPoliza" type="text" class="" runat="server" />
							</td>
							<td class="label">
								Número de Placa Vehículo
							</td>
							<td>
								<input id="txtNumeroPlaca" type="text" class="" runat="server" />
							</td>
						</tr>											
						<tr>
							<td class="label">
								DNI Asegurado
							</td>
							<td>
								<input id="txtDniAsegurado" type="text" class="" size="9" runat="server" />
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
	

    <asp:Repeater ID="rptListadoPolizas" runat="server" EnableViewState="false">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		    <thead>
                <tr>
			        <th>_</th>
			        <th>Número de Póliza</th>			
			        <th>Asegurado</th>
			        <th>Marca vehículo</th>
			        <th>Modelo vehículo </th>
			        <th>Placa vehículo</th>
			        <th>Estado Poliza</th>
		        </tr>
            </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tbody>
                <tr class="even">
			        <td> <input id="chkIdPoliza" type="checkbox" value="<%#Eval("MP_Poliza_Id") %>" onclick="javascript: fn_checkLista(this, '<%#Eval("NumPoliza") %>', '<%#Eval("Asegurado.Nombre") + " " + Eval("Asegurado.ApellidoPaterno") + " " + Eval("Asegurado.ApellidoMaterno") %>', '<%#Eval("FechaInicio") %>','<%#Eval("FechaFin") %>', '<%#Eval("Vigente")%>')"/> </td>
			        <td style="text-align:center;"><%#Eval("NumPoliza") %></td>			
			        <td><%#Eval("Asegurado.Nombre") + " " +Eval("Asegurado.ApellidoPaterno")  + " " +Eval("Asegurado.ApellidoMaterno")%></td>
			        <td style="text-align:center;"><%#Eval("Vehiculo.Marca.Descripcion") %></td>
			        <td style="text-align:center;"><%#Eval("Vehiculo.Modelo.Descripcion") %></td>
			        <td style="text-align:center;"><%#Eval("Vehiculo.Placa") %></td>
			        <td style="text-align:center;color:<%# bool.Parse(Eval("Vigente").ToString()) ? "green" : "red" %>;";"><%#bool.Parse(Eval("Vigente").ToString()) ? "Vigente" : "No Vigente" %></td>
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
