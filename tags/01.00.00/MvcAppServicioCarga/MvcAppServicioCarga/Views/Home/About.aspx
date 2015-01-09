<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Acerca de mi aplicación ASP.NET MVC
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1>Acerca de</h1>
        <h2><%: ViewBag.Message %></h2>
    </hgroup>

    <article>
        <p>
            Use esta área para proporcionar información adicional.
        </p>

        <p>
            Use esta área para proporcionar información adicional.
        </p>

        <p>
            Use esta área para proporcionar información adicional.
        </p>
    </article>

    <aside>
        <h3>Al lado del título</h3>
        <p>
            Use esta área para proporcionar información adicional.
        </p>
        <ul>
            <li><%: Html.ActionLink("Inicio", "Index", "Home") %></li>
            <li><%: Html.ActionLink("Acerca de", "About", "Home") %></li>
            <li><%: Html.ActionLink("Contacto", "Contact", "Home") %></li>
        </ul>
    </aside>
</asp:Content>