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



        function ingresarClaveSeguridad() {
            $.ajax({
                type: 'GET',
                url: '/FichaCarga/IngresarClaveSeguridad',
                success: function (data) {
                    $("#cuerpoemergente").html(data);
                    dialog.dialog({
                        height: 250,
                        width: 450
                    }).dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });

            return false;
        }

        function cargarClaveSeguridad(clave) {
            $("#ClaveSeguridadIngresada").val(clave);
            dialog.dialog("close");
        }

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
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Ruta.AgenciaOrigen.Descripcion), new Dictionary<string, object>() { {"id", "txtAgenciaOrigen"}, { "readonly", "true" }, {"data-val", "false"}  })%>
            <!--input id="txtAgenciaOrigen" disabled /-->
        </div>
        <div class="editor-label">
            Agencia Destino:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Ruta.AgenciaDestino.Descripcion), new Dictionary<string, object>() { {"id", "txtAgenciaDestino"},  { "readonly", "true" }, {"data-val", "false"}  })%>
            <!--input id="txtAgenciaDestino" disabled /-->
        </div>        
        <br />
            
        <div class="editor-label">
            Fecha Salida:
        </div>

        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.FechaOrigen), new Dictionary<string, object>() { {"id", "txtFecSalida"},  { "readonly", "true" }, {"data-val", "false"}  })%>
            <!--input id="txtFecSalida" disabled /-->
        </div>
            
        <div class="editor-label">
            Fecha Llegada:
        </div>

        <div class="editor-field">            
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.FechaDestino), new Dictionary<string, object>() { {"id", "txtFecLlegada"},  { "readonly", "true" }, {"data-val", "false"}  })%>
            <!--input id="txtFecLlegada" disabled /-->
        </div>

        <br />
        <div class="editor-label">
            Unidad Transporte:
        </div>

        <div class="editor-field"> 
            <%: Html.TextBoxFor(model => (model.ProgramacionRuta.Vehiculo.Placa), new Dictionary<string, object>() { {"id", "txtUnidadTransporte"},  { "readonly", "true" }, {"data-val", "false"}   })%>
            <!--input id="txtUnidadTransporte" disabled /-->
        </div>
    </fieldset>

    
    <fieldset>
        <legend>Datos de Carga</legend>
        
        <%: Html.HiddenFor(model => model.UsuarioRegistra)%>        
        <%: Html.HiddenFor(model => model.UsuarioModifica)%>

        <%: Html.HiddenFor(model => model.FechaRegistra)%>
        <%: Html.HiddenFor(model => model.FechaRegistro)%>
        
        <%: Html.HiddenFor(model => model.FechaModifica)%>
        <%: Html.HiddenFor(model => model.EstadoPago)%>
        <%: Html.HiddenFor(model => model.Estado)%>
        
        <!--Se hace un artilugio para persistir la informacion-->
        <%: Html.HiddenFor(model => model.Remitente.Nombres)%>    
        <%: Html.HiddenFor(model => model.Remitente.ApellidosPaterno)%>         
        <%: Html.HiddenFor(model => model.Destinatario.Nombres)%>
        <%: Html.HiddenFor(model => model.Destinatario.ApellidosPaterno)%>   

        <%: Html.TextBoxFor(model => model.MG_Remitente_ID, new Dictionary<string, object>() { {"id", "hdnRemitenteId"}, { "type", "hidden" } })%>
        <div class="editor-label">
            Remitente:
        </div>
        <div class="editor-field">
            
            <%: Html.TextBox("txtRemitente",Model.Remitente.Nombres + ' ' + Model.Remitente.ApellidosPaterno, new Dictionary<string, object>() { {"id", "txtRemitente"}, { "readonly", "true" }, {"data-val", "false"} })%>
            <!--input id="txtRemitente" disabled /-->    
        </div>
            
        <br />            
        <%: Html.TextBoxFor(model => model.MG_Destinatario_ID, new Dictionary<string, object>() { {"id", "hdnDestinatarioId"}, { "type", "hidden" } })%>
        <div class="editor-label">
            Destinatario:
        </div>
        <div class="editor-field">
            <%: Html.TextBox("txtDestinatario", Model.Destinatario.Nombres + ' ' + Model.Destinatario.ApellidosPaterno, new Dictionary<string, object>() { {"id", "txtDestinatario"}, { "readonly", "true" }, {"data-val", "false"}  })%>
            <!--input id="txtDestinatario" disabled /-->    
        </div>

        <br />
        <br />
        
        <div>   
                          
        </div>

        <div class="editor-label">
            Peso Total
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.PesoTotal, new Dictionary<string, object>() { { "readonly", "true" } , {"data-val", "false"}})%>            
        </div>
        
        <div class="editor-label">
            Importe Total
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ImporteTotal, new Dictionary<string, object>() { { "readonly", "true" } , {"data-val", "false"}})%>            
        </div>

        <br />

        
        <div class="editor-label">
            Tipo Pago
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.TipoPago, new Dictionary<string, object>() { { "readonly", "true" } , {"data-val", "false"}})%>     
        </div>
        <br />
        
        <div class="editor-label">
            Observacion
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Observacion, new Dictionary<string, object>() { { "readonly", "true" } , {"data-val", "false"}})%>
        </div>
        <br />
        
        <div class="editor-label">
            Código Seguridad
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.ClaveSeguridad, new Dictionary<string, object>() { { "readonly", "true" } , { "value", Model.ClaveSeguridad }})%>
        </div>
        <br />
        <div class="editor-label">
            Código Comprobante Pago
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.ComprobantePago.MG_ComprobantePago_ID)%>
            <%: Html.TextBoxFor(model => model.ComprobantePagoIDIngresado, new Dictionary<string, object>() { 
{"data-val" , "true"}, {"data-val-required" , "Ingresar Código de Pago para validar el pago"}})%>
        </div>
        <div>
            
        </div>
    </fieldset>
    
    <p><%: Html.ValidationSummary() %></p>
    <p><%: ViewData["Mensaje"] %></p>
    <p>
        <input type="submit" value="Aceptar" /> 
        <%: Html.ActionLink("Regresar al listado", "Index") %>
    </p>
    <% } %>

</asp:Content>
