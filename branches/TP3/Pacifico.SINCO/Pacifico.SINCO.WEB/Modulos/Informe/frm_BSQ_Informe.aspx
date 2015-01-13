<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_BSQ_Informe.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Informe.frm_BSQ_Informe" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        $(document).ready(function () {
            //Seta Calendarios
            fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);

            //Valida Mostrar Mensaje
            var strMensaje = $("#hddMensaje").val();
            if (fn_util_trim(strMensaje) != "") {
                fn_mdl_mensajeIco(strMensaje,'/Util/images/ok.gif');
            }
            var strMensajeError = $("#hddMensajeError").val();
            if (fn_util_trim(strMensajeError) != "") {
                fn_mdl_mensajeIco(strMensajeError,'/Util/images/warning.gif');
            }

        });

        function fn_buscarInforme() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck, estado) {
            $('input[id*="chkIdInforme"]').prop('checked', false);
            objCheck.checked = true;
            $("#hddCodInforme").val(objCheck.value);
            $("#hddEstadoInforme").val(estado);
        }

        function fn_redirect(pUrl) {
            var hddCodInforme = $("#hddCodInforme").val();
            if (hddCodInforme != "") {
                var hddEstadoInforme = $("#hddEstadoInforme").val();
                console.log('codInforme',hddCodInforme,'estado', hddEstadoInforme);
                if (hddEstadoInforme == "<%=Pacifico.SINCO.UTL.Constantes.iEstado_Registrado%>") {
                    window.location = pUrl + "?pIdInforme=" + hddCodInforme;
                } else {
                    fn_mdl_alert("Informe no puede ser modificado", null, "VALIDACIONES");
                }
            } else {
                fn_mdl_alert("Debe seleccionar un registro", null, "VALIDACIONES");
            }
        }
        
        function fn_redirectView(pUrl) {
            var hddCodInforme = $("#hddCodInforme").val();
            if (hddCodInforme != "") {
                var hddEstadoInforme = $("#hddEstadoInforme").val();
                console.log('codInforme',hddCodInforme,'estado', hddEstadoInforme);
                window.location = pUrl + "?pIdInforme=" + hddCodInforme;
            } else {
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
			<td class="modulo"> Informe de Accidente Vehicular </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:window.location='frm_AGR_Informe.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_nuevo.jpg" border="0" /><br />
								Agregar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_redirect('frm_MOD_Informe.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_editar.jpg" border="0" /><br />
								Modificar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:fn_redirectView('frm_CNS_Informe.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_informes.jpg" border="0" /><br />
								Consultar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_buscarInforme();">
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
			<td class="subModulo">Mantenimiento de Informe de Accidente Vehicular</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
						

   <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
   <asp:HiddenField ID="hddCodInforme" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddEstadoInforme" runat="server" ClientIDMode="Static" EnableViewState="false" />	

   <asp:HiddenField ID="hddMensaje" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddMensajeError" runat="server" ClientIDMode="Static" EnableViewState="false" />	
						
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
							<td class="label" style="width:120px;">
								Número de Póliza
							</td>
							<td>
								<input id="txtNumPoliza" type="text" class="" runat="server"/>
							</td>
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Tipo
							</td>
							<td>
								<select id="cmbTipoSiniestro" class="" runat="server"/>
							</td>	
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Fecha de Siniestro
							</td>
							<td><input id="txtFechaSiniestro" type="text" class="" size="8"  runat="server" onKeyUp="return fn_util_FormatDate(this);" onBlur="return fn_util_UpdateDate(this);" />
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
    	
    <asp:Repeater ID="rptListadoInformes" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Nro. Informe</th>
                        <th />
			            <th>Fecha de Informe</th>
                        <th />
			            <th>Nro. de Poliza</th>
                        <th />
			            <th>Doc. del Asegurado</th>
                        <th />
			            <th>Tipo</th>		
                        <th />						
			            <th>Estado</th>
                        <th />
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr <%#Int32.Parse(Eval("Estado").ToString())%2==0?"class=\"even\"":"" %> >
			            <td><input id="chkIdInforme" type="checkbox" value="<%#Eval("MS_Informe_Accidente_Id") %>" onclick="javascript: fn_checkLista(this,'<%#Eval("Estado")%>')"/></td>
			            <td style="text-align:center;"><%#Eval("NumInforme") %><td>
			            <td style="text-align:center;"><%#Eval("FechaInforme") %><td>
			            <td><%#Eval("Siniestro.Poliza.NumPoliza") %><td>
			            <td style="text-align:center;"><%#Eval("Siniestro.Poliza.Asegurado.DniAsegurado") %><td>
			            <td><%#Eval("Siniestro.Tipo") %><td>
			            <td style="text-align:center;color:<%#Int32.Parse(Eval("Estado").ToString())==Pacifico.SINCO.UTL.Constantes.iEstado_Registrado ? "green": "red"%>;"><%#Eval("EstadoEntity.Nombre") %><td>
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

