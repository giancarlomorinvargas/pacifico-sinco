<%@ Page Language="C#" %>
    



    <br /><Label ID="Label1" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" > Lista de Programaciones de Rutas</Label>
       <br />
    <table>
    <tr>
        <th>
            Fecha Salida
        </th>
        <th>
            Fecha Llegada
        </th>
        <th>
            Unidad Transporte
        </th>
        <th>
            Ruta
        </th>
        <th>
            Opción
        </th>
    </tr>
    <% foreach (var item in (IEnumerable<MvcAppServicioCarga.Models.ServicioCarga.MGProgramacionRuta>)ViewBag.ListadoProgramacionRuta)
       { %>
    
        <tr>
            <td>
                <%: item.FechaOrigen %>
            </td>
            <td>
                <%: item.FechaDestino %>
            </td>
            <td>
                <%: item.Vehiculo.Placa%>
            </td>
            <td>
                <%: item.Ruta.Descripcion%>
            </td>
            <td>
                <a href="#" style="width:40px;"
                    onclick="cargarProgramacionRuta({programacionRutaId:'<%: item.IdProgramacionRuta %>',
                    fechaOrigen:'<%: item.FechaOrigen %>',
                    fechaDestino:'<%: item.FechaDestino %>',
                    placa:'<%: item.Vehiculo.Placa %>',
                    agenciaOrigen:'<%: item.Ruta.AgenciaOrigen.Descripcion%>',
                    agenciaDestino:'<%: item.Ruta.AgenciaDestino.Descripcion %>'})">Seleccionar</a>
            </td>
        </tr>
    
    <% } %>
        
    </table>    


    <br />
    

    <table class="style6">
        <tr>
            <td><%: Session["Mensaje"]%></td>
        </tr>
    </table>