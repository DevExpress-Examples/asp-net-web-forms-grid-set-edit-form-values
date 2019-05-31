<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="ClientSide.aspx.vb" Inherits="ASPxGridVIew.ClientSide" %>

<%@ Register Assembly="DevExpress.XtraCharts.v15.1.Web, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>

	<script type="text/javascript">
		function OnEditorValueChanged(s, e) {
			var unitPrice = grid.GetEditValue("UnitPrice");
			var unitsInStock = grid.GetEditValue("UnitsInStock");
			grid.SetEditValue("Total", unitPrice * unitsInStock);
		}
	</script>
</head>
<body>
	<form id="form1" runat="server">
		<dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="ads" ClientInstanceName="grid" OnCustomUnboundColumnData="grdProducts_CustomUnboundColumnData" AutoGenerateColumns="False" KeyFieldName="ProductID">
			<Columns>
				<dx:GridViewCommandColumn ShowEditButton="true" VisibleIndex="0">
				</dx:GridViewCommandColumn>
				<dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" VisibleIndex="1">
					<EditFormSettings Visible="False" />
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="2">
				</dx:GridViewDataTextColumn>
				<dx:GridViewDataSpinEditColumn FieldName="UnitPrice" VisibleIndex="3">
					<PropertiesSpinEdit>
						<ClientSideEvents ValueChanged="OnEditorValueChanged" />
					</PropertiesSpinEdit>
				</dx:GridViewDataSpinEditColumn>
				<dx:GridViewDataSpinEditColumn FieldName="UnitsInStock" VisibleIndex="4">
					<PropertiesSpinEdit>
						<ClientSideEvents ValueChanged="OnEditorValueChanged" />
					</PropertiesSpinEdit>
				</dx:GridViewDataSpinEditColumn>
				<dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="5" ReadOnly="true" UnboundType="Decimal">
				</dx:GridViewDataTextColumn>
			</Columns>
		</dx:ASPxGridView>

		<asp:AccessDataSource ID="ads" runat="server" DataFile="~/App_Data/Nwind.mdb"
			SelectCommand="SELECT [ProductID], [ProductName], [UnitPrice], [UnitsInStock] FROM [Products]" DeleteCommand="DELETE FROM [Products] WHERE [ProductID] = ?" InsertCommand="INSERT INTO [Products] ([ProductID], [ProductName], [UnitPrice], [UnitsInStock]) VALUES (?, ?, ?, ?)" UpdateCommand="UPDATE [Products] SET [ProductName] = ?, [UnitPrice] = ?, [UnitsInStock] = ? WHERE [ProductID] = ?">
			<DeleteParameters>
				<asp:Parameter Name="ProductID" Type="Int32" />
			</DeleteParameters>
			<InsertParameters>
				<asp:Parameter Name="ProductID" Type="Int32" />
				<asp:Parameter Name="ProductName" Type="String" />
				<asp:Parameter Name="UnitPrice" Type="Decimal" />
				<asp:Parameter Name="UnitsInStock" Type="Int16" />
			</InsertParameters>
			<UpdateParameters>
				<asp:Parameter Name="ProductName" Type="String" />
				<asp:Parameter Name="UnitPrice" Type="Decimal" />
				<asp:Parameter Name="UnitsInStock" Type="Int16" />
				<asp:Parameter Name="ProductID" Type="Int32" />
			</UpdateParameters>
		</asp:AccessDataSource>
	</form>
</body>
</html>
