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
   
    public partial class HotelArchiveOrders : System.Web.UI.Page
    {
        string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }

        private void LoadData()
        {
            string customerID = ((int)Session["customer_id"]).ToString();

            DataTable dataTable = new DataTable();

            string q = "select Orders.Order_ID,sum(Quantity) Total_QTY,sum(Order_details.Amount) ToTAL_Amt," +
                        " Max(Orders.Status) ORD_Status,Max(Orders.Date) Order_Date,Max(Hotel.ID) HotelID,"+
                        " Max(Hotel.HotelName) HotelName " +
                        " from Orders inner join Order_details on Orders.Order_Id = Order_details.Order_Id " +
                        " inner join Hotel on Hotel.ID = Orders.Hotel " +
                        " WHERE Cust_ID =@customer_id group by Orders.Order_ID,Hotel.ID,Hotel.HotelName order by Orders.Order_ID desc ";

            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(q, con);

            try
            {
                con.Open();
                cmd.Parameters.AddWithValue("@customer_id", (int)Session["customer_id"]);
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

        protected void gridorder_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}