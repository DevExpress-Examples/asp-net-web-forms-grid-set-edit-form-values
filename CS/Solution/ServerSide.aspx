<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServerSide.aspx.cs" Inherits="Solution.ServerSide" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        function OnEditorValueChanged(s, e) {
            grid.PerformCallback();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="ads" ClientInstanceName="grid" OnCustomCallback="ASPxGridView1_CustomCallback" 
            OnCustomUnboundColumnData="grdProducts_CustomUnboundColumnData" AutoGenerateColumns="False" KeyFieldName="ProductID" 
            OnRowUpdating="ASPxGridView1_RowUpdating" OnCustomErrorText="ASPxGridView1_CustomErrorText">
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="true" />
                <dx:GridViewDataTextColumn FieldName="ProductID" ReadOnly="True" >
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductName" />
                <dx:GridViewDataColumn FieldName="UnitPrice" >
                    <EditItemTemplate>
                        <dx:ASPxSpinEdit ID="UnitPriceEditor" runat="server" Value='<%# Bind("UnitPrice") %>'>
                            <ClientSideEvents ValueChanged="OnEditorValueChanged" />
                        </dx:ASPxSpinEdit>
                    </EditItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="UnitsInStock" >
                    <EditItemTemplate>
                        <dx:ASPxSpinEdit ID="UnitsInStockEditor" runat="server" Value='<%# Bind("UnitsInStock") %>'>
                            <ClientSideEvents ValueChanged="OnEditorValueChanged" />
                        </dx:ASPxSpinEdit>
                    </EditItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewDataTextColumn FieldName="Total"  ReadOnly="true" UnboundType="Decimal">
                    <EditItemTemplate>
                        <dx:ASPxTextBox ID="TotalEditor" runat="server" Value='<%# Bind("Total") %>' />
                    </EditItemTemplate>
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
