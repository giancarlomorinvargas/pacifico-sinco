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
        input:read-only, textarea:read-only {
        color: rgb(84, 84, 84);
        background-color: rgb(235, 235, 228);
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
                url: '/ServicioCarga/FichaCarga/ConsultarCliente',
                data: { "rol": rol },
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
                url: '/ServicioCarga/FichaCarga/IngresarClaveSeguridad',
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
                url: '/ServicioCarga/FichaCarga/ConsultarProgramacion',
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

        function cargarProducto(json) {
            console.log('cargando...', json);

            var table = $("#tblDetalle");

            var detalle = $("#rowDetalle").find("tbody tr").clone();

            detalle.find("#lblProductoId").append(json.productoId);
            detalle.find("#lblDescripcion").append(json.descripcion);
            detalle.find("#lblTipoCarga").append(json.tipo);

            detalle.find("#txtCantidad").val(json.cantidad);
            detalle.find("#txtPeso").val(json.peso);
            detalle.find("#txtImporte").val(json.importe);

            if (json.fichaCargaId && json.fichaCargaId != '') {
                detalle.find("#hdnFichaCargaId").val(json.fichaCargaId);
            }

            if (json.detalleFichaCargaId && json.detalleFichaCargaId != '') {
                detalle.find("#hdnDetalleFichaCargaId").val(json.detalleFichaCargaId);
            }


            table.find("tbody").append(detalle);

            detalle.find("#lnkEliminar").click(function () {
                detalle.remove();
                calcularTotalesDetalleFichaCarga();
            });

            detalle.find("#txtPeso").blur(function () {
                if (!detalle.find("#txtPeso").hasClass("input-validation-error")) {
                    calcularTotalesDetalleFichaCarga();
                }
            }).on("keypress", function (evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                    return false;
                }
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            });

            detalle.find("#txtImporte").blur(function () {
                if (!detalle.find("#txtImporte").hasClass("input-validation-error")) {
                    calcularTotalesDetalleFichaCarga();
                }
            }).on("keypress", function (evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode == 46 && evt.srcElement.value.split('.').length > 1) {
                    return false;
                }
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            });

            detalle.find("#txtCantidad").on("keypress", function (evt) {
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode == 46 && evt.srcElement.value.split('.').length > 0) {
                    return false;
                }
                if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
                    return false;
                return true;
            })


            dialog.dialog("close");

        }

        function consultarProducto() {
            $.ajax({
                type: 'GET',
                url: '/ServicioCarga/FichaCarga/ConsultarProducto',
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



        var dialog;
        $(function () {
            dialog = $("#cuerpoemergente").dialog({
                autoOpen: false,
                modal: true,
                resizable: false
            });
            interpretarDetallePresupuesto();

        });


        function interpretarDetallePresupuesto() {
            var listDetalle = [];
            var listDetalleSerializado = $("#txtDetalle").val();

            if (listDetalleSerializado && listDetalleSerializado != '') {
                listDetalle = JSON.parse(listDetalleSerializado);

                listDetalle = listDetalle["DetallePresupuesto"] ? listDetalle["DetallePresupuesto"] : listDetalle;

                console.log("detallePresupuesto", listDetalle);

                for (var index in listDetalle) {
                    var itemDetalle = listDetalle[index];

                    console.log('item', itemDetalle);
                    var json = {
                        detallePresupuestoId: itemDetalle.MS_Detalle_Presupuesto_Id,
                        presupuestoId: itemDetalle.MS_Presupuesto_Id,
                        listaPrecioId: itemDetalle.MS_Lista_Precio_Id,
                        descripcion: itemDetalle.ListaPrecio ? itemDetalle.ListaPrecio.Descripcion : itemDetalle.Descripcion,
                        precio: itemDetalle.ListaPrecio ? itemDetalle.ListaPrecio.Precio : itemDetalle.Precio,
                        observacion: itemDetalle.Observacion
                    };
                    cargarListaPrecio(json);
                }

            }

        }

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

            if (json.presupuestoId && json.presupuestoId != '') {
                detalle.find("#hdnPresupuestoId").val(json.presupuestoId);
            }

            if (json.detallePresupuestoId && json.detallePresupuestoId != '') {
                detalle.find("#hdnDetallePresupuestoId").val(json.detallePresupuestoId);
            }

            if (json.observacion && json.observacion != '') {
                detalle.find("#txtObservacion").val(json.observacion);
            }


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
        
    <label>Modificar Presupuesto</label>
     
    <fieldset>
        <legend>Datos del Accidente Vehicular</legend>        
        <%: Html.TextBoxFor(model => model.MS_Informe_Accidente_Id, new Dictionary<string, object>() { {"id", "hdnInformeAccidenteId"}, { "type", "text" }, { "style", "visibility:hidden; position:absolute;" },
                { "data-val-required", "Se requiere consultar Informe Accidente Vehicular" } , {"data-val-number", "Se requiere consultar Informe Accidente Vehicular"} ,
                {"data-val-range", "Se requiere consultar Informe Accidente Vehicular"}, {"data-val-range-min", "1"}})%>

        <div class="editor-label">
            Número Accidente Vehicular
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.InformeAccidente.NumInforme), new Dictionary<string, object>() { {"id", "txtNumInforme"}, { "disabled", "true" } })%>
        </div>
        <div class="editor-label">
            Número Siniestro
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.InformeAccidente.Siniestro.NumSiniestro), new Dictionary<string, object>() { {"id", "txtNumSiniestro"}, { "disabled", "true" } })%>
        </div>  
        <br />
            
        <div class="editor-label">
            Tipo Siniestro
        </div>

        <div class="editor-field">
            <%: Html.TextBoxFor(model => (model.InformeAccidente.Siniestro.Tipo), new Dictionary<string, object>() { {"id", "txtTipo"}, { "disabled", "true" } })%>
        </div>
            
        <div class="editor-label">
            Fecha Siniestro
        </div>

        <div class="editor-field">            
            <%: Html.TextBoxFor(model => (model.InformeAccidente.Siniestro.FechaSiniestro), new Dictionary<string, object>() { {"id", "txtFecSiniestro"}, { "disabled", "true" } })%>
        </div>
        <br />
            
        <div class="editor-label">
            Lugar
        </div>
        <div class="editor-field"> 
            <%: Html.TextBoxFor(model => (model.InformeAccidente.Siniestro.Lugar), new Dictionary<string, object>() { {"id", "txtLugar"}, { "disabled", "true" } })%>
        </div>  
            
        <div class="editor-label">
            Número Póliza
        </div>
        <div class="editor-field"> 
            <%: Html.TextBoxFor(model => (model.InformeAccidente.Siniestro.Poliza.NumPoliza), new Dictionary<string, object>() { {"id", "txtNumPoliza"}, { "disabled", "true" } })%>
        </div>  
        <br /> 
        <div class="editor-label">
            Asegurado
        </div>
        <div class="editor-field"> 
            <%: Html.TextBox("txtAsegurado", Model.InformeAccidente.Siniestro.Poliza.Asegurado.Nombre + " " + Model.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoPaterno
     + " " + Model.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoMaterno, new Dictionary<string, object>() { {"id", "txtAsegurado"}, { "disabled", "true" } })%>
        </div>  
        <div style="display:inline">   
            <a href="#" onclick="consultarInforme()" >Consultar</a>
        </div>
        <%: Html.HiddenFor(model => (model.InformeAccidente.Siniestro.Poliza.Vehiculo.MP_Marca_Id), new Dictionary<string, object>() { {"id", "hdnMarcaId"}})%>
        <%: Html.HiddenFor(model => (model.InformeAccidente.Siniestro.Poliza.Vehiculo.MP_Modelo_Id), new Dictionary<string, object>() { {"id", "hdnModeloId"}})%>
    </fieldset>

    
    <fieldset>
        <legend>Datos del Presupuesto</legend>
        
        <%: Html.HiddenFor(model => model.MS_Presupuesto_Id)%>   
        <%: Html.HiddenFor(model => model.FechaPresupuesto)%>   

        <%: Html.HiddenFor(model => model.UsuarioRegistro)%>   
        <%: Html.HiddenFor(model => model.FechaRegistro)%>     
        <%: Html.HiddenFor(model => model.UsuarioModifico)%>
        <%: Html.HiddenFor(model => model.FechaModifico)%>        
        <%: Html.HiddenFor(model => model.Estado)%>
         
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
                        <input id="hdnPresupuestoId" type="hidden" class="inputValue" data-name="MS_Presupuesto_Id"/>
                        <input id="hdnDetallePresupuestoId" type="hidden" class="inputValue" data-name="MS_Detalle_Presupuesto_Id"/>
                        <a id="lnkEliminar" href="#" >Eliminar</a>           
                    </td>
                </tr>
            </table>
        </div>
        
        <%: Html.TextBox("detallePresupuesto", Session["detallePresupuesto"], new Dictionary<string, object>() { {"id", "txtDetalle"},{ "type", "hidden" } })%>            
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
        <input type="submit" onclick="return cargarDetallePresupuesto()" value="Aceptar" /> 
        <%: Html.ActionLink("Cancelar", "ListaPresupuesto") %>
    </p>
    <% } %>

</asp:Content>
