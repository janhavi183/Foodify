using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class HotelPayment : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            sql1.ConnectionString = constr;
            if (Session["order_id"] == null)
            {
                Response.Redirect("HotelMenu.aspx");
            }
            else
            {
                if (Session["total"] == null)
                {
                    Response.Redirect("HotelMyCart.aspx");
                }
            }



            Label2.Text = " ₹ " + Session["total"].ToString();
            if (!IsPostBack)
            {
                Session["pay"] = null;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session["pay"] = "OT";
            Response.Redirect("HotelOnlinePayment.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["pay"] = "COD";
            Response.Redirect("HotelCodPayment.aspx");
        }
    }
}