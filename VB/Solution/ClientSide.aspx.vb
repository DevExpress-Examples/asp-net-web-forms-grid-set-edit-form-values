Imports System

Namespace Solution

    Public Partial Class ClientSide
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
        End Sub

        Protected Sub grdProducts_CustomUnboundColumnData(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)
            If Equals(e.Column.FieldName, "Total") Then
                Dim price As Decimal = CDec(e.GetListSourceFieldValue("UnitPrice"))
                Dim quantity As Integer = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"))
                e.Value = price * quantity
            End If
        End Sub

        Protected Sub ASPxGridView1_RowUpdating(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataUpdatingEventArgs)
            Throw New CallbackException("Data modifications are not allowed in the online example.")
        End Sub

        Protected Sub ASPxGridView1_CustomErrorText(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs)
            If TypeOf e.Exception Is CallbackException Then e.ErrorText = e.Exception.Message
        End Sub
    End Class
End Namespace
