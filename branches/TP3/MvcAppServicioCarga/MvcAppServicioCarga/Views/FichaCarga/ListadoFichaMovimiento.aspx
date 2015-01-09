<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcAppServicioCarga.Models.ServicioCarga.MGFichaMovimiento>>" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 71%;
            height: 87px;
            margin-right: 0px;
        }
        .style2
        {
            width: 153px;
            font-weight: 700;
            color: #003399;
        }
        .style3
        {
            color: #0066CC;
        }
        .style4
        {
            width: 193px;
        }
        .style5
        {
            color: #0033CC;
        }
        .style6
        {
            width: 41%;
        }
        .style7
        {
            width: 191px;
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
    

    <br /><asp:Label ID="Label1" runat="server" Text="Lista de Fichas de Movimiento" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" 
           ForeColor="#000066"></asp:Label>
<table style="height: 146px; width: 59%; border-color:Black" border="1" >
        <tr>
            <td>
     
    <% using (Html.BeginForm()) {%>
        
    <table class="style1">

        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">N° Ficha Movimiento:</strong></span></td>
            <td class="style4">     
                <%: Html.TextBox("FichaMovimientoID")  %>       
            </td>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">N° Ficha Carga:</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("FichaCargaID")  %> 
            </td>
            <td>     
                <input type="submit" value="Buscar" />           
            </td>
        </tr>
        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Tipo Movimiento:</strong></span></td>
            <td class="style4">              
                <%: Html.DropDownList("TipoMovimiento", new SelectList((List<SelectListItem>)Session["ListadoTipoMovimiento"], "Value", "Text"))  %>
            </td>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Agencia:</strong></span></td>
            <td class="style4">                       
                <%: Html.DropDownList("Agencia", new SelectList((List<SelectListItem>)Session["ListadoAgencia"], "Value", "Text"))  %>    
            </td>
            <td>
            </td>
        </tr>
    </table>
                
    <% } %>
             </td>
        </tr>
    </table>

    <table>
    <tr>
        <th>
            Ficha Carga
        </th>
        <th>
            Ficha Mov.
        </th>
        <th>
            Tipo Movimiento
        </th>
        <th>
            Agencia
        </th>
        <th>
            Fecha y Hora Mov.
        </th>
        <th>
            Opción
        </th>
    </tr>
        <% if (Model != null){ %>
    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.MG_FichaCarga_ID %>
            </td>
            <td>
                <%: item.MG_FichaMovimiento_ID%>
            </td>
            <td>
                <%: item.TipoMovimiento.Descripcion%>
            </td>
            <td>
                <%: item.Agencia.Descripcion%>
            </td>
            <td>
                <%: item.FechaRegistra%>
            </td>
            <td><%if (item.MG_Tipo_Movimiento_ID == item.FichaCarga.Estado) {%>
                    <%: Html.ActionLink("Modificar", "ModificarFichaMovimiento", new {  id=item.MG_FichaMovimiento_ID }) %>
                <%}%>
            </td>
        </tr>
    
    <% } %>
        
    <% } %>
    </table>    


    <br />
    
    <p>
        <%: Session["Mensaje"] %>
    </p>

    <table class="style6">
        <tr>
            <td>
                <%: Html.ActionLink("Ir al Menú Principal", "Index", "Home") %>
            </td>
        </tr>
    </table>
    
    <br />
    <br />
</asp:Content>
