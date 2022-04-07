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
    public partial class HotelCodPayment : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["order_id"] == null)
            {
                Response.Redirect("HotelMenu.aspx");
            }
            else
            {
                if (Session["pay"] == null)
                {
                    Response.Redirect("HotelMenu.aspx?Payment mode needs to be selected");
                }
            }

            if (IsPostBack == false)
            {
                if (Session["pay"].ToString() == "OT")
                {
                    Label1.Text = "Transaction successful!" + "<br/>" + "Payment of ₹" + Session["total"] + " received." + "<br/><br/>" + "Please provide Delivery details.";
                }
                else if (Session["pay"].ToString() == "COD")
                {
                    Label1.Text = "Please provide Delivery details.";
                }
             
                string q = "select Name,House_no,Street,City,Contact_No from [dbo].[Customers] WHERE Cust_Id=@Cust_Id";
                SqlConnection con = new SqlConnection(constr);

                SqlCommand cmd = new SqlCommand(q, con);
                SqlDataReader reader;
                try
                {
                    con.Open();

                    cmd.Parameters.AddWithValue("@Cust_Id", Session["customer_id"]);
                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Name.Text = reader["Name"].ToString();
                        House_no.Text = reader["House_no"].ToString();
                        Street.Text = reader["Street"].ToString();
                        D_city.Text = reader["City"].ToString();
                        Contact.Text = reader["Contact_no"].ToString();
                    }
                }
                catch (Exception err)
                {
                    Label1.Text = err.ToString();
                }
                finally
                {
                    con.Close();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

           

            string q = "INSERT into [dbo].[Delivery] (Order_Id,Name,House_no,Street,City,Contact_no) values (@Order_Id,@Name,@House_no,@Street,@City,@Contact_No)";
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(q, con);
            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@Order_Id", Session["order_id"]);
                cmd.Parameters.AddWithValue("@Name", Name.Text);
                cmd.Parameters.AddWithValue("House_no", House_no.Text);
                cmd.Parameters.AddWithValue("@Street", Street.Text);
                cmd.Parameters.AddWithValue("@City", D_city.Text);
                cmd.Parameters.AddWithValue("@Contact_No", Contact.Text);
                cmd.ExecuteNonQuery();

                if (Session["pay"].ToString() == "COD")
                {
                    string q2 = "UPDATE [dbo].[Orders] SET Status=1,Date=@date WHERE Order_Id=@order_id";
                    SqlCommand cmd2 = new SqlCommand(q2, con);
                    cmd2.Parameters.AddWithValue("@order_id", (int)Session["order_id"]);
                    cmd2.Parameters.AddWithValue("@date", System.DateTime.Now);

                    cmd2.ExecuteNonQuery();
                    //cmd2.ExecuteScalar();

                    string q3 = "INSERT into [dbo].[Payment] (Order_Id,Mode,COD_Pay_Status) values (@Order_Id,@Mode,@COD_Pay_Status)";
                    SqlCommand cmd3 = new SqlCommand(q3, con);
                    cmd3.Parameters.AddWithValue("@Order_Id", (int)Session["order_id"]);
                    cmd3.Parameters.AddWithValue("@Mode", "COD");
                    cmd3.Parameters.AddWithValue("@COD_Pay_Status", "Pending");
                    cmd3.ExecuteNonQuery();
                }

                Response.Redirect("HotelFinal.aspx");
            }
            catch (Exception err)
            {
                Label1.Text = err.ToString();
            }
            finally
            {
                con.Close();
            }
        }
    }
}