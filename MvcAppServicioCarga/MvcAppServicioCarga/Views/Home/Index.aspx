﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="indexTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Página de inicio de mi aplicación ASP.NET MVC
</asp:Content>

<asp:Content ID="indexFeatured" ContentPlaceHolderID="FeaturedContent" runat="server">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1>Página de inicio</h1>
                <h2><%: ViewBag.Message %></h2>
            </hgroup>
            <p>
                Para obtener más información sobre ASP.NET MVC, visite
                <a href="http://asp.net/mvc" title="Sitio web de ASP.NET MVC">http://asp.net/mvc</a>.
                La página incluye <mark>vídeos, cursos y ejemplos</mark> para ayudarle a sacar el máximo partido a ASP.NET MVC.
                Si tiene alguna pregunta relacionada con ASP.NET MVC, visite
                <a href="http://forums.asp.net/1146.aspx/1?MVC" title="Foro de ASP.NET MVC">nuestros foros</a>.
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Le sugerimos lo siguiente:</h3>
    <ol class="round">
        <li class="one">
            <h5>Introducción</h5>
            ASP.NET MVC ofrece una manera eficaz basada en patrones de crear sitios web dinámicos que
            permite llevar a cabo una clara separación de aspectos y proporciona control sobre el marcado
            para un desarrollo más ágil y atractivo. ASP.NET MVC incluye numerosas características que ofrecen
            un entorno rápido y compatible con TDD para crear aplicaciones sofisticadas que utilicen
            los estándares web más recientes.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245151">Más información…</a>
        </li>

        <li class="two">
            <h5>Agregar paquetes NuGet y poner en marcha su codificación</h5>
            NuGet facilita la instalación y actualización de herramientas y bibliotecas gratuitas.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245153">Más información…</a>
        </li>

        <li class="three">
            <h5>Buscar hospedaje web</h5>
            Encuentre fácilmente empresas de alojamiento web que ofrezcan la mejor relación de características
            y precio para sus aplicaciones.
            <a href="http://go.microsoft.com/fwlink/?LinkId=245157">Más información…</a>
        </li>
    </ol>
</asp:Content>
