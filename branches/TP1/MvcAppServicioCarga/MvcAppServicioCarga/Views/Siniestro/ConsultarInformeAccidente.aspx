<%@ Page Language="C#" %>
    



    <br /><Label ID="Label1" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" > Lista de Informe Accidente Vehicular</Label>
       <br />
    <table>
    <tr>
        <th>
            Número Accidente
        </th>
        <th>
            Número Siniestro
        </th>
        <th>
            Asegurado
        </th>
        <th>
            Lugar Siniestro
        </th>
        <th>
            Estado
        </th>
        <th>
            Opción
        </th>
    </tr>
    <% foreach (var item in (IEnumerable<MvcAppServicioCarga.Models.Siniestro.MSInformeAccidente>)ViewBag.ListadoInformeAccidente)
       { %>
    
        <tr>
            <td>
                <%: item.NumInforme %>
            </td>
            <td>
                <%: item.Siniestro.NumSiniestro %>
            </td>
            <td>
                <%: item.Siniestro.Poliza.Asegurado.Nombre + " " + item.Siniestro.Poliza.Asegurado.ApellidoPaterno + " " + item.Siniestro.Poliza.Asegurado.ApellidoMaterno%>
            </td>
            <td>
                <%: item.Siniestro.Lugar%>
            </td>
            <td>
                <%: item.Estado%>
            </td>
            <td>
                <a href="#" style="width:40px;"
                    onclick="cargarInforme({informeAccidenteId:'<%: item.MS_Informe_Accidente_Id %>',
                    numInforme:'<%: item.NumInforme %>',
                    numSiniestro:'<%: item.Siniestro.NumSiniestro %>',
                    tipo:'<%: item.Siniestro.Tipo %>',
                    fechaSiniestro:'<%: item.Siniestro.FechaSiniestro%>',
                    lugar:'<%: item.Siniestro.Lugar%>',
                    numPoliza:'<%: item.Siniestro.Poliza.NumPoliza %>',
                    marcaId:'<%: item.Siniestro.Poliza.Vehiculo.MP_Marca_Id %>',
                    modeloId:'<%: item.Siniestro.Poliza.Vehiculo.MP_Modelo_Id %>',
                    asegurado:'<%: item.Siniestro.Poliza.Asegurado.Nombre + " " + item.Siniestro.Poliza.Asegurado.ApellidoPaterno + " " + item.Siniestro.Poliza.Asegurado.ApellidoMaterno%>'})">Seleccionar</a>
            </td>
        </tr>
    
    <% } %>
        
    </table>    


    <br />
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