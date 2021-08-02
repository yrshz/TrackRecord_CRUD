using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace SKF_Track_Record_2021
{
    public partial class track_record_view : System.Web.UI.Page
    {

        public dbConnect con = new dbConnect();
        public DataSet track_record_view_ds = new DataSet();
   
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDropdownItems("TRANSACTIONID", "TRANSACTIONName", "Ref_TrackRecord_Transaction", drp_transaction);
            loadDropdownItems("ASSETTYPEID", "ASSETTYPEName", "Ref_TrackRecord_AssetType", drp_asset);
            loadyear(drp_year, 1991);
            if (!IsPostBack)
            {
                loadAllTrackRecords();
            } 
            if(IsPostBack)
            {
                filterRecords();
            }
        }

        protected void btnSubmit_Delete(object sender, EventArgs e)
        {
            string sql = "DELETE FROM TrackRecord WHERE TrackRecordID = '" + hdField_del_trackRecordID.Value.ToString() + "'";
            con.OpenConnection();
            con.ExecuteQueries(sql);
            con.CloseConnection();
            Response.Redirect("track_record_view.aspx");
        }

        protected void filterRecords()
        {
     
            string sql = @"SELECT A.TrackRecordID, A.YEAR,  B.TRANSACTIONName, C.ASSETTYPEName, A.COMPANY, A.BUILDING_PREMISES, A.AREA, A.REVENUE
                                FROM TrackRecord AS A
                                INNER JOIN Ref_TrackRecord_Transaction B on A.TRANSACTIONID = B.TRANSACTIONID
                                INNER JOIN Ref_TrackRecord_AssetType C on A.ASSET_TYPEID = C.ASSETTYPEID";

            bool andFlag = false;

            if (drp_asset.SelectedValue.ToString() != "0" || drp_transaction.SelectedValue.ToString() != "0" || drp_year.SelectedItem.Value.ToString() != "0")
            {
                sql += " WHERE ";
                if (drp_year.SelectedItem.Value.ToString() != "0")
                {
                    sql += "A.YEAR = '" + drp_year.SelectedItem.Text.ToString() + "' ";
                    andFlag = true;
                }

                if(drp_asset.SelectedValue.ToString() != "0")
                {
                    if (andFlag)
                        sql += "AND ";
                    sql += "A.ASSET_TYPEID = '" + drp_asset.SelectedValue.ToString() + "' ";
                    andFlag = true;
                }

                if(drp_transaction.SelectedValue.ToString() != "0")
                {
                    if (andFlag)
                        sql += "AND ";
                    sql += "A.TRANSACTIONID = '" + drp_transaction.SelectedValue.ToString() + "' ";
                }
            }
            
            con.OpenConnection();
            track_record_view_ds = con.getDataSet(sql);
            con.CloseConnection();
            
        }

        private void loadAllTrackRecords()
        {
            string sqlQuery = @"SELECT A.TrackRecordID, A.YEAR,  B.TRANSACTIONName, C.ASSETTYPEName, A.COMPANY, A.BUILDING_PREMISES, A.AREA, A.REVENUE
                                FROM TrackRecord AS A
                                INNER JOIN Ref_TrackRecord_Transaction B on A.TRANSACTIONID = B.TRANSACTIONID
                                INNER JOIN Ref_TrackRecord_AssetType C on A.ASSET_TYPEID = C.ASSETTYPEID";


            con.OpenConnection();
            track_record_view_ds = con.getDataSet(sqlQuery);
            con.CloseConnection();

        }

        private void loadDropdownItems(string COL_ID, string COL_TEXT, string tablename, DropDownList ddl)
        {
            string sql = "SELECT " + COL_ID + ", " + COL_TEXT + " FROM " + tablename + " ";
            con.OpenConnection();
            con.loadDropDownDept(sql, COL_TEXT, COL_ID, ddl);
            con.CloseConnection();
        }


        private void loadyear(DropDownList year, int start)
        {
            year.Items.Add(new ListItem("Select...", "0"));
            for (int x = start, value = 1; x <= DateTime.Now.Year; x ++)
            {
                year.Items.Add(new ListItem(x.ToString(), value.ToString()));
                value++;
            }
        }
        
    }
}