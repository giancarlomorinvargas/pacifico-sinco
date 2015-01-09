<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<MvcAppServicioCarga.Models.ServicioCarga.MGFichaMovimiento>"%>


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

        function cargarProducto(json) {
            console.log('cargando...', json);

            var table = $("#tblDetalle");

            var detalle = $("#rowDetalle").find("tbody tr").clone();

            detalle.find("#lblProductoId").append(json.productoId);
            detalle.find("#lblDescripcion").append(json.descripcion);

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
                        var val_range = $(this).data("val-range");
                        var val_range_min = $(this).data("val-range-min");

                        if (isValid && val && (!/^-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?$/.test(v) || v <= val_range_min)) {
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


        function interpretarDetalleFichaCarga() {
            var listDetalle = [];
            var listDetalleSerializado = $("#txtDetalle").val();

            if (listDetalleSerializado && listDetalleSerializado != '') {
                listDetalle = JSON.parse(listDetalleSerializado);
                console.log("detalleFichaCarga", listDetalle);

                for (var index in listDetalle) {
                    var itemDetalle = listDetalle[index];

                    console.log('item', itemDetalle);
                    var json = {
                        detalleFichaCargaId: itemDetalle.MG_FichaCarga_MG_FichaCarga_ID,
                        fichaCargaId: itemDetalle.MG_FichaCarga_ID,
                        productoId: itemDetalle.MG_Producto_ID,
                        descripcion: itemDetalle.Producto.Descripcion,
                        cantidad: itemDetalle.Cantidad,
                        peso: itemDetalle.Peso,
                        importe: itemDetalle.Importe
                    };
                    cargarProducto(json);
                }

            }

        }

        var dialog;
        $(function () {
            dialog = $("#cuerpoemergente").dialog({
                autoOpen: false,
                modal: true,
                resizable: false
            });

            interpretarDetalleFichaCarga();

        });



    </script>
    
        <br />

    <asp:Label ID="Label1" runat="server" Text="Ficha Movimiento" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" 
           ForeColor="#000066"></asp:Label>
    
    <div id="cuerpoemergente"></div>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>        
            <%: Html.HiddenFor(model => model.UsuarioRegistra)%>   
            <%: Html.HiddenFor(model => model.UsuarioModifica)%>   
            <%: Html.HiddenFor(model => model.FechaModifica)%>   
        <div class="editor-label">
            Ficha Movimiento
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.MG_FichaMovimiento_ID, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
    
        <div class="editor-label">
            Ficha Carga
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.MG_FichaCarga_ID, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>

        <br />

    
        <div class="editor-label">
            Tipo Movimiento
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.MG_Tipo_Movimiento_ID)%>   
            <%: Html.TextBoxFor(model => model.TipoMovimiento.Descripcion, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
    
        <div class="editor-label">
            Fecha Hora
        </div>
        <div class="editor-field">
            <%: Html.TextBoxFor(model => model.FechaRegistra, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
    
        <br />

    
        <div class="editor-label">
            Agencia
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.MG_Agencia_ID)%>   
            <%: Html.TextBoxFor(model => model.Agencia.Descripcion, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
    
        <div class="editor-label">
            Estado
        </div>
        <div class="editor-field">
            <%: Html.HiddenFor(model => model.MG_Tipo_Movimiento_ID)%>   
            <%: Html.TextBoxFor(model => model.TipoMovimiento.Estado, new Dictionary<string, object>() { { "readonly", "true" } , { "data-val", "false" } })%>            
        </div>
        <br />

        
        <div class="editor-label">
            Observacion
        </div>
        <br />
        <div class="editor-field">
            <%: Html.TextAreaFor(model => model.Observacion, new Dictionary<string, object>() { { "data-val-required", "Se requiere ingresar la observación" }})%>            
        </div>
    
    
    <p><%: Html.ValidationSummary() %></p>
    <p><%: Session["Mensaje"] %></p>
    <p>
        <input type="submit" value="Aceptar" /> 
        <%: Html.ActionLink("Cancelar", "ListaFichaMovimiento") %>
    </p>
    <% } %>

</asp:Content>
