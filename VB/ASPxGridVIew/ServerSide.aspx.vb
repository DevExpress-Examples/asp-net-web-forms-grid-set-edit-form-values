Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxEditors
Imports DevExpress.Web.ASPxGridView
Imports System

Namespace ASPxGridVIew
	Partial Public Class ServerSide
		Inherits System.Web.UI.Page
		Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		End Sub

		Protected Sub grdProducts_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs)
			If e.Column.FieldName = "Total" Then
				Dim price As Decimal = CDec(e.GetListSourceFieldValue("UnitPrice"))
				Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"))
				e.Value = price * quantity
			End If
		End Sub

		Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs)
			Dim grid As DevExpress.Web.ASPxGridView.ASPxGridView = CType(sender, DevExpress.Web.ASPxGridView.ASPxGridView)
			Dim unitPriceEditor As ASPxSpinEdit = CType(grid.FindEditRowCellTemplateControl((CType(grid.Columns("UnitPrice"), GridViewDataColumn)), "UnitPriceEditor"), ASPxSpinEdit)
			Dim unitsInStockEditor As ASPxSpinEdit = CType(grid.FindEditRowCellTemplateControl((CType(grid.Columns("UnitsInStock"), GridViewDataColumn)), "UnitsInStockEditor"), ASPxSpinEdit)
			Dim totalEditor As ASPxTextBox = CType(grid.FindEditRowCellTemplateControl((CType(grid.Columns("Total"), GridViewDataColumn)), "TotalEditor"), ASPxTextBox)

			totalEditor.Value = Convert.ToDecimal(unitPriceEditor.Value) * Convert.ToDecimal(unitsInStockEditor.Value)
		End Sub
	End Class
End Namespace