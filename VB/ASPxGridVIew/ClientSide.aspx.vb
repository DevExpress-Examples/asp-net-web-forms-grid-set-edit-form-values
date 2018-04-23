Imports Microsoft.VisualBasic
Imports System

Namespace ASPxGridVIew
	Partial Public Class ClientSide
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
	End Class
End Namespace