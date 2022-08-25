<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Solution.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title>How to set column values in the Edit Form on the client and server sides</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxMenu ID="ASPxMenu1" runat="server" Orientation="Vertical">
            <Items>
                <dx:MenuItem Text="Client Side Approach" NavigateUrl="ClientSide.aspx">
                </dx:MenuItem>
                <dx:MenuItem Text="Server Side Approach" NavigateUrl="ServerSide.aspx">
                </dx:MenuItem>
            </Items>
        </dx:ASPxMenu>
    </form>
</body>
</html>
