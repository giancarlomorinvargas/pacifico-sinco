<%@ Page Language="C#" %>
    



    <br /><label ID="Label1" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" >Lista de Productos</label>
       <br />
    <table>
    <tr>
        <th>
            Id
        </th>
        <th>
            Producto
        </th>
        <th>
            Opción
        </th>
    </tr>
    <% foreach (var item in (IEnumerable<MvcAppServicioCarga.Models.ServicioCarga.MGProducto>)ViewBag.ListadoProducto)
       { %>
    
        <tr>
            <td>
                <%: item.MG_Producto_ID %>
            </td>
            <td>
                <%: item.Descripcion %>
            </td>
            <td>
                <a href="#" style="width:40px;"                     
                    onclick="cargarProducto({productoId:'<%: item.MG_Producto_ID %>',
                    descripcion:'<%: item.Descripcion %>'})">Seleccionar</a>
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