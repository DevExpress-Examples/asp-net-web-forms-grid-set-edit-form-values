<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128535406/22.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4842)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Grid View for ASP.NET WebForms - How to modify edit form values at runtime
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128535406/)**
<!-- run online end -->
This example demonstrates how to calculate a value in code based on column values and assign the calculated value to an editor within the Grid View edit form.

![Set Edit Form Values](set-edit-form-values.png)

## Implementation Details

You can assign calculated values to the Edit Form both on the client side and server side.

### Client Side

Follow the steps below to assign calculated values to the Edit Form on the client side.

1. Handle the client [ASPxClientEdit.ValueChanged](https://docs.devexpress.com/AspNet/js-ASPxClientEdit.ValueChanged) event in columns whose values should be obtained.
2. In the corresponding script function, call the [ASPxClientGridView.GetEditValue](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.GetEditValue(column)) method to obtain an editor value.
3. To set an editor value, call the [ASPxClientGridView.SetEditValue](https://docs.devexpress.com/AspNet/js-ASPxClientGridView.SetEditValue(column-value)) method.

### Server Side

Follow the steps below to assign calculated values to the Edit Form on the server side.

1. Define the [GridViewDataColumn.EditItemTemplate](!!!) for columns whose values should be calculated / set and bind editors in template to the corresponding fields in your Data Source.
2. Handle the client-side [ASPxClientEdit.ValueChanged](!!!) event for editors whose values should be obtained.
2. In the corresponding script function, call the [ASPxClientGridView.PerformCallback](!!!) method to raise a [Callback](!!!) to the server.
3. Handle the [ASPxGridView.CustomCallback](!!!) event on the server side.
4. Use the [ASPxGridView.FindEditRowCellTemplateControl](!!!) method to obtain editors whose values should be obtained / set.

## Files to Look At

- [ClientSide.aspx](./CS/Solution/ClientSide.aspx) (VB: [ClientSide.aspx](./VB/Solution/ClientSide.aspx))
- [ClientSide.aspx.cs](./CS/Solution/ClientSide.aspx.cs) (VB: [ClientSide.aspx.vb](./VB/Solution/ClientSide.aspx.vb))
- [ServerSide.aspx](./CS/Solution/ServerSide.aspx) (VB: [ServerSide.aspx](./VB/Solution/ServerSide.aspx))
- [ServerSide.aspx.cs](./CS/Solution/ServerSide.aspx.cs) (VB: [ServerSide.aspx.vb](./VB/Solution/ServerSide.aspx.vb))

## More Examples

- [ASPxGridView - How to calculate column values on the client side using DataItemTemplate](https://www.devexpress.com/Support/Center/p/E3929)
