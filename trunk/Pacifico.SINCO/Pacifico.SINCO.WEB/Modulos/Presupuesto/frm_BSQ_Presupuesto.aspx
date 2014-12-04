<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeBehind="frm_BSQ_Presupuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Presupuesto.frm_BSQ_Presupuesto" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        $(document).ready(function () {
            //Seta Calendarios
            fn_util_SeteaCalendario($('input[id*=txtFecha]')[0]);
        });

        function fn_buscarPresupuesto() {
            $("#btnBuscar").click();
        }

        function fn_checkLista(objCheck, estado) {
            $('input[id*="chkIdPresupuesto"]').prop('checked', false);
            objCheck.checked = true;
            $("#hddCodPresupuesto").val(objCheck.value);
            $("#hddEstadoPresupuesto").val(estado);
        }

        function fn_redirect(pUrl) {
            var hddCodPresupuesto = $("#hddCodPresupuesto").val();
            if (hddCodPresupuesto != "") {
                var hddEstadoPresupuesto = $("#hddEstadoPresupuesto").val();

                if (hddEstadoPresupuesto == "<%=Pacifico.SINCO.UTL.Constantes.pEstado_Registrado%>") {
                    window.location = pUrl + "?pIdPresupuesto=" + hddCodPresupuesto;
                } else {
                    fn_mdl_alert("Presupuesto no puede ser modificado", null, "VALIDACIONES");
                }
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
			<td class="modulo"> Presupuestos </td>
			<td rowspan="2" class="botones">
									
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td>
						<td class="boton">
							<a href="javascript:window.location='frm_AGR_Presupuesto.aspx';">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_nuevo.jpg" border="0" /><br />
								Agregar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_redirect('frm_MOD_Presupuesto.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_editar.jpg" border="0" /><br />
								Modificar
							</a>
						</td>
						<td class="boton">
							<a href="javascript:fn_redirect('frm_CNS_Presupuesto.aspx');">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_informes.jpg" border="0" /><br />
								Consultar
							</a>
						</td>											
						<td class="boton">
							<a href="javascript:fn_buscarPresupuesto();">
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
			<td class="subModulo">Mantenimiento de Presupuestos</td>
		</tr>
	</table>
	<!-- FIN TITULO-->
						

   <asp:Button ID="btnBuscar" runat="server" Text="" OnClick="btnBuscar_Click" ClientIDMode="Static" Style="display: none;" />	
   <asp:HiddenField ID="hddCodPresupuesto" runat="server" ClientIDMode="Static" EnableViewState="false" />	
   <asp:HiddenField ID="hddEstadoPresupuesto" runat="server" ClientIDMode="Static" EnableViewState="false" />	
						
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
								Nro. de Presupuesto
							</td>
							<td>
								<input id="txtNumPresupuesto" type="text" class="" runat="server"/>
							</td>
							<td>&nbsp;</td>
							<td class="label"style="width:180px;">
								Nro. de Accidente Vehicular
							</td>
							<td>
								<input id="txtNumInforme" type="text" class="" runat="server"/>
							</td>												
						</tr>	
						<tr>												
							<td class="label">
								Nro. de Póliza
							</td>
							<td>
								<input id="txtNumPoliza" type="text" class="" runat="server"/>
							</td>
							<td>&nbsp;</td>
							<td class="label" style="width:120px;">
								Fecha
							</td>
							<td>
								<input id="txtFechaPresupuesto" type="text" class="" size="8"  runat="server" onKeyUp="return fn_util_FormatDate(this);" onBlur="return fn_util_UpdateDate(this);" />
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
    	
    <asp:Repeater ID="rptListadoPresupuestos" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Nro. Presupuesto</th>
                        <th />
			            <th>Nro. Accidente Vehicular</th>
                        <th />
			            <th>Nro. de Poliza</th>
                        <th />
			            <th>Asegurado</th>
                        <th />
			            <th>Fecha</th>		
                        <th />						
			            <th>Estado de Presupuesto</th>
                        <th />
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr <%#Int32.Parse(Eval("Estado").ToString())%2==0?"class=\"even\"":"" %> >
			            <td><input id="chkIdPresupuesto" type="checkbox" value="<%#Eval("MS_Presupuesto_Id") %>" onclick="javascript: fn_checkLista(this,'<%#Eval("Estado")%>')"/></td>
			            <td style="text-align:center;"><%#Eval("NumPresupuesto") %><td>
			            <td style="text-align:center;"><%#Eval("InformeAccidente.NumInforme") %><td>
			            <td><%#Eval("InformeAccidente.Siniestro.Poliza.NumPoliza") %><td>
			            <td style="text-align:center;"><%#Eval("InformeAccidente.Siniestro.Poliza.Asegurado.Nombre") %> <%#Eval("InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoPaterno") %> <%#Eval("InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoMaterno") %><td>
			            <td><%#Eval("FechaPresupuesto") %><td>
			            <td style="text-align:center;color:<%#Int32.Parse(Eval("Estado").ToString())==Pacifico.SINCO.UTL.Constantes.pEstado_Registrado ? "green": "red"%>;"><%#Eval("EstadoEntity.Nombre") %><td>
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

