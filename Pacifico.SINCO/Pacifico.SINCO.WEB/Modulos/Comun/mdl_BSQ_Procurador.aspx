﻿<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Procurador.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Procurador" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarProcurador() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck, pNumProcurador, pNombreProcurador, pDisponibilidad) {
            $('input[id*="chkIdProcurador"]').prop('checked', false);
            objCheck.checked = true;

            $("#hddCodProcurador").val(objCheck.value);
            $("#hddNumProcurador").val(pNumProcurador);
            $("#hddNombreProcurador").val(pNombreProcurador);
            $("#hddDisponible").val(pDisponibilidad);
        }
         
        function fn_seleccionar() {
            
            var hddCodProcurador = $("#hddCodProcurador").val();
            if (hddCodProcurador != "") {        
                var hddDisponible = $("#hddDisponible").val();
                console.log("hddDisponible",hddDisponible)
                if(hddDisponible == "true" || hddDisponible == "True"){
                    parent.document.getElementById("hddCodProcurador").value = $("#hddCodProcurador").val();
                    parent.document.getElementById("txtCodProcurador").value = $("#hddNumProcurador").val();
                    parent.document.getElementById("txtNombreProcurador").value = $("#hddNombreProcurador").val();
                    parent.fn_util_CierraModal();                  
                }else{
                    fn_mdl_alert("Procurador no se encuentra vigente", null, "VALIDACIONES");  
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
			<td class="modulo"> Procurador </td>
			<td rowspan="2" class="botones">
				
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>	
						<td class="boton">
							<a href="javascript: fn_seleccionar();">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_dominio.jpg" border="0" /><br />
								Aceptar
							</a>
						</td>						
						<td class="boton">
							<a href="javascript: fn_buscarProcurador();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="javascript: parent.fn_util_CierraModal();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_cancelar.jpg" border="0" /><br />
								Cerrar
							</a>
						</td>
					</tr>
				</table>
				
			</td>
		</tr>
		<tr>
			<td class="subModulo">Búsqueda de Procuradores</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
	
    
    <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
    <asp:HiddenField ID="hddCodProcurador" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddNumProcurador" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddNombreProcurador" runat="server" ClientIDMode="Static" EnableViewState="false" />	
    <asp:HiddenField ID="hddDisponible" runat="server" ClientIDMode="Static" EnableViewState="false" />
				
	
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
								Código de Procurador
							</td>
							<td>
								<input id="txtCodigoProcurador" type="text" class="" runat="server" />
							</td>
							<td class="label">
								Nombre de Procurador
							</td>
							<td>
								<input id="txtNombreProcurador" type="text" class="" runat="server" />
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
	
    <asp:Repeater ID="rptListadoProcurador" runat="server" EnableViewState="false">
        <HeaderTemplate>
            <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		    <thead>
                <tr>
			        <th>_</th>
			        <th>Código Procurador</th>						
			        <th>Nombre Procurador</th>
			        <th>Teléfono </th>
			        <th>Estado Disponibilidad</th>		
		        </tr>
            </thead>
        </HeaderTemplate>
        <ItemTemplate>
            <tbody>
                <tr class="even">
			        <td> <input id="chkIdProcurador" type="checkbox" value="<%#Eval("MS_Procurador_Id") %>" onclick="javascript: fn_checkLista(this,'<%#Eval("NumProcurador") %>','<%#Eval("ApellidoPaterno") %> <%#Eval("ApellidoMaterno") %>, <%#Eval("Nombre") %>','<%#Eval("Disponible")%>')"/> </td>
			        <td style="text-align:center;"><%#Eval("NumProcurador") %></td>
			        <td style="text-align:center;"><%#Eval("ApellidoPaterno") %> <%#Eval("ApellidoMaterno") %>, <%#Eval("Nombre") %> </td>
			        <td><%#Eval("Telefono") %></td>
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