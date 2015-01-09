<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" 
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<MvcAppServicioCarga.Models.Siniestro.MSPresupuesto>>" %>
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
    

    <br /><asp:Label ID="Label1" runat="server" Text="Mantenimiento de Presupuestos" 
        
           style="font-weight: 700; color: #003399; font-size: medium; text-align: center" 
           ForeColor="#000066"></asp:Label>
<table style="height: 146px; width: 59%; border-color:Black" border="1" >
        <tr>
            <td>
     
    <% using (Html.BeginForm()) {%>
        
    <table class="style1">

        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Nro. Presupuesto</strong></span></td>
            <td class="style4">     
                <%: Html.TextBox("NumPresupuesto")  %>       
            </td>

            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Nro. Accidente Vehicular</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("NumInforme")  %> 
            </td>

            <td>     
                <input type="submit" value="Buscar" />           
            </td>
        </tr>
        <tr>
            <td class="style2"><span class="style3">
                    <strong style="color: #003399">Nro. Poliza</strong></span></td>
            <td class="style4">                
                <%: Html.TextBox("NumPoliza")  %> 
            </td>
            <td class="style2">

            </td>
            <td class="style4">
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
            Nro. Presupuesto
        </th>
        <th>
            Nro. Accidente Vehicular
        </th>
        <th>
            Nro. Póliza
        </th>
        <th>
            Asegurado
        </th>
        <th>
            Fecha
        </th>
        <th>
            Total
        </th>
        <th>
            Estado Presupuesto
        </th>
        <th style="width:80px">
            Opciones
        </th>
    </tr>
         
    <% if (Model != null){ %>
    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.NumPresupuesto %>
            </td>
            <td>
                <%: item.InformeAccidente.NumInforme%>
            </td>
            <td>
                <%: item.InformeAccidente.Siniestro.Poliza.NumPoliza%>
            </td>
            <td>
                <%: item.InformeAccidente.Siniestro.Poliza.Asegurado.Nombre + " "+ item.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoPaterno
                 + " "+ item.InformeAccidente.Siniestro.Poliza.Asegurado.ApellidoMaterno%>
            </td>
            <td>
                <%: item.FechaPresupuesto%>
            </td>
            <td>
                <%: item.Total%>
            </td>
            <td>
                <%: item.Estado%>
            </td>
            <td>  
                <%: Html.ActionLink("Modificar", "Edit", new {  id=item.MS_Presupuesto_Id }) %><br /><br />
                <%: Html.ActionLink("Consultar", "Details", new {  id=item.MS_Presupuesto_Id }) %>
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
                <%: Html.ActionLink("Agregar", "Create") %> 
            </td> 
            <td>
                <a href="/">Ir al Menú Principal</a>
            </td>
        </tr>
    </table>
    
    <br />
    <br />
</asp:Content>
