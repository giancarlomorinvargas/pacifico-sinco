<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_BSQ_Siniestro.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Siniestro.frm_BSQ_Siniestro" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        $(document).ready(function () {
            //Seta Calendarios
            fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);
        });

        function fn_buscarSiniestro() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck) {            
            $('input[id*="chkIdSiniestro"]').prop('checked', false);
            objCheck.checked = true;
            $("#hddCodSiniestro").val(objCheck.value);            
        }

        function fn_redirect(pUrl) {
            var hddCodSiniestro = $("#hddCodSiniestro").val();
            if (hddCodSiniestro != "") {
                window.location = pUrl + "?pIdSiniestro=" + hddCodSiniestro;
            } else {
                alert("Debe seleccionar un registro.");
            }
        }

    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">


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
							<a href="javascript:window.location='frm_AGR_Siniestro.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_nuevo.jpg" border="0" /><br />
								Agregar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_redirect('frm_MOD_Siniestro.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_editar.jpg" border="0" /><br />
								Modificar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:fn_redirect('frm_CNS_Siniestro.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_informes.jpg" border="0" /><br />
								Consultar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_buscarSiniestro();">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:window.location='../Principal.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_inicio.jpg" border="0" /><br />
								Inicio
							</a>
						</td>
					</tr>
				</table>
									
			</td>
		</tr>
		<tr>
			<td class="subModulo">Mantenimiento de Siniestros</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
				

   <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
   <asp:HiddenField ID="hddCodSiniestro" runat="server" ClientIDMode="Static" EnableViewState="false" />	
						
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
								Número de Póliza
							</td>
							<td>
								<input id="txtNumPoliza" type="text" class="" runat="server"/>
							</td>
							<td>&nbsp;</td>
							<td class="label">
								Tipo de Siniestro
							</td>
							<td>
								<select id="cmbTipoSiniestro"  runat="server">
									<option value=""> [SELECCIONE] </option>
                                    <option value="1"> Tipo 1 </option>
                                    <option value="2"> Tipo 2 </option>
								</select>
							</td>
							<td>&nbsp;</td>
							<td class="label" style="width:120px;">
								Fecha de Siniestro
							</td>
							<td>
								<input id="txtFechaSiniestro" type="text" class="" size="8"  runat="server" onKeyUp="return fn_util_FormatDate(this);" onBlur="return fn_util_UpdateDate(this);" />								
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
			            <th>Nro. Siniestro<th>
			            <th>Nro. de Poliza<th>
			            <th>Asegurado<th>
			            <th>Fecha de Siniestro<th>
			            <th>Tipo de Siniestro<th>
			            <th>Estado de  Siniestro<th>
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr <%#Int32.Parse(Eval("Estado").ToString())%2==0?"class=\"even\"":"" %> >
			            <td><input id="chkIdSiniestro" type="checkbox" value="<%#Eval("MS_Siniestro_Id") %>" onclick="javascript:fn_checkLista(this)"/></td>
			            <td style="text-align:center;"><%#Eval("NumSiniestro") %><td>
			            <td style="text-align:center;"><%#Eval("NumPoliza") %><td>
			            <td><%#Eval("NombreAsegurado") %><td>
			            <td style="text-align:center;"><%#Eval("FechaSiniestro") %><td>
			            <td><%#Eval("Tipo") %><td>
			            <td style="text-align:center;color:red;"><%#Eval("vEstado") %><td>
		            </tr>                                       
               </ItemTemplate>
            <FooterTemplate>
            </tbody>
         </table>
         </FooterTemplate>
      </asp:Repeater>
    
    
</asp:Content>


