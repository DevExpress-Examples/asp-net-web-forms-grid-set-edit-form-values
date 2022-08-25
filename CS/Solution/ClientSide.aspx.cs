using System;

namespace Solution {
    public partial class ClientSide : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void grdProducts_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e) {
            if (e.Column.FieldName == "Total") {
                decimal price = (decimal)e.GetListSourceFieldValue("UnitPrice");
                int quantity = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"));
                e.Value = price * quantity;
            }
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e) {
            throw new CallbackException("Data modifications are not allowed in the online example.");
        }

        protected void ASPxGridView1_CustomErrorText(object sender, DevExpress.Web.ASPxGridViewCustomErrorTextEventArgs e) {
            if (e.Exception is CallbackException)
                e.ErrorText = e.Exception.Message;
        }
    }
}