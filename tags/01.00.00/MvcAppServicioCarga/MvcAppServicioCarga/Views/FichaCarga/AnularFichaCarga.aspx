<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<MvcAppServicioCarga.Models.ServicioCarga.MGFichaCarga>"%>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 78%;
        }
        .style2
        {
        }
        .style3
        {
            width: 194px;
        }
        .style4
        {
            color: #003399;
        }
        .style5
        {
            width: 140px;
            color: #003399;
        }
        .style6
        {
            color: #666666;
        }
        .editor-label {
            display:inline;
            width: 86px;
        }
        .editor-field {
            display:inline;
            width: 86px;
        }
        fieldset {
            display: block;
            -webkit-margin-start: 2px;
            -webkit-margin-end: 2px;
            -webkit-padding-before: 0.35em;
            -webkit-padding-start: 0.75em;
            -webkit-padding-end: 0.75em;
            -webkit-padding-after: 0.625em;
            border: 2px groove threedface;
            border-image-source: initial;
            border-image-slice: initial;
            border-image-width: initial;
            border-image-outset: initial;
            border-image-repeat: initial;
            min-width: -webkit-min-content;
        }
        fieldset legend {
            display:inline;
        }
    </style> 
</asp:Content> 
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">


        function cargarCliente(clienteJson) {
            console.log('cargando...', clienteJson);
            if (clienteJson.rol == 1) {
                cargarRemitente(clienteJson);
            } else {
                cargarDestinatario(clienteJson);
            }
            dialog.dialog("close");
        }

        function cargarRemitente(clienteJson) {
            $("#hdnRemitenteId").val(clienteJson.clienteId);
            $("#txtRemitente").val(clienteJson.nombres + ' ' + clienteJson.apellidos);
        }

        function cargarDestinatario(clienteJson) {
            $("#hdnDestinatarioId").val(clienteJson.clienteId);
            $("#txtDestinatario").val(clienteJson.nombres + ' ' + clienteJson.apellidos);
        }


        function consultarCliente(rol) {
            $.ajax({
                type: 'GET',
                url: '/FichaCarga/ConsultarCliente',
                data: { "rol": rol },
                success: function (data) {

                    $("#cuerpoemergente").html(data);

                    dialog.dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });

            return false;
        }



        function cargarProgramacionRuta(progRutaJson) {
            console.log('cargando...', progRutaJson);
            $("#hdnProgramacionRutaId").val(progRutaJson.programacionRutaId);

            $("#txtFecSalida").val(progRutaJson.fechaOrigen);
            $("#txtFecLlegada").val(progRutaJson.fechaDestino);
            $("#txtUnidadTransporte").val(progRutaJson.placa);

            dialog.dialog("close");
        }

        function consultarProgramacionRuta() {
            $.ajax({
                type: 'GET',
                url: '/FichaCarga/ConsultarProgramacion',
                success: function (data) {

                    $("#cuerpoemergente").html(data);

                    dialog.dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });

            return false;
        }

        var dialog;
        $(function () {
            dialog = $("#cuerpoemergente").dialog({
                autoOpen: false,
                height: 500,
                width: 850,
                modal: true
            });

        });

    </script>
    
        <br />

    
    <div id="cuerpoemergente"></div>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <div class="editor-label">
            Ficha
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.MG_FichaCarga_ID, new Dictionary<string, object>() { { "readonly", "true" } })%>            
        </div>

    <fieldset>
        <legend>Datos de Programación Ruta</legend>
        <%: Html.TextBoxFor(model => model.MK_ProgramacionRuta_ID, new Dictionary<string, object>() { {"id", "hdnProgramacionRutaId"}, { "type", "hidden" } })%>
        <div class="editor-label">
            Agencia Origen:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Ruta.AgenciaOrigen.Descripcion), new Dictionary<string, object>() { {"id", "txtAgenciaOrigen"}, { "disabled", "true" } })%>
            <!--input id="txtAgenciaOrigen" disabled /-->
        </div>
        <div class="editor-label">
            Agencia Destino:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Ruta.AgenciaDestino.Descripcion), new Dictionary<string, object>() { {"id", "txtAgenciaDestino"}, { "disabled", "true" } })%>
            <!--input id="txtAgenciaDestino" disabled /-->
        </div>        
        <br />
            
        <div class="editor-label">
            Fecha Salida:
        </div>

        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.FechaOrigen), new Dictionary<string, object>() { {"id", "txtFecSalida"}, { "disabled", "true" } })%>
            <!--input id="txtFecSalida" disabled /-->
        </div>
            
        <div class="editor-label">
            Fecha Llegada:
        </div>

        <div class="editor-field">            
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.FechaDestino), new Dictionary<string, object>() { {"id", "txtFecLlegada"}, { "disabled", "true" } })%>
            <!--input id="txtFecLlegada" disabled /-->
        </div>
        <br />
            
        <div class="editor-label">
            Hora Salida:
        </div>

        <div class="editor-field">
        </div>
            
        <div class="editor-label">
            Hora Llegada:
        </div>

        <div class="editor-field">
            
        </div>

        <br />
        <div class="editor-label">
            Unidad Transporte:
        </div>

        <div class="editor-field"> 
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Vehiculo.Placa), new Dictionary<string, object>() { {"id", "txtUnidadTransporte"}, { "disabled", "true" } })%>
            <!--input id="txtUnidadTransporte" disabled /-->
        </div>
    </fieldset>

    
    <fieldset>
        <legend>Datos de Carga</legend>
        
        <%: Html.TextBoxFor(model => model.UsuarioRegistra, new Dictionary<string, object>() { { "type", "hidden" } })%>        
        <%: Html.TextBoxFor(model => model.UsuarioModifica, new Dictionary<string, object>() { { "type", "hidden" } })%>

        <%: Html.TextBoxFor(model => model.FechaRegistra, new Dictionary<string, object>() { { "type", "hidden" } })%>
        <%: Html.TextBoxFor(model => model.FechaRegistro, new Dictionary<string, object>() { { "type", "hidden" } })%>
        
        <%: Html.TextBoxFor(model => model.FechaModifica, new Dictionary<string, object>() { { "type", "hidden" } })%>
        <%: Html.TextBoxFor(model => model.EstadoPago, new Dictionary<string, object>() { { "type", "hidden" } })%>
        <%: Html.TextBoxFor(model => model.Estado, new Dictionary<string, object>() { { "type", "hidden" } })%>

        
        <%: Html.TextBoxFor(model => model.MG_Remitente_ID, new Dictionary<string, object>() { {"id", "hdnRemitenteId"}, { "type", "hidden" } })%>

        <div class="editor-label">
            Remitente:
        </div>
        <div class="editor-field">
            
            <%: Html.TextBox("txtRemitente",Model.Remitente.Nombres + ' ' + Model.Remitente.ApellidosPaterno, new Dictionary<string, object>() { {"id", "txtRemitente"}, { "disabled", "true" } })%>
            <!--input id="txtRemitente" disabled /-->    
        </div>
            
        <br />            
        <%: Html.TextBoxFor(model => model.MG_Destinatario_ID, new Dictionary<string, object>() { {"id", "hdnDestinatarioId"}, { "type", "hidden" } })%>
        <div class="editor-label">
            Destinatario:
        </div>
        <div class="editor-field">
            <%: Html.TextBox("txtDestinatario", Model.Destinatario.Nombres + ' ' + Model.Destinatario.ApellidosPaterno, new Dictionary<string, object>() { {"id", "txtDestinatario"}, { "disabled", "true" } })%>
            <!--input id="txtDestinatario" disabled /-->    
        </div>

        <br />
        <br />
        
        <div>   
                          
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>
                        Producto
                    </th>
                    <th>
                        Descripción
                    </th>
                    <th>
                        Tipo Carga
                    </th>
                    <th>
                        Cantidad (Unid.)
                    </th>
                    <th>
                        Peso (Kg.)
                    </th>
                    <th>
                        Importe (S/.)
                    </th>
                </tr> 
            </thead>
            <tbody>
        <% foreach (var item in Model.DetalleFichaCarga)
       { %>
    
            <tr>
                <td>
                    <%: item.MG_Producto_ID %>
                </td>
                <td>
                    <%: item.Producto.Descripcion %>
                </td>
                <td>                 
                    <%: item.TipoCarga %>
                </td>
                <td>
                    <%: item.Cantidad %>
                </td>
                <td>
                    <%: item.Peso %>
                </td>
                <td>
                    <%: item.Importe %>
                </td>
            </tr>
    
        <% } %>
        </tbody>
        </table>  
        <br />
         
        <div class="editor-label">
            Peso Total (Kg.)
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.PesoTotal, new Dictionary<string, object>() { { "readonly", "true" } })%>            
        </div>
        
        <div class="editor-label">
            Importe Total (S/.)
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ImporteTotal, new Dictionary<string, object>() { { "readonly", "true" } })%>            
        </div>

        <br />

        
        <div class="editor-label">
            Modalidad Pago
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TipoPago, new Dictionary<string, object>() { { "readonly", "true" } })%>     
        </div>
        <br />
        
        <div class="editor-label">
            Observacion
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Observacion, new Dictionary<string, object>() { { "readonly", "true" } })%>
        </div>
        <br />
        
        <div class="editor-label">
            Código Seguridad
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.ClaveSeguridad, new Dictionary<string, object>() { { "readonly", "true" } , { "value", Model.ClaveSeguridad }})%>
        </div>
        <div>
            
        </div>
    </fieldset>
    
    <p><%: Html.ValidationSummary() %></p>
    <p><%: ViewData["Mensaje"] %></p>
    <p>
        <input type="submit" value="Aceptar" /> 
        <%: Html.ActionLink("Cancelar", "Index") %>
    </p>
    <% } %>

</asp:Content>
