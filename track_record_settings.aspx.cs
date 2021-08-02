using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SKF_Track_Record_2021
{


    public partial class transaction_record_view : System.Web.UI.Page
    {
        public DataSet track_record_settings_ds = new DataSet();
        dbConnect con = new dbConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadRecords();

            }
            if(IsPostBack)
            {
                loadRecords();
            }
        }


        private void loadRecords()
        {
            string sqlQuery = @"SELECT TRANSACTIONID, TRANSACTIONName FROM Ref_TrackRecord_Transaction
                                SELECT INDUSTRYID, INDUSTRYName FROM Ref_TrackRecord_Industry
                                SELECT ASSETTYPEID, ASSETTYPEName FROM Ref_TrackRecord_AssetType";

            con.OpenConnection();
            track_record_settings_ds = con.getDataSet(sqlQuery);
            con.CloseConnection();
           
        }

        protected void modal_DeleteRecord(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string modal_id = btn.ID;
            string tablename = "";
            string recordID = "";
            string id = "";

            if (modal_id == "delete_transItem")
            {
                tablename = "Ref_TrackRecord_Transaction";
                recordID = "TRANSACTIONID";
                id = hdField_del_transID.Value.ToString();

            }
            if (modal_id == "delete_industryItem")
            {
                tablename = "Ref_TrackRecord_Industry";
                recordID = "INDUSTRYID";
                id = hdField_del_industryID.Value.ToString();
            }
            if (modal_id == "delete_assetItem")
            {
                tablename = "Ref_TrackRecord_AssetType";
                recordID = "ASSETTYPEID";
                id = hdField_del_assetID.Value.ToString();
            }

            string sql = @"DELETE FROM " + tablename + " WHERE " + recordID + " = " + "'" + id + "'";
            con.OpenConnection();
            con.ExecuteQueries(sql);
            con.CloseConnection();
            Response.Redirect("track_record_settings.aspx");
        }

        protected void modal_EditRecord(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string modal_id = btn.ID;
            string tablename = "";
            string columnname = "";
            string recordID = "";
            string txtbox_content = "";
            string id = "";
            

            if (modal_id == "update_transactionItem")
            {
                tablename = "Ref_TrackRecord_Transaction";
                columnname = "TRANSACTIONName";
                txtbox_content = trans_txtbox_edit_modal.Text;
                id = hdField_transID.Value.ToString();
                recordID = "TRANSACTIONID";

            }
            if (modal_id == "update_industryItem")
            {
                tablename = "Ref_TrackRecord_Industry";
                columnname = "INDUSTRYName";
                txtbox_content = industry_txtbox_edit_modal.Text;
                id = hdField_industryID.Value.ToString();
                recordID = "INDUSTRYID";
            }
            if (modal_id == "update_assetItem")
            {
                tablename = "Ref_TrackRecord_AssetType";
                columnname = "ASSETTYPEName";
                txtbox_content = asset_txtbox_edit_modal.Text;
                id = hdField_assetID.Value.ToString();
                recordID = "ASSETTYPEID";
            }

            string sql = @"UPDATE " + tablename +
                         " SET " + columnname + " = " + "'" + txtbox_content + "'" + 
                         " WHERE " + recordID + " = " + "'" + id + "'";

            con.OpenConnection();
            con.ExecuteQueries(sql);
            con.CloseConnection();
            Response.Redirect("track_record_settings.aspx");
        }

        protected void modal_AddRecord(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string modal_id = btn.ID;
            string tablename = "";
            string columnname = "";
            string txtbox_content = "";
 
            if (modal_id == "add_transaction_modal")
            {
                tablename = "Ref_TrackRecord_Transaction";
                txtbox_content = add_transaction_txtbox.Text;
                columnname = "TRANSACTIONName";
                
            } else if (modal_id == "add_industry_modal")
            {
                tablename = "Ref_TrackRecord_Industry";
                txtbox_content = add_industry_txtbox.Text;
                columnname = "INDUSTRYName";
            } else if (modal_id == "add_asset_modal")
            {
                tablename = "Ref_TrackRecord_AssetType";
                txtbox_content = add_asset_txtbox.Text;
                columnname = "ASSETTYPEName";
            }

            string sql = @"INSERT INTO " + tablename + "(" + columnname + ", DateCreated)" 
                        + " VALUES ('" + txtbox_content + "', GetDate())";

            con.OpenConnection();
            con.ExecuteQueries(sql);
            con.CloseConnection();
            Response.Redirect("track_record_settings.aspx");
        }
    }
}