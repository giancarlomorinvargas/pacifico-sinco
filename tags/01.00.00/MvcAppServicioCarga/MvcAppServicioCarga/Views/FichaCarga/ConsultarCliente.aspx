<%@ Page Language="C#" %>
    



    <br /><Label ID="Label1" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" >Lista de Clientes</Label>
       <br />
    <table>
    <tr>
        <th>
            Tipo Documento
        </th>
        <th>
            Documento
        </th>
        <th>
            Nombres
        </th>
        <th>
            Apellido Paterno
        </th>
        <th>
            Apellido Materno
        </th>
        <th>
            Opción
        </th>
    </tr>
    <% foreach (var item in (IEnumerable<MvcAppServicioCarga.Models.ServicioCarga.MGCliente>)ViewBag.ListadoCliente)
       { %>
    
        <tr>
            <td>
                <%: item.TipoDocumento %>
            </td>
            <td>
                <%: item.Documento %>
            </td>
            <td>
                <%: item.Nombres%>
            </td>
            <td>
                <%: item.ApellidosPaterno%>
            </td>
            <td>
                <%: item.ApellidosMaterno%>
            </td>
            <td>
                <a href="#" style="width:40px;"                     
                    onclick="cargarCliente({clienteId:'<%: item.MG_Cliente_ID %>',
                    tipoDocumento:'<%: item.TipoDocumento %>',
                    documento:'<%: item.Documento %>',
                    nombres:'<%: item.Nombres %>',
                    apellidos:'<%: item.ApellidosPaterno%>',
                    rol:'<%: Request["rol"]%>'})">Seleccionar</a>
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