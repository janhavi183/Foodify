using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {

                hl.Visible = true;
                Register.Visible = true;
                b.Visible = false;
                b1.Visible = false;
            }
            else
            {
                my_order.Visible = true;
                hl.Visible = false;
                u.Text = Session["user"].ToString();
                Label1.Text = u.Text;

                if (Session["user"].ToString() == "Guest")
                {
                    b.Visible = false;
                    b1.Visible = true;
                    Label1.Visible = true;
                    Label2.Visible = true;
                }
                else
                {
                    b.Visible = true;
                    b1.Visible = false;
                    dropdown.Visible = true;
                }
            }
            if (Session["HotelID"] != null && Session["HotelID"].ToString() != "")
                    logo.ImageUrl = "IMAGES/Hotel/" + Session["HotelID"].ToString() + ".png";
            else
            {
                logo.ImageUrl = "IMAGES/Hotel/logo3.jpg";
            }
        }


        protected void LogOut_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Hotel.aspx");
        }

        protected void signin_click(object sender, EventArgs e)
        {
            Response.Redirect("~/HotelLogin.aspx");
        }
        protected void MyOrder_click(Object sender, EventArgs e)
        {
            Response.Redirect("~/HotelMyCart.aspx");
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/HotelRegistration.aspx");
        }

    }
}