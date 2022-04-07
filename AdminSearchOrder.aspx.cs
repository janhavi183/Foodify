using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class AdminSearchOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("Admin_Login.aspx?msg=You need to login first");
            }
        }

        protected void btns_Click(object sender, EventArgs e)
        {
            details.Visible = true;

            string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
            SqlConnection con = new SqlConnection(constr);
            try
            {
                con.Open();
                String selectQuery = "select c.Cust_Id, c.Username, o.Order_Id from [dbo].[Orders] o" +
                    " inner join [dbo].[Customers] c on  o.Cust_Id=c.Cust_Id";
                int f = 0;
                selectQuery += " where c.City = '" + dropdown_city.SelectedItem.Text + "' ";

                selectQuery += " and Datediff(day,o.Date,'" + clndr.SelectedDate.ToString("dd-MMM-yyyy") + "')=0";
                //Response.Write(selectQuery);

                SqlCommand cmd = new SqlCommand(selectQuery, con);

              
                gridview1.DataSource = cmd.ExecuteReader();
                gridview1.DataBind();

            }
            catch (Exception err)
            {
                Sts.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }

        protected void gridview1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            Button b = (Button)gvr.Cells[0].FindControl("button");

            Sts.Text = gvr.Cells[3].Text;

            string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
            SqlConnection con = new SqlConnection(constr);

            try
            {
                con.Open();
                String selectQuery = "select od.Item_no, im.Item_name, od.Quantity from [dbo].[Order_Details] od inner join [dbo].[Item_Master] im ON od.Order_Id=@Order_Id AND im.Item_no=od.Item_no";
                SqlCommand cmd = new SqlCommand(selectQuery, con);

                cmd.Parameters.AddWithValue("@Order_Id", gvr.Cells[3].Text);
                gridview2.DataSource = cmd.ExecuteReader();
                gridview2.DataBind();
            }
            catch (Exception err)
            {
                Sts.Text = err.Message;
            }
            finally
            {
                con.Close();
            }
        }
    }
}