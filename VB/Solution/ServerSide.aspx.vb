Imports DevExpress.Web
Imports System

Namespace Solution

    Public Partial Class ServerSide
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub grdProducts_CustomUnboundColumnData(ByVal sender As Object, ByVal e As ASPxGridViewColumnDataEventArgs)
            If Equals(e.Column.FieldName, "Total") Then
                Dim price As Decimal = CDec(e.GetListSourceFieldValue("UnitPrice"))
                Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"))
                e.Value = price * quantity
            End If
        End Sub

        Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
            Dim grid As ASPxGridView = CType(sender, ASPxGridView)
            Dim unitPriceEditor As ASPxSpinEdit = CType(grid.FindEditRowCellTemplateControl(CType(grid.Columns("UnitPrice"), GridViewDataColumn), "UnitPriceEditor"), ASPxSpinEdit)
            Dim unitsInStockEditor As ASPxSpinEdit = CType(grid.FindEditRowCellTemplateControl(CType(grid.Columns("UnitsInStock"), GridViewDataColumn), "UnitsInStockEditor"), ASPxSpinEdit)
            Dim totalEditor As ASPxTextBox = CType(grid.FindEditRowCellTemplateControl(CType(grid.Columns("Total"), GridViewDataColumn), "TotalEditor"), ASPxTextBox)
            totalEditor.Value = Convert.ToDecimal(unitPriceEditor.Value) * Convert.ToDecimal(unitsInStockEditor.Value)
        End Sub

        Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
            Throw New CallbackException("Data modifications are not allowed in the online example.")
        End Sub

        Protected Sub ASPxGridView1_CustomErrorText(ByVal sender As Object, ByVal e As ASPxGridViewCustomErrorTextEventArgs)
            If TypeOf e.Exception Is CallbackException Then e.ErrorText = e.Exception.Message
        End Sub
    End Class
End Namespace
