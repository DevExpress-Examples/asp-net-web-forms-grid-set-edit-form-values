<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128535406/22.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4842)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET WebForms - How to modify edit form values at runtime
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128535406/)**
<!-- run online end -->
This example demonstrates how to dynamically calculate the **Total** value in the [edit form](https://docs.devexpress.com/AspNet/3710/components/grid-view/concepts/edit-data/edit-form) when a user changes the **Unit Price** or **Unit In Stock** value.

![Set Edit Form Values](set-edit-form-values.png)

## Implementation Details

You can calculate and assign values to edit form editors on the client and server sides.

### Client Side

Follow the steps below to calculate and assign editor values on the client.

1. Subscribe to the client [ValueChanged](https://docs.devexpress.com/AspNet/js-ASPxClientEdit.ValueChanged) event in columns whose values affect the calculated value.
   ```aspx
   <dx:GridViewDataSpinEditColumn FieldName="UnitPrice" >
       <PropertiesSpinEdit>
           <ClientSideEvents ValueChanged="OnEditorValueChanged" />
       </PropertiesSpinEdit>
   </dx:GridViewDataSpinEditColumn>
   <dx:GridViewDataSpinEditColumn FieldName="UnitsInStock" >
       <PropertiesSpinEdit>
           <ClientSideEvents ValueChanged="OnEditorValueChanged" />
       </PropertiesSpinEdit>
   </dx:GridViewDataSpinEditColumn>
   ```
2. In the event handler, call the [GetEditValue](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.GetEditValue(column)) method to obtain editor values.
   ```js
   function OnEditorValueChanged(s, e) {
       var unitPrice = grid.GetEditValue("UnitPrice");
       var unitsInStock = grid.GetEditValue("UnitsInStock");
       // ...
   }
   ```
3. Call the [SetEditValue](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.SetEditValue(column-value)) method to set an editor value.
   ```js
   function OnEditorValueChanged(s, e) {
       // ...
       grid.SetEditValue("Total", unitPrice * unitsInStock);
   }
   ```

### Server Side

Follow the steps below to calculate and assign editor values on the server side.

1. Define [EditItemTemplate](https://docs.devexpress.com/AspNet/DevExpress.Web.GridViewDataColumn.EditItemTemplate) for columns whose values are involved in the calculation. Add editors in templates and bind them to corresponding fields in your data source.
   ```aspx
   <dx:GridViewDataColumn FieldName="UnitPrice" >
       <EditItemTemplate>
           <dx:ASPxSpinEdit ID="UnitPriceEditor" runat="server" Value='<%# Bind("UnitPrice") %>'>
               @* ...*@
           </dx:ASPxSpinEdit>
       </EditItemTemplate>
   </dx:GridViewDataColumn>
   <dx:GridViewDataColumn FieldName="UnitsInStock" >
       <EditItemTemplate>
           <dx:ASPxSpinEdit ID="UnitsInStockEditor" runat="server" Value='<%# Bind("UnitsInStock") %>'>
               @* ...*@
           </dx:ASPxSpinEdit>
       </EditItemTemplate>
   </dx:GridViewDataColumn>
   <dx:GridViewDataTextColumn FieldName="Total"  ReadOnly="true" UnboundType="Decimal">
       <EditItemTemplate>
           <dx:ASPxTextBox ID="TotalEditor" runat="server" Value='<%# Bind("Total") %>' />
       </EditItemTemplate>
   </dx:GridViewDataTextColumn>
   ```
2. Subscribe to the client [ValueChanged](https://docs.devexpress.com/AspNet/js-ASPxClientEdit.ValueChanged) event for editors whose values affect the calculated value.
   ```aspx
    <dx:ASPxSpinEdit ID="UnitPriceEditor" runat="server" Value='<%# Bind("UnitPrice") %>'>
        <ClientSideEvents ValueChanged="OnEditorValueChanged" />
    </dx:ASPxSpinEdit>
    @* ... *@
    <dx:ASPxSpinEdit ID="UnitsInStockEditor" runat="server" Value='<%# Bind("UnitsInStock") %>'>
        <ClientSideEvents ValueChanged="OnEditorValueChanged" />
    </dx:ASPxSpinEdit>
   ```
3. In the event handler, call the [PerformCallback](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.PerformCallback(args)) method to send a callback to the server and generate the [CustomCallback](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.CustomCallback) event.
   ```js
   function OnEditorValueChanged(s, e) {
       grid.PerformCallback();
   }
   ```
5. In the event handler, call the [FindEditRowCellTemplateControl](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxGridView.FindEditRowCellTemplateControl(DevExpress.Web.GridViewDataColumn-System.String)) method to obtain editors contained in templates.
   ```csharp
   protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e) {
       ASPxGridView grid = (ASPxGridView)sender;
       ASPxSpinEdit unitPriceEditor = (ASPxSpinEdit)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["UnitPrice"]), "UnitPriceEditor");
       ASPxSpinEdit unitsInStockEditor = (ASPxSpinEdit)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["UnitsInStock"]), "UnitsInStockEditor");
       ASPxTextBox totalEditor = (ASPxTextBox)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["Total"]), "TotalEditor");
       // ...
   }
   ```
5. Calculate and assign an editor value.
   ```csharp
   totalEditor.Value = Convert.ToDecimal(unitPriceEditor.Value) * Convert.ToDecimal(unitsInStockEditor.Value);
   ```

## Files to Look At

- [ClientSide.aspx](./CS/Solution/ClientSide.aspx) (VB: [ClientSide.aspx](./VB/Solution/ClientSide.aspx))
- [ClientSide.aspx.cs](./CS/Solution/ClientSide.aspx.cs) (VB: [ClientSide.aspx.vb](./VB/Solution/ClientSide.aspx.vb))
- [ServerSide.aspx](./CS/Solution/ServerSide.aspx) (VB: [ServerSide.aspx](./VB/Solution/ServerSide.aspx))
- [ServerSide.aspx.cs](./CS/Solution/ServerSide.aspx.cs) (VB: [ServerSide.aspx.vb](./VB/Solution/ServerSide.aspx.vb))

## More Examples

- [ASPxGridView - How to calculate column values on the client side using DataItemTemplate](https://www.devexpress.com/Support/Center/p/E3929)
