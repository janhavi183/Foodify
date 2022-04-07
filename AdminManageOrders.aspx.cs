using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OFOS
{
    public partial class AdminManageOrders : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void Cancel_Click(object sender, EventArgs e)
        {
            var arg = (sender as Button).CommandArgument;
            string ID = arg.ToString();
            string[] strSplit = ID.Split('$');
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd;
            con.Open();
            string sql = "update Orders set Status =5 where Order_ID =" + strSplit[1].ToString();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            var arg = (sender as Button).CommandArgument;
            string ID = arg.ToString();
            string[] strSplit = ID.Split('$');
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd;
            con.Open();
            if (strSplit[0] == "0")
            {
                String q = "UPDATE [dbo].[Payment] SET COD_Pay_Status='Received' WHERE Order_Id=" + strSplit[1].ToString() + " AND Mode='COD' ";
               
                cmd = new SqlCommand(q, con);
                cmd.ExecuteNonQuery();
            }
            int nextStep = Convert.ToInt32(strSplit[0]);
            nextStep = nextStep + 1;
            string sql = "update Orders set Status = " + nextStep + " where Order_ID =" + strSplit[1].ToString();
            cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
            LoadData();
        }

        private void LoadData()
        {
           

            DataTable dataTable = new DataTable();

            string q = "select Orders.Order_ID,sum(Quantity) Total_QTY,sum(Order_details.Amount) ToTAL_Amt," +
             " Max(Orders.Status) ORD_Status,Max(Orders.Date) Order_Date,Max(Hotel.ID) HotelID," +
             " Max(Hotel.HotelName) HotelName " +
             " from Orders inner join Order_details on Orders.Order_Id = Order_details.Order_Id " +
             " inner join Hotel on Hotel.ID = Orders.Hotel where Orders.Status not in (4,5) " +
             "  group by Orders.Order_ID,Hotel.ID,Hotel.HotelName order by Orders.Order_ID desc ";


            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(q, con);

            try
            {
                con.Open();
               
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                // this will query your database and return the result to your datatable
                da.Fill(dataTable);
                gridorder.DataSource = dataTable;
                gridorder.DataBind();
                con.Close();
                da.Dispose();

            }
            catch (Exception err)
            {

            }
            finally
            {
                con.Close();
            }
        }

      public Boolean GetVisibleStatus(int status)
        {
            if (status >= 4)
                return false;
            else 
                return true;
        }

        public string GetOrderStatus(int status)
        {
            switch (status)
            {
                case 0:
                    return "Order Received";
                    break;
                case 1:
                    return "Payment Confirmed";
                    break;
                case 2:
                    return "Food Preparing";
                    break;
                case 3:
                    return "Food On the Way";
                    break;
                case 4:
                    return "Order Delivered";
                    break;
                case 5:
                    return "Order Cancelled";
                    break;
                default:
                    return "No status";
                    break;

            }
        }

        protected void SubmitAppraisalGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gridorder.PageIndex = e.NewPageIndex;
            LoadData();
        }
    }
}