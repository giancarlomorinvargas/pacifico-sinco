<%@ Page Language="C#" MasterPageFile="~/MasterPage.master"  AutoEventWireup="true" CodeBehind="Principal.aspx.cs" Inherits="Pacifico.SINCO.WEB.Modulos.Principal" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="cphHead">

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="cphCuerpo" runat="Server">

    <br />
    <font class="css_lbl_titulo">Bienvenido, Usuario</font>
    <br /> <br />
    wsPresupuesto: <label id="lblwsPresupuesto" runat="server" class="css_lbl_tituloModal">PENDIENTE</label>
    <br />
    wsSiniestro: <label id="lblwsSiniestro" runat="server" class="css_lbl_tituloModal">PENDIENTE</label>
    <br />
    wsUtil: <label id="lblwsUtil" runat="server" class="css_lbl_tituloModal">PENDIENTE</label>
    <br /><br />
    
</asp:Content>

