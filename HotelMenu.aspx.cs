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
    public partial class HotelMenu : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(Request.QueryString["HotelID"]) == false)
            {
                Session["HotelID"] = Request.QueryString["HotelID"].ToString();
            }
        }

        protected void Button_soup_onclick(object sender, EventArgs e)
        {
           
            LoadGrid("SOUPS");

        }
        private void LoadGrid(string type)
        {
            pic.Visible = false;
            string selectSQL = "select Item_no,Item_name,Description,Image_url,Price from [dbo].[Item_Master] where (Type='"+ type + "')";
            griditem.DataSource = DataHelper.GetDataTable(selectSQL);
            griditem.DataBind();
        }

        protected void Button_starter_onclick(object sender, EventArgs e)
        {
            LoadGrid("STARTERS");
          
        }

        protected void Button_rice_onclick(object sender, EventArgs e)
        {
            LoadGrid("RICE");
           
        }

        protected void Button_noodles_onclick(object sender, EventArgs e)
        {
            LoadGrid("NOODLES");
            
        }

        protected void Button_maincourse_onclick(object sender, EventArgs e)
        {
            LoadGrid("MAIN COURSE");
          
        }

        protected void Button_dessert_onclick(object sender, EventArgs e)
        {
            LoadGrid("DESSERTS");
           
        }

        protected void griditem_Click(Object sender, EventArgs e)
        {
            pic.Visible = false;

            if (Session["user"] == null)
            {
                Response.Redirect("~/HotelLogin.aspx?msg=Please Log In");
            }
            else
            {
                SqlConnection con = new SqlConnection(constr);
                try
                {
                    con.Open();
                    string inSQL = null;
                    SqlCommand cmd = null;
                    if (Session["order_id"] == null)
                    {

                        string sessionID = Session["HotelID"].ToString();
                        inSQL = "insert into [dbo].[Orders] (Cust_Id,Hotel) VALUES(@id,@Hotel)";
                        cmd = new SqlCommand(inSQL, con);
                        cmd.Parameters.AddWithValue("@id", (int)Session["customer_id"]);
                        cmd.Parameters.AddWithValue("@Hotel", sessionID);
                        cmd.ExecuteNonQuery();

                        string selectSQL = "select MAX(Order_Id) from [dbo].[Orders]";
                        cmd = new SqlCommand(selectSQL, con);
                        int x = (int)cmd.ExecuteScalar();
                        Session["order_id"] = x;
                       
                    }
                    Button btn = (Button)sender;
                    GridViewRow gvr = (GridViewRow)btn.NamingContainer;
                    Button b = (Button)gvr.Cells[6].FindControl("button_cart");
                    b.Visible = false;
                    Label l = (Label)gvr.Cells[6].FindControl("l1");
                    l.Visible = true;
                    TextBox temp = gvr.Cells[5].FindControl("tb_quantity") as TextBox;
                    temp.Enabled = false;

                    string check = "select count(*) from [dbo].[Order_Details] where Order_Id=@id and Item_no=@item";
                    cmd = new SqlCommand(check, con);

                    cmd.Parameters.AddWithValue("@id", (int)Session["order_id"]);
                    cmd.Parameters.AddWithValue("@item", gvr.Cells[0].Text);

                    int exist = (int)cmd.ExecuteScalar();
                    if (exist > 0)
                    {
                        string UpdateSql = "update [dbo].[Order_Details] set Quantity = Quantity + @value, Amount = (Quantity + @value) * Price where Order_Id=@id and Item_no=@item";
                        cmd = new SqlCommand(UpdateSql, con);
                        cmd.Parameters.AddWithValue("@value", temp.Text);
                        cmd.Parameters.AddWithValue("@id", (int)Session["Order_Id"]);
                        cmd.Parameters.AddWithValue("@item", gvr.Cells[0].Text);
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        string insertSQL = "insert into [dbo].[Order_Details] (Order_Id, Item_no, Quantity, Price,Amount) VALUES(@order_id, @item_no, @qty, @price,@amount)";
                        cmd = new SqlCommand(insertSQL, con);
                        cmd.Parameters.AddWithValue("@order_id", (int)Session["order_id"]);
                        cmd.Parameters.AddWithValue("@item_no", gvr.Cells[0].Text);
                        cmd.Parameters.AddWithValue("@qty", Convert.ToInt32(temp.Text));
                        cmd.Parameters.AddWithValue("@price", gvr.Cells[4].Text);
                        cmd.Parameters.AddWithValue("@amount", (Convert.ToInt32(temp.Text)) * (Convert.ToInt32(gvr.Cells[4].Text)));
                        cmd.ExecuteNonQuery();

                    }
                }

                catch (Exception err)
                {
                     // status.Text = err.Message;
                }
                finally
                {
                    con.Close();
                }
            }
        }

    }
}