<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Web Socket Server - Solución Uno</title>
    <style type="text/css">
        body {
            padding: 20px 20px 20px 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>Web Socket Server - Solución Uno</h1>
        <p>Se utilizan los recursos de la libreria SignalR</p>

        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer runat="server" id="UpdateTimer" interval="1000" ontick="UpdateTimer_Tick" />
        <asp:UpdatePanel runat="server" id="TimedPanel" updatemode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger controlid="UpdateTimer" eventname="Tick" />
            </Triggers>
            <ContentTemplate>
                <asp:Label Text="Número enviado a la gráfica: 0" runat="server" ID="lblValor"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
