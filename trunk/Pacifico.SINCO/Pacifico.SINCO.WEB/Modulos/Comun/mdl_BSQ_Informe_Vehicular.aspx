<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Informe_Vehicular.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Informe_Vehicular" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarInforme() {
            $("#btnBuscar").click();
        }
        /*
        function fn_checkLista(objCheck, vNumPoliza, vAsegurado, vFechaIni, vFechaFin) {
            $('input[id*="chkIdPoliza"]').prop('checked', false);
            objCheck.checked = true;

            $("#hddCodPoliza").val(objCheck.value);
            $("#hddNumPoliza").val(vNumPoliza);
            $("#hddAsegurado").val(vAsegurado);
            $("#hddFechaIni").val(vFechaIni);
            $("#hddFechaFin").val(vFechaFin);
        }

        function fn_seleccionar() {
            parent.document.getElementById("hddCodPoliza").value = $("#hddCodPoliza").val();
            parent.document.getElementById("txtNumPoliza").value = $("#hddNumPoliza").val();
            parent.document.getElementById("txtAsegurado").value = $("#hddAsegurado").val();
            parent.document.getElementById("txtInicio").value = $("#hddFechaIni").val();
            parent.document.getElementById("txtFin").value = $("#hddFechaFin").val();
            parent.fn_util_CierraModal();
        }
        */
    </script>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">
    	
	<!-- INCIO TITULO-->
	<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_titulo">
		<tr>
			<td rowspan="2" class="icono"><img src="<%=sUrl %>Util/images/iconos/ico_mdl_expedientes.jpg" /></td>
			<td class="modulo"> Informe Vehicular </td>
			<td rowspan="2" class="botones">
				
				<table width="100%" border="0" cellpadding="0" cellspacing="0" class="css_tb_tituloBotones">
					<tr>
						<td>&nbsp;</td><!--	
						<td class="boton">
							<a href="#">
								<img src="<%=sUrl %>Util/images/iconos/ico_mdl_dominio.jpg" border="0" /><br />
								Aceptar
							</a>
						</td>-->
						<td class="boton">
							<a href="javascript:fn_buscarInforme();">
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
			<td class="subModulo">Búsqueda de Informe Vehicular</td>
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
    
    <asp:Repeater ID="rptListadoInformes" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Número Accidente</th>	
                         <th />		
			            <th>Número Siniestro</th>
                         <th />
			            <th>Asegurado</th>
                         <th />
			            <th>Lugar del Siniestro</th>	
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
                            <a href="#" 
                                style="width:40px;display: <%#Int32.Parse(Eval("Estado").ToString())==Pacifico.SINCO.UTL.Constantes.iEstado_Registrado?"inline":"none" %>"
                                onclick="parent.cargarInforme({informeAccidenteId:'<%# Eval("MS_Informe_Accidente_Id") %>',
                                numInforme:'<%# Eval("NumInforme") %>',
                                numSiniestro:'<%# Eval("Siniestro.NumSiniestro") %>',
                                tipo:'<%# Eval("Siniestro.Tipo") %>',
                                fechaSiniestro:'<%# ((DateTime)Eval("Siniestro.FechaSiniestro")).ToString("d")%>',
                                lugar:'<%# Eval("Siniestro.Lugar")%>',
                                numPoliza:'<%# Eval("Siniestro.Poliza.NumPoliza") %>',
                                marcaId:'<%# Eval("Siniestro.Poliza.Vehiculo.MP_Marca_Id") %>',
                                modeloId:'<%# Eval("Siniestro.Poliza.Vehiculo.MP_Modelo_Id") %>',
                                asegurado:'<%# Eval("Siniestro.Poliza.Asegurado.Nombre") + " " + Eval("Siniestro.Poliza.Asegurado.ApellidoPaterno") + " " + Eval("Siniestro.Poliza.Asegurado.ApellidoMaterno")%>'})">Seleccionar</a>
			            </td>
                            
			            <td style="text-align:center;"><%#Eval("NumInforme") %><td>
			            <td style="text-align:center;"><%#Eval("Siniestro.NumSiniestro") %><td>
			            <td><%# Eval("Siniestro.Poliza.Asegurado.Nombre") + " " + Eval("Siniestro.Poliza.Asegurado.ApellidoPaterno") + " " + Eval("Siniestro.Poliza.Asegurado.ApellidoMaterno")%><td>
			            <td style="text-align:center;"><%#Eval("Siniestro.Lugar") %><td>
			            <td style="text-align:center;color:red;"><%#Eval("EstadoEntity.Nombre") %><td>
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