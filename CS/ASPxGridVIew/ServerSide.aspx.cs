using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using System;

namespace ASPxGridVIew {
    public partial class ServerSide : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }

        protected void grdProducts_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewColumnDataEventArgs e) {
            if (e.Column.FieldName == "Total") {
                decimal price = (decimal)e.GetListSourceFieldValue("UnitPrice");
                int quantity = Convert.ToInt32(e.GetListSourceFieldValue("UnitsInStock"));
                e.Value = price * quantity;
            }
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e) {
            ASPxGridView grid = (ASPxGridView)sender;
            ASPxSpinEdit unitPriceEditor = (ASPxSpinEdit)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["UnitPrice"]), "UnitPriceEditor");
            ASPxSpinEdit unitsInStockEditor = (ASPxSpinEdit)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["UnitsInStock"]), "UnitsInStockEditor");
            ASPxTextBox totalEditor = (ASPxTextBox)grid.FindEditRowCellTemplateControl(((GridViewDataColumn)grid.Columns["Total"]), "TotalEditor");

            totalEditor.Value = Convert.ToDecimal(unitPriceEditor.Value) * Convert.ToDecimal(unitsInStockEditor.Value);
        }
    }
}