using System;

namespace ASPxGridVIew {
    public partial class ClientSide : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void grdProducts_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e) {
            if (e.Column.FieldName == "Total") {
                decimal price = (decimal)e.GetListSourceFieldValue("UnitPrice");
                int quantity = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"));
                e.Value = price * quantity;
            }
        }
    }
}