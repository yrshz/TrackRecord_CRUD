using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SKF_Track_Record_2021
{
    public partial class track_record_add : System.Web.UI.Page
    {
        private static Random random = new Random();
        dbConnect con = new dbConnect();
        DataSet track_record_add_ds = new DataSet();
        string sql = "";
   
        string file1;
        string file2;
        string file3;
        string file4;

        public List <string> validationErrors = new List<string>();
        bool hasPhoto;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                queryDropdownItems("TRANSACTIONID", "TRANSACTIONName", "Ref_TrackRecord_Transaction", drp_add_Transaction);
                queryDropdownItems("INDUSTRYID", "INDUSTRYName", "Ref_TrackRecord_Industry", drp_add_Industry);
                queryDropdownItems("ASSETTYPEID", "ASSETTYPEName", "Ref_TrackRecord_AssetType", drp_add_AssetType);
                loadDataUpdate(Request.QueryString["tid"]);
            }
        }


        private void loadDataUpdate(string tid)
        {
            string sql = @"SELECT A.*, B.TRANSACTIONID, C.INDUSTRYID, D.ASSETTYPEID
                                FROM TrackRecord AS A
                                INNER JOIN Ref_TrackRecord_Transaction B on A.TRANSACTIONID = B.TRANSACTIONID
                                INNER JOIN Ref_TrackRecord_Industry C on A.INDUSTRYID = C.INDUSTRYID
                                INNER JOIN Ref_TrackRecord_AssetType D on A.ASSET_TYPEID = D.ASSETTYPEID
                                WHERE TrackRecordID = '" + tid + "'";

            
            con.OpenConnection();
            //DataSet ds = con.getDataSet(sql);
            track_record_add_ds = con.getDataSet(sql);
            con.CloseConnection();
            if(track_record_add_ds.Tables[0].Rows.Count > 0)
            {
                drp_add_Transaction.SelectedValue = track_record_add_ds.Tables[0].Rows[0]["TRANSACTIONID"].ToString();
                drp_add_Industry.SelectedValue = track_record_add_ds.Tables[0].Rows[0]["INDUSTRYID"].ToString();
                drp_add_AssetType.SelectedValue = track_record_add_ds.Tables[0].Rows[0]["ASSETTYPEID"].ToString();
                txtbox_year.Text = track_record_add_ds.Tables[0].Rows[0]["YEAR"].ToString();
                txtbox_company.Text = track_record_add_ds.Tables[0].Rows[0]["COMPANY"].ToString();
                txtbox_building.Text = track_record_add_ds.Tables[0].Rows[0]["BUILDING_PREMISES"].ToString();
                txtbox_landlord.Text = track_record_add_ds.Tables[0].Rows[0]["LANDLORD_SELLER"].ToString();
                txtbox_municipality.Text = track_record_add_ds.Tables[0].Rows[0]["MUNICIPALITY"].ToString();
                txtbox_area.Text = track_record_add_ds.Tables[0].Rows[0]["AREA"].ToString();
                txtbox_revenue.Text = track_record_add_ds.Tables[0].Rows[0]["REVENUE"].ToString();
                txtbox_transaction_value.Text = track_record_add_ds.Tables[0].Rows[0]["TRANSACTION_VALUE"].ToString();
                txtbox_agent.Text = track_record_add_ds.Tables[0].Rows[0]["AGENT"].ToString();


                
                FileUploadLbl1.Text = (track_record_add_ds.Tables[0].Rows[0]["IMAGE1"].ToString() != "") 
                ? "<a href='Images/" + tid + "/" + track_record_add_ds.Tables[0].Rows[0]["IMAGE1"].ToString() + ".jpg' target='_blank'>" + track_record_add_ds.Tables[0].Rows[0]["IMAGE1"].ToString() + ".jpg</a>" :  "";

                FileUploadLbl2.Text = (track_record_add_ds.Tables[0].Rows[0]["IMAGE2"].ToString() != "")
                ? "<a href='Images/" + tid + "/" + track_record_add_ds.Tables[0].Rows[0]["IMAGE2"].ToString() + ".jpg' target='_blank'>" + track_record_add_ds.Tables[0].Rows[0]["IMAGE2"].ToString() + ".jpg</a>" : "";

                
                FileUploadLbl3.Text = (track_record_add_ds.Tables[0].Rows[0]["IMAGE3"].ToString() != "")
                ? "<a href='Images/" + tid + "/" + track_record_add_ds.Tables[0].Rows[0]["IMAGE3"].ToString() + ".jpg' target='_blank'>" + track_record_add_ds.Tables[0].Rows[0]["IMAGE3"].ToString() + ".jpg</a>" : "";

                
                FileUploadLbl4.Text = (track_record_add_ds.Tables[0].Rows[0]["IMAGE4"].ToString() != "")
                ? "<a href='Images/" + tid + "/" + track_record_add_ds.Tables[0].Rows[0]["IMAGE4"].ToString() + ".jpg' target='_blank'>" + track_record_add_ds.Tables[0].Rows[0]["IMAGE4"].ToString() + ".jpg</a>" : "";


            }
        }

        protected void Button_Save_Onclick(object sender, EventArgs e)
        {

            //VALIDATION
            hasPhoto = false;

            if (drp_add_Transaction.SelectedValue.ToString() == "0") validationErrors.Add("Please Select a Transaction Item.");
            if (drp_add_Industry.SelectedValue.ToString() == "0") validationErrors.Add("Please Select an Industry Item.");
            if (drp_add_AssetType.SelectedValue.ToString() == "0") validationErrors.Add("Please Select an Asset Type Item.");

            if(FileUpload1.HasFile)
            {
                hasPhoto = true;
                if (FileUpload1.PostedFile.ContentLength > 2100000) validationErrors.Add("File1: File size cannot exceed more than 2MB.");
                if (System.IO.Path.GetExtension(FileUpload1.PostedFile.FileName).ToLower() != ".jpg") validationErrors.Add("File1: File extension not supported.");
            }
            if (FileUpload2.HasFile)
            {
                hasPhoto = true;
                if (FileUpload2.PostedFile.ContentLength > 2100000) validationErrors.Add("File2: File size cannot exceed more than 2MB.");
                if (System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName).ToLower() != ".jpg") validationErrors.Add("File2: File extension not supported.");
            }
            if (FileUpload3.HasFile)
            {
                hasPhoto = true;
                if (FileUpload3.PostedFile.ContentLength > 2100000) validationErrors.Add("File3: File size cannot exceed more than 2MB.");
                if (System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName).ToLower() != ".jpg") validationErrors.Add("File3: File extension not supported.");
            }
            if (FileUpload4.HasFile)
            {
                hasPhoto = true;
                if (FileUpload4.PostedFile.ContentLength > 2100000) validationErrors.Add("File4: File size cannot exceed more than 2MB.");
                if (System.IO.Path.GetExtension(FileUpload4.PostedFile.FileName).ToLower() != ".jpg") validationErrors.Add("File4: File extension not supported.");
            }
            if (FileUploadLbl1.Text.ToString() != "" || FileUploadLbl2.Text.ToString() != "" || FileUploadLbl3.Text.ToString() != "" || FileUploadLbl4.Text.ToString() != "")
                hasPhoto = true;

            if (validationErrors.Count > 0 || hasPhoto == false)
            {
                if(hasPhoto == false)
                    validationErrors.Add("You must upload at least 1 file.");
                errorList.DataSource = validationErrors;
                errorList.DataBind();
                return;
            }

            

            if (Request.QueryString["action"] == "new")
            {
                file1 = generateImgFileName(FileUpload1);
                file2 = generateImgFileName(FileUpload2);
                file3 = generateImgFileName(FileUpload3);
                file4 = generateImgFileName(FileUpload4);


                sql = @"INSERT INTO TrackRecord
                        (TRANSACTIONID
                        ,INDUSTRYID
                        ,ASSET_TYPEID
                        ,YEAR
                        ,COMPANY
                        ,BUILDING_PREMISES
                        ,LANDLORD_SELLER
                        ,MUNICIPALITY
                        ,AREA
                        ,REVENUE
                        ,TRANSACTION_VALUE
                        ,IMAGE1
                        ,IMAGE2
                        ,IMAGE3
                        ,IMAGE4
                        ,AGENT
                        ,CreatedDate
                    ) VALUES ( 
                        " + "'" + drp_add_Transaction.SelectedValue.ToString() + "', '"
                        + drp_add_Industry.SelectedValue.ToString() + "', '"
                        + drp_add_AssetType.SelectedValue.ToString() + "', '"
                        + txtbox_year.Text + "', '"
                        + txtbox_company.Text + "', '"
                        + txtbox_building.Text + "', '"
                        + txtbox_landlord.Text + "', '"
                        + txtbox_municipality.Text + "', '"
                        + txtbox_area.Text + "', '"
                        + txtbox_revenue.Text + "', '"
                        + txtbox_transaction_value.Text + "', '"
                        + file1 + "', '"
                        + file2 + "', '"
                        + file3 + "', '"
                        + file4 + "', '"
                        + txtbox_agent.Text + "', GetDate())";
                
            }
            else
            {
                string tid = Request.QueryString["tid"];
                string getImgNames = "SELECT IMAGE1, IMAGE2, IMAGE3, IMAGE4 FROM TrackRecord WHERE TrackRecordID = '" + tid + "'";
                con.OpenConnection();
                DataSet imgDs = con.getDataSet(getImgNames);
                con.CloseConnection();
                file1 = (FileUploadLbl1.Text == "" && FileUpload1.HasFile) ? RandomString(10) : imgDs.Tables[0].Rows[0]["IMAGE1"].ToString();
                file2 = (FileUploadLbl2.Text == "" && FileUpload2.HasFile) ? RandomString(10) : imgDs.Tables[0].Rows[0]["IMAGE2"].ToString();
                file3 = (FileUploadLbl3.Text == "" && FileUpload3.HasFile) ? RandomString(10) : imgDs.Tables[0].Rows[0]["IMAGE3"].ToString();
                file4 = (FileUploadLbl4.Text == "" && FileUpload4.HasFile) ? RandomString(10) : imgDs.Tables[0].Rows[0]["IMAGE4"].ToString();



                sql = @"UPDATE [dbo].[TrackRecord]
                        SET [TRANSACTIONID] = '" + drp_add_Transaction.SelectedValue.ToString() + "', "
                           + "[INDUSTRYID] = '" + drp_add_Industry.SelectedValue.ToString() + "', "
                        + "[ASSET_TYPEID]= '" + drp_add_AssetType.SelectedValue.ToString() + "', "
                        + "[YEAR] = '" + txtbox_year.Text + "', "
                        + "[COMPANY] = '" + txtbox_company.Text + "', "
                        + "[BUILDING_PREMISES] = '" + txtbox_building.Text + "', "
                        + "[LANDLORD_SELLER] = '" + txtbox_landlord.Text + "', "
                        + "[MUNICIPALITY] = '" + txtbox_municipality.Text + "', "
                        + "[AREA] = '" + txtbox_area.Text + "', "
                        + "[REVENUE] = '" + txtbox_revenue.Text + "', "
                        + "[TRANSACTION_VALUE] = '" + txtbox_transaction_value.Text + "', "
                        + "[IMAGE1] = '" + file1 + "', "
                        + "[IMAGE2] = '" + file2 + "', "
                        + "[IMAGE3] = '" + file3 + "', "
                        + "[IMAGE4] = '" + file4 + "', "
                        + "[AGENT] = '" + txtbox_agent.Text + "', "
                        + "[ModifiedDate] =  GetDate() "
                        + "WHERE TrackRecordID = '" + tid + "'";
            }

            con.OpenConnection();
            con.ExecuteQueries(sql);
            uploadFile();
            con.CloseConnection();
            Response.Redirect("track_record_view.aspx");
        }




        string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
                .Select(s => s[random.Next(s.Length)]).ToArray());
        }

        string generateImgFileName(FileUpload file)
        {
            string name = "";
            if(file.HasFile)
            {
                name = RandomString(10);
            }
            return name;
        }

        protected void uploadFile()
        {
            //if adding, query the latest track record, get the ID, then create a folder using it.
            string trackrecordID;
            if (Request.QueryString["action"] == "new")
            {
                string lastCreatedRecord = "SELECT TOP 1 TrackRecordID FROM TrackRecord ORDER BY CreatedDate DESC";
                DataSet latestRow = con.getDataSet(lastCreatedRecord);
                trackrecordID = latestRow.Tables[0].Rows[0]["TrackRecordID"].ToString();
                System.IO.Directory.CreateDirectory(Server.MapPath("Images/" + trackrecordID));
            }
            //if updating, request the current ID of track record
            else trackrecordID = Request.QueryString["tid"];
               
            if(FileUpload1.HasFile)
            {
                FileUpload1.SaveAs(Server.MapPath("~/Images/" + trackrecordID + "/") + file1 + ".jpg");
                file1 = "";
            }
            if (FileUpload2.HasFile)
            {
                FileUpload2.SaveAs(Server.MapPath("~/Images/" + trackrecordID + "/") + file2+ ".jpg");
                file2 = "";
            }
            if (FileUpload3.HasFile)
            {
                FileUpload3.SaveAs(Server.MapPath("~/Images/" + trackrecordID + "/") + file3 + ".jpg");
                file3 = "";
            }
            if (FileUpload4.HasFile)
            {
                FileUpload4.SaveAs(Server.MapPath("~/Images/" + trackrecordID + "/") + file4 + ".jpg");
                file4 = "";
            }
        }
       

        private void queryDropdownItems(string COL_ID, string COL_TEXT, string tablename, DropDownList ddl)
        {
            string sql = "SELECT " + COL_ID + ", " + COL_TEXT + " FROM " + tablename + " ";
            con.OpenConnection();
            con.loadDropDownDept(sql, COL_TEXT, COL_ID, ddl);
            con.CloseConnection();
        }


    }
}