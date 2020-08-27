<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="ASPxGridVIew.Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
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
