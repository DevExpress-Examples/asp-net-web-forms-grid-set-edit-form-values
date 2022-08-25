using DevExpress.Web;
using System;

namespace Solution {
    public class CallbackException : Exception {
        public CallbackException(string message)
            : base(message) {
        }
    }
    public partial class Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
        }
    }
}