<%@ Page Language="C#" MasterPageFile="~/MasterPageModal.master" AutoEventWireup="true" CodeBehind="mdl_BSQ_Repuesto.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Comun.mdl_BSQ_Repuesto" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

    <script type='text/javascript'>
        function fn_buscarInforme() {
            $("#btnBuscar").click();
        }
        var informeSeleccionado;
        
        function fn_checkLista(objCheck, json) {
            $('input[id*="chkIdListaPrecio"]').prop('checked', false);
            objCheck.checked = true;

            informeSeleccionado = json;
            /*
            $("#hddCodPoliza").val(objCheck.value);
            $("#hddNumPoliza").val(vNumPoliza);
            $("#hddAsegurado").val(vAsegurado);
            $("#hddFechaIni").val(vFechaIni);
            $("#hddFechaFin").val(vFechaFin);*/
        }

        function fn_seleccionar() {
            /*parent.document.getElementById("hddCodPoliza").value = $("#hddCodPoliza").val();
            parent.document.getElementById("txtNumPoliza").value = $("#hddNumPoliza").val();
            parent.document.getElementById("txtAsegurado").value = $("#hddAsegurado").val();
            parent.document.getElementById("txtInicio").value = $("#hddFechaIni").val();
            parent.document.getElementById("txtFin").value = $("#hddFechaFin").val();
            parent.fn_util_CierraModal();*/
            if (informeSeleccionado && informeSeleccionado != null) {
                console.log("informeSeleccionado", informeSeleccionado)
                
                parent.cargarListaPrecio(informeSeleccionado);
                
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
			<td class="modulo"> Repuestos </td>
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
						<!--<td class="boton">
							<a href="#">
								<img src="<%=sUrl %>Util/images/iconos/ico_btn_buscar.jpg" border="0" /><br />
								Buscar
							</a>
						</td>-->
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
			<td class="subModulo">Búsqueda de Repuestos</td>
		</tr>
	</table>
	<!-- FIN TITULO-->	
	
	<!-- INCIO PANEL-->
    <!--
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
								Código
							</td>
							<td>
								<input id="txtCodigo" type="text" class="" runat="server"/>
							</td>
							<td class="label">
								Descripción
							</td>
							<td>
								<input id="txtDescripcion" type="text" class="" runat="server"/>
							</td>														
						</tr>	
					</table>
				
				</div>
				
			</td>
			<td class="right"></td>												
		</tr>
		<tr class="pie"><td class="left"></td><td class="center"></td><td class="right"></td></tr>
	</table>	-->
	<!-- FIN PANEL-->
	

	<br/><br/>
    
    <asp:Repeater ID="rptListadoPrecios" runat="server" EnableViewState="false">
         <HeaderTemplate>
             <table width="100%" border="0" cellpadding="3" cellspacing="0" class="css_grilla">
		        <thead>
                     <tr>
			            <th>_</th>
			            <th>Código</th>	
                         <th />
			            <th>Marca</th>
                         <th />
			            <th>Modelo</th>
                         <th />
			            <th>Descripción</th>
                         <th />
			            <th>Precio (S./)</th>	
                         <th />		
		            </tr>	
                </thead>
            </HeaderTemplate>
            <ItemTemplate>
               <tbody>
                   <tr>
			            <td>
                            <!--<a href="#" 
                                style="width:40px;"
                                onclick="parent.cargarListaPrecio({listaPrecioId:'<%# Eval("MS_Lista_Precio_Id") %>',
                                descripcion:'<%# Eval("Servicio.Descripcion") %>',
                                precio:'<%# Eval("Precio") %>'})">Seleccionar</a>-->
                            
                            <input id="chkIdListaPrecio" type="checkbox" value="<%#Eval("MS_Lista_Precio_Id")%>"
                                onclick="fn_checkLista(this,{listaPrecioId:'<%# Eval("MS_Lista_Precio_Id") %>',
                                descripcion:'<%# Eval("Servicio.Descripcion") %>',
                                precio:'<%# Eval("Precio") %>'})"/>
			            </td>                            
			            <td style="text-align:center;"><%#Eval("MS_Lista_Precio_Id") %><td>
			            <td style="text-align:center;"><%#Eval("Marca.Descripcion") %><td>
			            <td style="text-align:center;"><%#Eval("Modelo.Descripcion") %><td>
			            <td style="text-align:center;"><%#Eval("Servicio.Descripcion") %><td>
			            <td style="text-align:center;"><%#Eval("Precio") %><td>
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