using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace OFOS
{
    public class DataHelper
    {
       static string constr = WebConfigurationManager.AppSettings["sqlCon"].ToString();
        public static DataTable GetDataTable(string sql)
        {
            DataTable dataTable = new DataTable();
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(sql, con);
            try
            {
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dataTable);
                da.Dispose();
            }
            catch
            {
            }
            finally
            {
                con.Close();
            }
            return dataTable;
        }

        public static object GetScalar(string sql)
        {
            object obj = null;
            SqlConnection con = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(sql, con);
            try
            {
                con.Open();
                obj = cmd.ExecuteScalar();
            }
            catch
            {
            }
            finally
            {
                con.Close();
            }

            return obj;
        }

    }
}