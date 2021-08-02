<%@ Page Title="" Language="C#" MasterPageFile="~/TrackRecord.Master" AutoEventWireup="true" CodeBehind="track_record_view.aspx.cs" Inherits="SKF_Track_Record_2021.track_record_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-sm-12">
            <div class="btn-group pull-right m-t-15">
                <asp:Button ID="add" runat="server" Text="Add Track Record" CssClass="btn btn-default dropdown-toggle m-r-5" PostBackUrl="~/track_record_add.aspx?&action=new" />
                <asp:Button ID="filter" runat="server" Text="Filter" CssClass="btn btn-warning dropdown-toggle"/>      
            </div>

            <h4 class="page-title">Track Record Database</h4>
            <p class="text-muted page-title-alt">Filter: All</p>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-12">
            <asp:Label ID="lblError" runat="server" Text=""></asp:Label>

            <div class="card-box">
              <h4 class="m-t-0 header-title"><b>Filter</b></h4>
                <p class="text-muted m-b-30 font-13"></p>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="col-md-3 control-label">Year</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="drp_year" runat="server" CssClass="chosen-select form-control">
                                   
                                </asp:DropDownList>
                            </div>
                        </div>  
                    </div>

                    <div class ="col-md-6">
                         <div class="form-group">
                            <label class="col-md-3 control-label">Asset Type</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="drp_asset" runat="server" CssClass="chosen-select form-control">
                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-6">   
                          <div class="form-group">
                            <label class="col-md-3 control-label">Transaction</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="drp_transaction" runat="server" CssClass="chosen-select form-control">
                                    
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class ="col-md-6">
                          <div class="form-group">
                            <label class="col-md-3 control-label">Municipality</label>
                            <div class="col-md-8">
                                <asp:DropDownList ID="drp_municipality" runat="server" CssClass="chosen-select form-control">
                                    <asp:ListItem Selected="True" disabled ="disabled">Select...</asp:ListItem>
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
            <div class="card-box table-responsive">
                   <table id="datatable" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th style="text-align: center">Action</th>
                            <th style="text-align: center">YEAR</th>
                            <th style="text-align: center">TRANSACTION</th>
                            <th style="text-align: center">ASSET TYPE</th>
                            <th style="text-align: center">CLIENT</th>
                            <th style="text-align: center">PROPERTY</th>
                            <th style="text-align: center">AREA (SQM)</th>
                            <th style="text-align: center">REVENUE</th>                          
                        </tr>
                    </thead>
                    <tbody>

                        <% for (int x = 0; x < track_record_view_ds.Tables[0].Rows.Count; x++)
                            {
                            %>
                       <tr>
                           <td style="text-align: center">
                               <a href="track_record_add.aspx?tid=<%=track_record_view_ds.Tables[0].Rows[x]["TrackRecordID"] %>&action=edit" class="btn btn-default"><i class="glyphicon glyphicon-pencil"></i></a>
                               <a onclick="passDataToDeleteModal('<%=track_record_view_ds.Tables[0].Rows[x][0].ToString() %>')" data-toggle="modal" data-target="#delete_track_record" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                           </td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["YEAR"]  %></td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["TRANSACTIONName"]  %></td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["ASSETTYPENAME"]  %></td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["COMPANY"]  %></td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["BUILDING_PREMISES"]  %></td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["AREA"]  %> SQM</td>
                           <td style="text-align: center"><%=track_record_view_ds.Tables[0].Rows[x]["REVENUE"]  %></td>
                       </tr>
                     
                      <% } %>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

     <div id="delete_track_record" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Delete Track Record</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-12 center-block">
                                <asp:Label ID="recordLabel" runat="server" Text="Do you want to delete this record?"></asp:Label>
                            </div>       
                        </div>
                        <asp:HiddenField ID="hdField_del_trackRecordID" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="delete_industryItem" runat="server" Text="Delete"  CssClass="btn btn-danger" OnClick="btnSubmit_Delete"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function passDataToDeleteModal(recordID) {          
            $("#<%=hdField_del_trackRecordID.ClientID %>").val(recordID);
        }
    </script>
</asp:Content>
