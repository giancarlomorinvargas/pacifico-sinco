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
        .inputValue {
            width: 80px;
        }
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: left;
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
                data:{"rol":rol},
                success: function (data) {

                    $("#cuerpoemergente").html(data);

                    dialog.dialog({
                        height: 500,
                        width: 850
                    }).dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });

            return false;
        }

        function ingresarClaveSeguridad() {
            $.ajax({
                type: 'GET',
                url: '/FichaCarga/IngresarClaveSeguridad',
                success: function (data) {
                    $("#cuerpoemergente").html(data);
                    dialog.dialog({
                        height: 250,
                        width: 450}).dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });

            return false;
        }

        function cargarClaveSeguridad(clave) {
            $("#ClaveSeguridad").val(clave);
            dialog.dialog("close");
        }


        function cargarProgramacionRuta(progRutaJson) {
            console.log('cargando...', progRutaJson);
            $("#hdnProgramacionRutaId").val(progRutaJson.programacionRutaId);

            $("#txtAgenciaOrigen").val(progRutaJson.agenciaOrigen);
            $("#txtAgenciaDestino").val(progRutaJson.agenciaDestino);

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

                    dialog.dialog({
                        height: 500,
                        width: 850
                    }).dialog("open");
                },
                error: function (a, b, e) {
                    console.log("Error!")
                }
            });
             
            return false;
        }



        function cargarDetalleFichaCarga() {
            var detalleFichaCarga = {};
            var listDetalle = [];

            var isValid = true;
            $("#lblDetalleError").empty();
            $("#tblDetalle .inputValue").removeClass("input-validation-error");

            $("#tblDetalle tbody tr").map(function (index, elem) {
                if (isValid) {

                    var detalle = {};

                    $('.inputValue', this).each(function () {
                        var k = $(this).data("name");
                        var v = $(this).val() || $(this).text();
                        var val = $(this).data("val");
                        var val_dec = $(this).data("val-decimal");
                        var val_range = $(this).data("val-range");
                        var val_range_min = $(this).data("val-range-min");
                        
                        if (isValid && val && val_dec && (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(v) || v <= val_range_min)) {
                            $(this).addClass("input-validation-error");
                            $("#lblDetalleError").append(val_range);
                            isValid = false;
                        } else if (isValid && val && !val_dec && (!/^\d+$/.test(v) || v <= val_range_min)) {
                            $(this).addClass("input-validation-error");
                            $("#lblDetalleError").append(val_range);
                            isValid = false;
                        } else if (isValid) {

                            if (v && v != '') {
                                detalle[k] = v;
                            }
                        }
                        
                    });

                    if (isValid) {
                        //Borrar estos datos, debido a la bd
                        /*detalle["ProductoTemp"] = "N/A";
                        detalle["Descripcion"] = "N/A";*/
                        listDetalle.push(detalle);
                    }
                    
                }
            });
            
            if (isValid) {
                detalleFichaCarga["DetalleFichaCarga"] = listDetalle;
                console.log("detalleFichaCarga", detalleFichaCarga);
                $("#txtDetalle").val(JSON.stringify(detalleFichaCarga));
            }
            return isValid;
        }


        function calcularTotalesDetalleFichaCarga() {
            var PesoTotal = 0;
            var ImporteTotal = 0;
            $("#tblDetalle tbody tr").map(function (index, elem) {
                var peso = $(this).find('#txtPeso').val();
                var importe = $(this).find('#txtImporte').val();

                if (peso && peso != '') {
                    PesoTotal += parseFloat(peso);
                }
                if (importe && importe != '') {
                    ImporteTotal += parseFloat(importe);
                }
            });

            $("#PesoTotal").val(PesoTotal);
            $("#ImporteTotal").val(ImporteTotal);
            console.log('PesoTotal', PesoTotal);
        }

        function cargarProducto(json) {
            console.log('cargando...', json);

            var table = $("#tblDetalle");

            var detalle = $("#rowDetalle").find("tbody tr").clone();

            detalle.find("#lblProductoId").append(json.productoId);
            detalle.find("#lblDescripcion").append(json.descripcion);

            table.find("tbody").append(detalle);

            detalle.find("#lnkEliminar").click(function () {
                detalle.remove();
                calcularTotalesDetalleFichaCarga();
            });

            detalle.find("#txtPeso").blur(function () {
                if (!detalle.find("#txtPeso").hasClass("input-validation-error")) {
                    calcularTotalesDetalleFichaCarga();
                }                
            });

            detalle.find("#txtImporte").blur(function () {
                if (!detalle.find("#txtImporte").hasClass("input-validation-error")) {
                    calcularTotalesDetalleFichaCarga();
                }
            });

            dialog.dialog("close");

        }

        function consultarProducto() {
            $.ajax({
                type: 'GET',
                url: '/FichaCarga/ConsultarProducto',
                success: function (data) {
                    $("#cuerpoemergente").html(data);

                    dialog.dialog({
                        height: 500,
                        width: 850
                    }).dialog("open");
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
                modal: true,
                resizable: false
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
            <%: Html.TextBoxFor(model => model.MG_FichaCarga_ID, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
        

    <fieldset>
        <legend>Datos de Programación Ruta</legend>
        <%: Html.TextBoxFor(model => model.MK_ProgramacionRuta_ID, new Dictionary<string, object>() { {"id", "hdnProgramacionRutaId"}, { "type", "text" }, { "style", "visibility:hidden; position:absolute;" },
                { "data-val-required", "Se requiere consultar Programación de Ruta" } , {"data-val-number", "Se requiere consultar Programación de Ruta"} })%>
        <div class="editor-label">
            Agencia Origen:
        </div>
        <div class="editor-field">
            <input id="txtAgenciaOrigen" disabled />
        </div>
        <div class="editor-label">
            Agencia Destino:
        </div>
        <div class="editor-field">
            <input id="txtAgenciaDestino" disabled />
        </div>    
        <br />
            
        <div class="editor-label">
            Fecha Salida:
        </div>

        <div class="editor-field">
            <input id="txtFecSalida" disabled />
        </div>
            
        <div class="editor-label">
            Fecha Llegada:
        </div>

        <div class="editor-field">            
            <input id="txtFecLlegada" disabled />
        </div>

        <br />
        <div class="editor-label">
            Unidad Transporte:
        </div>

        <div class="editor-field"> 
            <input id="txtUnidadTransporte" disabled />
        </div>       
         
        <div style="display:inline">   
            <a href="#" onclick="consultarProgramacionRuta()" >Consultar Programación</a>
        </div>
    </fieldset>

    
    <fieldset>
        <legend>Datos de Carga</legend>
        <%: Html.TextBoxFor(model => model.MG_Remitente_ID, new Dictionary<string, object>() { {"id", "hdnRemitenteId"}, { "type", "text" }, { "style", "visibility:hidden; position:absolute;" },
                { "data-val-required", "Se requiere consultar Remitente" }  , {"data-val-number", "Se requiere consultar Remitente"} })%>
        <div class="editor-label">
            Remitente:
        </div>
        <div class="editor-field">
            <input id="txtRemitente" disabled />    
        </div>
        <div style="display:inline">   
            <a href="#" onclick="consultarCliente(1)" >Consultar Remitente</a>       
        </div>
            
        <br />            
        <%: Html.TextBoxFor(model => model.MG_Destinatario_ID, new Dictionary<string, object>() { {"id", "hdnDestinatarioId"},  { "type", "text" }, { "style", "visibility:hidden; position:absolute;" },
                { "data-val-required", "Se requiere consultar Destinatario" }   , {"data-val-number", "Se requiere consultar Destinatario"} })%>
        <div class="editor-label">
            Destinatario:
        </div>
        <div class="editor-field">
            <input id="txtDestinatario" disabled />    
        </div>
        <div style="display:inline"> 
            <a href="#" onclick="consultarCliente(2)" >Consultar Destinatario</a>              
        </div>

        <br />
        <br />
        
        <div style="display:inline"> 
            <a href="#" onclick="consultarProducto()" >Agregar Producto</a>              
        </div>
        
        <div id="rowDetalle" style="display:none;">   
            <table>
                <tr>
                    <td>
                        <label id="lblProductoId" class="inputValue" data-name="MG_Producto_ID"></label>
                    </td>
                    <td>
                        <label id="lblDescripcion"></label>
                    </td>
                    <td>                 
                        <%: Html.DropDownList("txtTipoCarga", new SelectList((List<SelectListItem>)Session["ListadoTipoCarga"], "Value", "Text"), new Dictionary<string, object>() { {"class", "inputValue"} , {"data-name", "TipoCarga"}} ) %>
                    </td>
                    <td>
                        <input id="txtCantidad" type="text" class="inputValue" data-name="Cantidad" data-val="true" data-val-decimal="false" data-val-range="La cantidad debe ser mayor a 0 y/o entero" data-val-range-min="0"/>
                    </td>
                    <td>
                        <input id="txtPeso" type="text" class="inputValue" data-name="Peso" data-val="true" data-val-decimal="true" data-val-range="El peso debe ser mayor a 0" data-val-range-min="0"/>
                    </td>
                    <td>
                        <input id="txtImporte" type="text" class="inputValue" data-name="Importe" data-val="true" data-val-decimal="true" data-val-range="El importe debe ser mayor a 0" data-val-range-min="0"/>
                    </td>
                    <td>
                        <a id="lnkEliminar" href="#" >Eliminar</a>           
                    </td>
                </tr>
            </table>
        </div>

        <%: Html.TextBox("detalleFichaCarga", Request["detalleFichaCarga"], new Dictionary<string, object>() { {"id", "txtDetalle"},{ "type", "hidden" } })%>            
        <table id="tblDetalle">
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
                    <th>
                        Opción
                    </th>
                </tr> 
            </thead>
            <tbody></tbody>
        </table>
        <b><label id="LabelIGV">Todos los precios incluyen IGV.</label></b>
        <label id="lblDetalleError" class="validation-summary-errors"></label>

        <br />
         
        <div class="editor-label">
            Peso Total (Kg.)
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.PesoTotal, new Dictionary<string, object>() { { "readonly", "true" },
    {"data-val-required" , "El valor peso total debe ser mayor a 1"},
{"data-val-range" , "El valor peso total debe ser mayor a 1"}, {"data-val-range-min", "1"}})%>            
        </div>
        
        <div class="editor-label">
            Importe Total (S/.)
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.ImporteTotal, new Dictionary<string, object>() { { "readonly", "true" },
    {"data-val-required" , "El valor importe total debe ser mayor a 1"},
{"data-val-range" , "El valor importe total debe ser mayor a 1"}, {"data-val-range-min", "1"}})%>            
        </div>

        <br />

        
        <div class="editor-label">
            Modalidad Pago
        </div>
        <div class="editor-field">
            <%: Html.DropDownListFor(model => model.TipoPago, new SelectList((List<SelectListItem>)Session["ListadoTipoPago"], "Value", "Text"))  %> 
        </div>
        <br />
        
        <div class="editor-label">
            Observación
        </div>
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Observacion, new Dictionary<string, object>() { {"data-val" , "true"}, {"data-val-required" , "Ingresar la observación"}})  %> 
        </div>
        <br />
        
        <div class="editor-label">
            Código Seguridad
        </div>
        <div class="editor-field">
            <%: Html.PasswordFor(model => model.ClaveSeguridad, new Dictionary<string, object>() { { "readonly", "true" }, 
            {"data-val" , "true"}, {"data-val-required" , "Ingresar Código de Seguridad para  registrar servicio"}} )%>       
        </div>
        <div style="display:inline">
            <a href="#" onclick="ingresarClaveSeguridad()" >Ingresar Código</a>  
        </div>
    </fieldset>
    
    <p><%: Html.ValidationSummary() %></p>
    <p><%: Session["Mensaje"] %></p>
    <p>
        <input type="submit" onclick="return cargarDetalleFichaCarga()" value="Aceptar" /> 
        <%: Html.ActionLink("Cancelar", "Index") %>
    </p>
    <% } %>

</asp:Content>
