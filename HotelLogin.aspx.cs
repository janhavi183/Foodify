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
    public partial class HotelLogin : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            status0.Text = Request.QueryString["msg"];
        }

        protected void Login_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(constr);
            string selectSQL = "select * from [dbo].[Customers] where Username=@username AND Password=@password";
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader reader;

            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@username", tb_user.Text);
                cmd.Parameters.AddWithValue("@password", tb_pwd.Text);
                reader = cmd.ExecuteReader();
                if (reader.Read() == false)
                {
                    status.Text = "Invalid Username or Password.";
                }
                else
                {
                    Session["customer_id"] = (int)reader["Cust_Id"];
                    Session["user"] = tb_user.Text;
                    Response.Redirect("~/Hotel.aspx");
                }
            }
            catch (Exception err)
            {

            }
            finally
            {
                con.Close();
            }
        }
    }
}