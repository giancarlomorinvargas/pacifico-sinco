<%@ Page Language="C#" %>
    
<script>
    function encriptarClaveSeguridad() {
        $("#frmIngresarClaveSeguridad #lblClaveError").empty();
        var v = $("#frmIngresarClaveSeguridad #ClaveSeguridad").val();
        var val_required = $("#frmIngresarClaveSeguridad #ClaveSeguridad").data("val-required");
        var val_length = $("#frmIngresarClaveSeguridad #ClaveSeguridad").data("val-length");
        var val_length_min = $("#frmIngresarClaveSeguridad #ClaveSeguridad").data("val-length-min");

        console.log('v', v, 'val_length_min', val_length_min, 'val_required', val_required);
        if (v == '') {
            $("#lblClaveError").append(val_required);
            return false;
        }
        if (v.length < val_length_min) {
            $("#lblClaveError").append(val_length);
            return false;
        }
        $.ajax({
            type: 'POST',
            url: $('#frmIngresarClaveSeguridad').attr('action'),
            data: $('#frmIngresarClaveSeguridad').serialize(),
            aync: false,
            success: function (data) {
                cargarClaveSeguridad(data);
            },
            error: function (a, b, e) {
                console.log('Error!', a, b, e);
            }
        });
    }

</script>
<Label ID="Label1"
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" >Clave de Seguridad</Label>
      
    <% using (Html.BeginForm("IngresarClaveSeguridad", "FichaCarga", FormMethod.Post, new { id = "frmIngresarClaveSeguridad", name = "frmIngresarClaveSeguridad" }))
       {%>
        
        
    <table class="style1">        
         <tr>
            <td>
                <span class="style3">
                    <strong style="color: #003399">Ingresar Clave Seguridad</strong>
                </span>
            </td>
        </tr>
         <tr>
            <td>
                <%: Html.Password("ClaveSeguridad", "", new Dictionary<string, object>() { {"id","ClaveSeguridad"},
{"data-val-required", "Ingresar Código de Seguridad para  registrar servicio"},{"data-val-length-min" , "4"} ,  {"data-val-length", "Ingresar mínimo 4 caracteres en el Código de Seguridad"} })%>
            </td>
        </tr>
        <tr>
            <td>
                <label id="lblClaveError" class="validation-summary-errors"></label>
            </td>
        </tr>
    </table>    

              <p><a href="#" onclick="return encriptarClaveSeguridad()" >Aceptar</a></p>  
    <% } %>
