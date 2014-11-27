<%@ Page Language="C#" %>
    



    <br /><Label ID="Label1" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" > Lista de Precio</Label>
       <br />
    <table>
    <tr>
        <th>
            Código
        </th>
        <th>
            Marca
        </th>
        <th>
            Modelo
        </th>
        <th>
            Servicio
        </th>
        <th>
            Precio
        </th>
        <th>
            Opción
        </th>
    </tr>
    <% foreach (var item in (IEnumerable<MvcAppServicioCarga.Models.Siniestro.MSListaPrecio>)ViewBag.ListadoPrecio)
       { %>
    
        <tr>
            <td>
                <%: item.MS_Lista_Precio_Id %>
            </td>
            <td>
                <%: item.Marca.Descripcion %>
            </td>
            <td>
                <%: item.Modelo.Descripcion %>
            </td>
            <td>
                <%: item.Servicio.Descripcion %>
            </td>
            <td>
                <%: item.Precio%>
            </td>
            <td>
                <a href="#" style="width:40px;"
                    onclick="cargarListaPrecio({listaPrecioId:'<%: item.MS_Lista_Precio_Id %>',
                    descripcion:'<%: item.Servicio.Descripcion %>',
                    precio:'<%: item.Precio %>'})">Seleccionar</a>
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