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
    public partial class Hotel : System.Web.UI.Page
    {

        public DataTable dtHotel = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["customer_id"] = (int)29;
            //Session["user"] = "Aaisha";
            if (!IsPostBack)
                LoadHotel();
        }
        private void LoadHotel()
        {
            dtHotel = DataHelper.GetDataTable("Select * from Hotel");
        }
    }

   
}