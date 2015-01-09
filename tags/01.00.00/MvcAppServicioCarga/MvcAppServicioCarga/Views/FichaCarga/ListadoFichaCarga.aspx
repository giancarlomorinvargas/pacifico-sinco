<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcAppServicioCarga.Models.ServicioCarga.MGFichaCarga>>" %>
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
    

    <br /><asp:Label ID="Label1" runat="server" Text="Lista de Fichas Carga" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" 
           ForeColor="#000066"></asp:Label>
<table style="height: 146px; width: 59%; border-color:Black" border="1" >
        <tr>
            <td>
     
    <% using (Html.BeginForm()) {%>
        
    <table class="style1">

        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Nombre:</strong></span></td>
            <td class="style4">     
                <%: Html.TextBox("Nombre")  %>       
            </td>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">DNI:</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("Dni")  %> 
            </td>
            <td>     
                <input type="submit" value="Buscar" />           
            </td>
        </tr>
        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Apellido Paterno:</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("ApellidoPaterno")  %> 
            </td>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Apellido Materno:</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("ApellidoMaterno")  %> 
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
            Agencia Origen
        </th>
        <th>
            Agencia Destino
        </th>
        <th>
            Fecha Salida
        </th>
        <th>
            Fecha Llegada
        </th>
        <th>
            Remitente
        </th>
        <th>
            Destinatario
        </th>
        <th>
            Dni Remitente
        </th>
        <th>
            Dni Destinatario
        </th>
        <th>
            Estado Pago
        </th>
        <th>
            Estado Carga
        </th>
        <th style="width:80px">
            Opciones
        </th>
    </tr>
         
    <% if (Model != null){ %>
    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.MG_FichaCarga_ID %>
            </td>
            <td>
                <%: item.ProgramacionRuta.Ruta.AgenciaOrigen.Descripcion%>
            </td>
            <td>
                <%: item.ProgramacionRuta.Ruta.AgenciaDestino.Descripcion%>
            </td>
            <td>
                <%: item.ProgramacionRuta.FechaOrigen%>
            </td>
            <td>
                <%: item.ProgramacionRuta.FechaDestino%>
            </td>
            <td>                 
                <%: item.Remitente.ApellidosPaterno + " " + item.Remitente.ApellidosMaterno + ", " + item.Remitente.Nombres %>
            </td>
            <td>                 
                <%: item.Destinatario.ApellidosPaterno + " " + item.Destinatario.ApellidosMaterno + ", " + item.Destinatario.Nombres %>
            </td>
            <td>                 
                <%: item.Remitente.Documento %>
            </td>
            <td>                 
                <%: item.Destinatario.Documento %>
            </td>
            <td>                 
                <%: Html.Label("", item.EstadoPago ? "Pagado": "Pendiente")%>
            </td>
            <td>                 
                <%: item.MGTipoMovimiento.Estado %>
            </td>
            <td>  
                <%: Html.ActionLink("Modificar", "Edit", new {  id=item.MG_FichaCarga_ID }) %><br /><br /><%: Html.ActionLink("Anular", "Anular", new {  id=item.MG_FichaCarga_ID })%><br /><br />
                <%: Html.ActionLink("Ver Detalle", "Details", new {  id=item.MG_FichaCarga_ID }) %>
            </td>
        </tr>
     
    <% } %>
        
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

    <table class="style6">
        <tr>
            <td class="style7">
                <%: Html.ActionLink("Registrar Ficha Carga", "Create") %> 
            </td> 
            <td>
                <a href="/">Ir al Menú Principal</a>
            </td>
        </tr>
    </table>
    
    <br />
    <br />
</asp:Content>
