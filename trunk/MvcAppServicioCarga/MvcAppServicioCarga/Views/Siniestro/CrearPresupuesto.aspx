<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<MvcAppServicioCarga.Models.Siniestro.MSPresupuesto>"%>


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



        var dialog;
        $(function () {        
            dialog = $("#cuerpoemergente").dialog({
                autoOpen: false,
                modal: true,
                resizable: false
            });

            //$(".datepicker").datepicker({ dateFormat: 'dd/mm/yy' });
        });


        function cargarInforme(json) {
            console.log('cargando...', json);
            $("#hdnInformeAccidenteId").val(json.informeAccidenteId);

            $("#txtNumInforme").val(json.numInforme);
            $("#txtNumSiniestro").val(json.numSiniestro);

            $("#txtTipo").val(json.tipo);
            $("#txtFecSiniestro").val(json.fechaSiniestro);

            $("#txtLugar").val(json.lugar);
            $("#txtNumPoliza").val(json.numPoliza);

            $("#txtAsegurado").val(json.asegurado);

            $("#hdnMarcaId").val(json.marcaId);
            $("#hdnModeloId").val(json.modeloId);
            dialog.dialog("close");
        }

        function consultarInforme() {
            $.ajax({
                type: 'GET',
                url: '/Siniestro/ConsultarInforme',
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



        function cargarDetallePresupuesto() {
            var detallePresupuesto = {};
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
                        listDetalle.push(detalle);
                    }

                }
            });

            if (isValid) {
                detallePresupuesto["DetallePresupuesto"] = listDetalle;
                console.log("detallePresupuesto", detallePresupuesto);
                $("#txtDetalle").val(JSON.stringify(detallePresupuesto));
            }
            return isValid;
        }


        function calcularTotalesDetalle() {
            var SubTotal = 0;
            var Igv = 0;
            var Total = 0;

            var PesoTotal = 0;
            var ImporteTotal = 0;
            $("#tblDetalle tbody tr").map(function (index, elem) {
                var precio = $(this).find('#lblPrecio').text();
                if (precio && precio != '') {
                    Total += parseFloat(precio);
                }
            });

            SubTotal = (Total / 1.18).toFixed(2);
            Igv = (Total - SubTotal).toFixed(2);

            $("#txtSubTotal").val(SubTotal);
            $("#txtIGV").val(Igv);
            $("#txtTotal").val(Total);
        }

        function cargarListaPrecio(json) {
            console.log('cargando...', json);

            var table = $("#tblDetalle");

            var detalle = $("#rowDetalle").find("tbody tr").clone();

            detalle.find("#lblListaPrecioId").append(json.listaPrecioId);
            detalle.find("#lblDescripcion").append(json.descripcion);
            detalle.find("#lblPrecio").append(json.precio);

            table.find("tbody").append(detalle);

            detalle.find("#lnkEliminar").click(function () {
                detalle.remove();
                calcularTotalesDetalle();
            });

            calcularTotalesDetalle();

            dialog.dialog("close");

        }

        function consultarListaPrecio() {
            $("#lblDetalleError").empty();
            var marcaId = $("#hdnMarcaId").val();
            var modeloId = $("#hdnModeloId").val();

            if (!marcaId || !modeloId) {
                $("#lblDetalleError").append("Se requiere consultar Informe Accidente Vehicular");
            }

            console.log('Solicitando ConsultarListaPrecio', marcaId, modeloId);

            $.ajax({
                type: 'GET',
                url: '/Siniestro/ConsultarListaPrecio',
                data: { "marcaId": marcaId, "modeloId": modeloId },
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


    </script>
    
        <br />

    
    <div id="cuerpoemergente"></div>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
    <label>Agregar Presupuesto</label>

    <fieldset>
        <legend>Datos del Accidente Vehicular</legend>        
        <%: Html.TextBoxFor(model => model.MS_Informe_Accidente_Id, new Dictionary<string, object>() { {"id", "hdnInformeAccidenteId"}, { "type", "text" }, { "style", "visibility:hidden; position:absolute;" },
                { "data-val-required", "Se requiere consultar Informe Accidente Vehicular" } , {"data-val-number", "Se requiere consultar Informe Accidente Vehicular"} ,
                {"data-val-range", "Se requiere consultar Informe Accidente Vehicular"}, {"data-val-range-min", "1"}})%>

        <div class="editor-label">
            Número Accidente Vehicular
        </div>
        <div class="editor-field">
            <input id="txtNumInforme" disabled />
        </div>
        <div class="editor-label">
            Número Siniestro
        </div>
        <div class="editor-field">
            <input id="txtNumSiniestro" disabled />
        </div>    
        <br />
            
        <div class="editor-label">
            Tipo Siniestro
        </div>

        <div class="editor-field">
            <input id="txtTipo" disabled />
        </div>
            
        <div class="editor-label">
            Fecha Siniestro
        </div>

        <div class="editor-field">            
            <input id="txtFecSiniestro" disabled />
        </div>

        <br />

        <div class="editor-label">
            Lugar
        </div>
        <div class="editor-field"> 
            <input id="txtLugar" disabled />
        </div>      
        <div class="editor-label">
            Número Póliza
        </div>
        <div class="editor-field"> 
            <input id="txtNumPoliza" disabled />
        </div>  

        <br /> 

        <div class="editor-label">
            Asegurado
        </div>
        <div class="editor-field"> 
            <input id="txtAsegurado" disabled />
        </div>   
         
        <div style="display:inline">   
            <a href="#" onclick="consultarInforme()" >Consultar</a>
        </div>
        
        <input id="hdnMarcaId" type="hidden" />
        
        <input id="hdnModeloId" type="hidden"  />
    </fieldset>

    
        <br />

    <fieldset>
        <legend>Datos del Presupuesto</legend>
        <div class="editor-label">
            Número Presupuesto:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.NumPresupuesto, new Dictionary<string, object>() { {"id", "txtNumPresupuesto"} , {"readonly", true}})%>
        </div>
        <br />  
        <!--<div class="editor-label">
            Fecha Presupuesto:
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.FechaPresupuesto, new Dictionary<string, object>() { {"class","datepicker"} })%>
        </div>-->
        <br />  
            
    </fieldset>
    
        <br />
    
    <fieldset>
        <legend>Detalle del Presupuesto</legend>         
        <div style="display:inline"> 
            <a href="#" onclick="consultarListaPrecio()" >Agregar</a>              
        </div>
        
        <div id="rowDetalle" style="display:none;">   
            <table>
                <tr>
                    <td>
                        <label id="lblListaPrecioId" class="inputValue" data-name="MS_Lista_Precio_Id" ></label>
                    </td>
                    <td>
                        <label id="lblDescripcion"></label>
                    </td>
                    <td>
                        <label id="lblPrecio" class="inputValue" data-name="Importe"></label>
                    </td>
                    <td>
                        <input id="txtObservacion" class="inputValue" data-name="Observacion" />
                    </td>
                    <td>
                        <a id="lnkEliminar" href="#" >Eliminar</a>           
                    </td>
                </tr>
            </table>
        </div>

        <%: Html.TextBox("detallePresupuesto", Request["detallePresupuesto"], new Dictionary<string, object>() { {"id", "txtDetalle"},{ "type", "hidden" } })%>            
        <table id="tblDetalle">
            <thead>
                <tr>
                    <th>
                        Código
                    </th>
                    <th>
                        Descripción
                    </th>
                    <th>
                        Precio Unidad (S/.)
                    </th>
                    <th>
                        Observacion
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
            SUBTOTAL
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.SubTotal, new Dictionary<string, object>() { {"id","txtSubTotal"},{ "readonly", "true" },
    {"data-val-required" , "El valor Sub total debe ser mayor a 0"},
{"data-val-range" , "El valor Sub total debe ser mayor a 1"}, {"data-val-range-min", "1"}})%>            
        </div>

        <br />
        
        <div class="editor-label">
            IGV
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.IGV, new Dictionary<string, object>() { {"id","txtIGV"}, { "readonly", "true" },
    {"data-val-required" , "El valor IGV debe ser mayor a 0"},
{"data-val-range" , "El valor IGV debe ser mayor a 1"}, {"data-val-range-min", "1"}})%>            
        </div>

        <br />
        
        <div class="editor-label">
            TOTAL
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.Total, new Dictionary<string, object>() { {"id","txtTotal"}, { "readonly", "true" },
    {"data-val-required" , "El valor total debe ser mayor a 0"},
{"data-val-range" , "El valor total debe ser mayor a 1"}, {"data-val-range-min", "1"}})%>            
        </div>

        <br />
    </fieldset>
    
    <p><%: Html.ValidationSummary() %></p>
    <p>
        <% if (TempData["MensajeError"] != null)
           {%>
            <label class="validation-summary-errors"><%: TempData["MensajeError"] %></label>
        <%}%>
        <% if (TempData["Mensaje"] != null)
           {%>
            <label class="operation-success"><%: TempData["Mensaje"] %></label>
        <%}%>
    </p>
    <p>
        <input type="submit" onclick="return cargarDetallePresupuesto()" value="Grabar" /> 
        <%: Html.ActionLink("Cancelar", "ListaPresupuesto") %>
    </p>
    <% } %>

</asp:Content>
