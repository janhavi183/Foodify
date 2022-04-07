using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class HotelMyAccount : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            sql1.ConnectionString = constr;
            if (Session["user"] == null || Session["user"].ToString() == "Guest")
            {
                Response.Redirect("Hotel.aspx");
            }
        }

        protected void AccDetails_DataBound(object sender, EventArgs e)
        {
            if (((DetailsView)sender).CurrentMode == DetailsViewMode.Edit)
            {
                DataRowView row = (DataRowView)((DetailsView)sender).DataItem;

                DropDownList ddlcity = (DropDownList)((DetailsView)sender).FindControl("ddlcity");
                ddlcity.SelectedValue = row[6].ToString();
            }
        }
        protected void AccDetails_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            DropDownList ddlcity = (DropDownList)((DetailsView)sender).FindControl("ddlcity");
            sql1.UpdateParameters["City"].DefaultValue = ddlcity.SelectedValue;
        }
    }
}