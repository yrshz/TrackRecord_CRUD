<%@ Page Title="" Language="C#" MasterPageFile="~/TrackRecord.Master" AutoEventWireup="true" CodeBehind="track_record_add.aspx.cs" Inherits="SKF_Track_Record_2021.track_record_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <style>
        .border-all {
            border: 1px solid #F05050; 
            background-color: #ECCFD2;
        }
    </style>

    <!-- Basic Information -->
    <div class="row">
        <div class="col-sm-12">
            <div class="btn-group pull-right m-t-15">
                <span><asp:Button ID="btn_saveRecord" runat="server" Text="Save" CssClass="btn btn-default"  OnClick ="Button_Save_Onclick"/></span>
                <span><asp:Button ID="btn_cancelRecord" runat="server" Text="Cancel" CssClass="btn btn-danger" PostBackUrl="track_record_view.aspx" /></span>
            </div>

            <h4 class="page-title">Track Record Database</h4>
            <p class="text-muted page-title-alt"><a href="track_record_view.aspx" class ="page-title-alt">All Track Records</a> / Add-Update</p>
        </div>
    </div>

    <%if (validationErrors.Count != 0)
        {
            %>
            <div class="row"">
                <div class="col-sm-12">
                    <div class="card-box border-all">
                        <asp:BulletedList ID="errorList" runat="server" CssClass="text-danger"></asp:BulletedList>
                    </div>
                </div>
            </div>

    <%} 
        %>

    <%--<asp:ValidationSummary runat="server" ID="ValidationSummary1" 
                    DisplayMode="BulletList"
                    ShowMessageBox="False" ShowSummary="True" CssClass="alert alert-danger" />--%>

    <div class="row">
        <div class="col-sm-12">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

            <div class="card-box">

                <h4 class="m-t-0 m-l-8 heading-title"><b>BASIC INFORMATION</b></h4> 
                
                <p class="text-muted m-b-30 font-13"></p> <!-- used space between title and dropdown list-->

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: end">TRANSACTION * </label>
                            <div class="col-md-8" style="text-align: initial">
                                <asp:DropDownList ID="drp_add_Transaction" runat="server" CssClass="chosen-select form-control">    
                                </asp:DropDownList>
                            </div>  
                        </div>      
                    </div>


                   <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: end">INDUSTRY * </label>
                            <div class="col-md-8" style="text-align: initial">
                                <asp:DropDownList ID="drp_add_Industry" runat="server" CssClass="chosen-select form-control">     
                                </asp:DropDownList>
                            </div>
                        </div>      
                    </div>

                    <div class="col-md-12">
                        <div class="form-group">
                            <label class="col-md-2 control-label" style="text-align: end">ASSET TYPE * </label>
                            <div class="col-md-8" style="text-align: initial">
                                <asp:DropDownList ID="drp_add_AssetType" runat="server" CssClass="chosen-select form-control">
                                </asp:DropDownList>
                            </div>
                        </div>      
                    </div>
                </div>               
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="col-sm-12">
            <div class="card-box">
                <div class="row">  
                    <div class="col-md-12">
                        <div class="col-md-12 m-t-10 m-b-10"></div>
                        <%--YEAR -  COMPANY / CLIENT / TENANT / BUYER--%>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">YEAR</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_year"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">COMPANY / CLIENT / TENANT / BUYER</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_company" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-10 m-b-10"></div>

                        <%--BUILDING / PREMISES - LANDLORD / SELLER--%>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">BUILDING / PREMISES</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_building"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">LANDLORD / SELLER</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_landlord" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-10 m-b-10"></div>

                        <%--MUNICIPALITY - AREA (SQM)--%>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">MUNICIPALITY</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_municipality"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">AREA (SQM)</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_area" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-10 m-b-10"></div>

                        <%--REVENUE - TRANSACTION VALUE--%>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">REVENUE</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_revenue"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">TRANSACTION VALUE</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_transaction_value" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12 m-t-10 m-b-10"></div>

                        <%--AGENT--%>
                        <div class="col-md-6">
                            <label class="col-md-4 control-label">AGENT</label>
                            <div class="col-md-8">
                                <asp:TextBox ID="txtbox_agent"  CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>

                        <div class="col-md-12 m-t-10 m-b-10"></div>
                    </div>  


                    
                </div> 
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

            <div class="card-box">

                <h4 class="m-t-0 m-l-8 heading-title"><b>NOTES</b></h4> 
                <p class="text-muted m-b-30 font-16">Enter additional features, comments and notes</p> <!-- used space between title and dropdown list-->
                <div class="form-group m-b-20 m-l-10 m-r-10">
                    <textarea class="form-control" rows="5" id="comment"></textarea>
                </div> 
       
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-sm-12">
            <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
            <div class="card-box">
              <h4 class="m-t-0 m-l-8 heading-title"><b>IMAGES</b></h4> 
                <p class="text-muted m-b-30 font-16">Upload property images, floor plans, and layouts with maximum size of 2MB per image and in JPG format.</p>
               
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-4 control-label">File 1 (Main Photo)</label>
                            <div class="col-md-5">
                                <asp:FileUpload ID="FileUpload1" runat="server" />       
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="FileUploadLbl1" runat="server"></asp:Label>
                            </div>
                        </div>  

                         <div class="form-group">
                            <label class="col-md-4 control-label">File 2 (Floor Plan)</label>
                            <div class="col-md-5">
                                <asp:FileUpload ID="FileUpload2" runat="server" />
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="FileUploadLbl2" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">   
                          <div class="form-group">
                            <label class="col-md-4 control-label">File 3 </label>
                            <div class="col-md-5">
                                <asp:FileUpload ID="FileUpload3" runat="server" />
                                
                            </div>
                              <div class="col-md-3">
                                  <asp:Label ID="FileUploadLbl3" runat="server"></asp:Label>
                              </div>
                        </div>

                         <div class="form-group">
                            <label class="col-md-4 control-label">File 4</label>
                            <div class="col-md-5">
                                <asp:FileUpload ID="FileUpload4" runat="server" />                       
                            </div>
                             <div class="col-md-3">
                                 <asp:Label ID="FileUploadLbl4" runat="server"></asp:Label>
                             </div>
                        </div>
                    </div>

                </div>               
            </div>
        </div>
    </div>

</asp:Content>
