using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class HotelFinal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["order_id"] == null)
            {
                Response.Redirect("HotelMenu.aspx");
            }

            if (Session["pay"].ToString() == "COD")
            {
                Label1.Text = "Order has been successfully placed!" + "<br/><br/>" + "Estimated delivery time: 30 MINUTES" +
                    "<br/>" + "Payment of ₹" + "<b>" + Session["total"] + "</b>" + " is to be collected at the time of delivery.";
            }
            else if (Session["pay"].ToString() == "OT")
            {
                Label1.Text = "Order has been successfully placed!" + "<br/>" + "Estimated delivery time: 30 MINUTES";
            }

            Session["pay"] = null;
            Session["order_id"] = null;

        }
    }
}