using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace SKF_Track_Record_2021
{

    public class dbConnect
    {
        private string connectionString = @"Data Source=DESKTOP-TU4NG9D\SQLEXPRESS;database=Track_Record;
                                    Integrated Security=True;Connect Timeout=30;
                                    Encrypt=False;TrustServerCertificate=False;
                                    ApplicationIntent=ReadWrite;MultiSubnetFailover=False";

        SqlConnection con;

        public dbConnect()
        {


        }

        public void OpenConnection()
        {
            con = new SqlConnection(connectionString);
            con.Open();
        }

        public void CloseConnection()
        {
            con.Close();
        }

        public DataSet getDataSet(String sqlQuery)
        {
            DataSet newDs = new DataSet();
           
            using(con)
            {
               
                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = new SqlCommand(sqlQuery, con);
                adapter.Fill(newDs);
                return newDs;
            }
        }

        public void loadDropDownDept(string sql, string COL_TEXT, string COL_ID, DropDownList ddl)
        {
            ddl.Items.Add(new ListItem("Select...", "0"));
            DataSet ds = new DataSet();
            ds = getDataSet(sql);
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                ddl.Items.Add(new ListItem(ds.Tables[0].Rows[x][COL_TEXT].ToString(), ds.Tables[0].Rows[x][COL_ID].ToString()));
            }
        }


        public void loadDropDownDept(string sql, DropDownList ddl)
        {
            ddl.Items.Add(new ListItem("Select...", "0"));
            DataSet ds = new DataSet();
            ds = getDataSet(sql);
            for (int x = 0; x < ds.Tables[0].Rows.Count; x++)
            {
                ddl.Items.Add(new ListItem(ds.Tables[0].Rows[x][1].ToString(), ds.Tables[0].Rows[x][0].ToString()));
            }
        }


        public void ExecuteQueries(string sql)
        {
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
        }


    }
}