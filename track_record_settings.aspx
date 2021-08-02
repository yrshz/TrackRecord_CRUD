<%@ Page Title="" Language="C#" MasterPageFile="~/TrackRecord.Master" AutoEventWireup="true" CodeBehind="track_record_settings.aspx.cs" Inherits="SKF_Track_Record_2021.transaction_record_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <div class="row">
        <div class="col-sm-12">
            <h4 class="page-title">Track Record Database</h4>
            <p class="text-muted page-title-alt">Filter: All</p>
        </div>
    </div>
   
    <div class="row">

        <div class="col-lg-12">

            <%--NAVIGATION TAB--%>
            <ul class="nav nav-tabs nav-justified" id ="myTab" role="tablist">
                <li class="active tab" role="presentation">
                    <a data-toggle="tab" href="#transaction_tab" aria-expanded="false" role="tab">
                        <span class="visible-xs"><i class="fa fa-home"></i></span>
                        <span class="hidden-xs">TRANSACTION</span>
                    </a>
                </li>
                <li class="tab " role="presentation">
                    <a data-toggle="tab" href="#industry_tab" aria-expanded="false" role="tab">
                        <span class="visible-xs"><i class="fa fa-home"></i></span>
                        <span class="hidden-xs">INDUSTRY</span>
                    </a>
                </li>
                <li class="tab" role="presentation">
                    <a data-toggle="tab" href="#asset_type_tab" aria-expanded="false" role="tab">
                        <span class="visible-xs"><i class="fa fa-home"></i></span>
                        <span class="hidden-xs">ASSET TYPE</span>
                    </a>
                </li>
            </ul>

            <div class="tab-content">
                <%--TRANSACTION TABLE--%>
                <div id="transaction_tab" class="tab-pane fade in active" role="tabpanel">
                    <div class="row m-b-10">
                        <a onclick="openModalAddToList" data-toggle="modal" data-target="#transaction_modal" class="btn btn-success btn-margin"><i class="glyphicon glyphicon-plus"></i> Add</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="transaction_datatable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center" class="col-sm-6">Action</th>
                                            <th style="text-align: initial" class="col-sm-6">Transaction</th>                             
                                        </tr>
                                    </thead>
                                    <tbody>

                                        <% for (int x = 0; x < track_record_settings_ds.Tables[0].Rows.Count; x++)
                                            {%>

                                            <tr>
                                                <td style="text-align: initial">
                                                    <a onclick="passDataToEditModal('<%=track_record_settings_ds.Tables[0].Rows[x][0].ToString() %>', '<%=track_record_settings_ds.Tables[0].Rows[x][1].ToString() %>', 'Transaction')" data-toggle="modal" data-target="#edit_transaction_modal" class="btn btn-default"><i class="glyphicon glyphicon-pencil"></i></a>
                                                    <a onclick="passDataToDeleteModal('<%=track_record_settings_ds.Tables[0].Rows[x][0].ToString() %>','<%=track_record_settings_ds.Tables[0].Rows[x][1].ToString() %>','Transaction')" data-toggle="modal" data-target="#delete_transaction_modal" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                                                </td>
                                                <td style="text-align: initial"><% = track_record_settings_ds.Tables[0].Rows[x]["TRANSACTIONName"] %></td>    
                                            </tr>

                                        <%} %>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>


               <%-- INDUSTRY TABLE--%>
                <div id="industry_tab" class="tab-pane fade" role="tabpanel">
                    <div class="row m-b-10">
                        <a onclick="openModalAddToList" data-toggle="modal" data-target="#industry_modal" class="btn btn-success btn-margin"><i class="glyphicon glyphicon-plus"></i> Add</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="industry_datatable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center" class="col-sm-6">Action</th>
                                            <th style="text-align: initial" class="col-sm-6">Industry</th>                             
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <% for (int x = 0; x < track_record_settings_ds.Tables[1].Rows.Count; x++) { %>

                                            <tr>
                                                <td style="text-align: initial">
                                                    <a onclick="passDataToEditModal('<%=track_record_settings_ds.Tables[1].Rows[x][0].ToString() %>','<%=track_record_settings_ds.Tables[1].Rows[x][1].ToString() %>','Industry')" data-toggle="modal" data-target="#edit_industry_modal" class="btn btn-default"><i class="glyphicon glyphicon-pencil"></i></a>
                                                    <a onclick="passDataToDeleteModal('<%=track_record_settings_ds.Tables[1].Rows[x][0].ToString() %>','<%=track_record_settings_ds.Tables[1].Rows[x][1].ToString() %>','Industry')" data-toggle="modal" data-target="#delete_industry_modal" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                                                </td>
                                                <td style="text-align: initial"><% = track_record_settings_ds.Tables[1].Rows[x]["INDUSTRYName"] %></td>    
                                            </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

               <%-- ASSET TYPE TABLE--%>
                <div id="asset_type_tab" class="tab-pane fade" role="tabpanel">
                    <div class="row m-b-10">
                        <a onclick="openModalAddToList" data-toggle="modal" data-target="#asset_type_modal" class="btn btn-success btn-margin"><i class="glyphicon glyphicon-plus"></i> Add</a>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card-box table-responsive">
                                <table id="asset_type_datatable" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th style="text-align: center" class="col-sm-6">Action</th>
                                            <th style="text-align: initial" class="col-sm-6">Asset Type</th>                             
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for (int x = 0; x < track_record_settings_ds.Tables[2].Rows.Count; x++) { %>
                                            <tr>
                                                <td style="text-align: initial">
                                                    <a onclick="passDataToEditModal('<%=track_record_settings_ds.Tables[2].Rows[x][0].ToString() %>', '<%=track_record_settings_ds.Tables[2].Rows[x][1].ToString() %>', 'Asset')" data-toggle="modal" data-target="#edit_asset_type_modal" class="btn btn-default"><i class="glyphicon glyphicon-pencil"></i></a>
                                                    <a onclick="passDataToDeleteModal('<%=track_record_settings_ds.Tables[2].Rows[x][0].ToString() %>', '<%=track_record_settings_ds.Tables[2].Rows[x][1].ToString() %>', 'Asset')" data-toggle="modal" data-target="#delete_asset_modal" class="btn btn-danger"><i class="glyphicon glyphicon-trash"></i></a>
                                                </td>
                                            <td style="text-align: initial"><% = track_record_settings_ds.Tables[2].Rows[x]["ASSETTYPEName"] %></td>    
                                        </tr>
                                        <%} %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                 </div>   
            </div>
        </div>
    </div>
    

    <%--ADD MODALS--%>
    <div id="transaction_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Add Transaction</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Transaction </label>
                        <div class="col-sm-9"><asp:TextBox ID="add_transaction_txtbox" runat="server" CssClass ="form-control"></asp:TextBox></div>
                    </div>
                   
                </div>
                <div class="modal-footer">
                    <asp:Button ID="add_transaction_modal" runat="server" Text="Submit"  CssClass="btn btn-default" OnClick="modal_AddRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="industry_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Add Industry</h4>
                </div>

                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Industry </label>
                        <div class="col-sm-9"><asp:TextBox ID="add_industry_txtbox" runat="server" CssClass ="form-control"></asp:TextBox></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="add_industry_modal" runat="server" Text="Submit"  CssClass="btn btn-default" OnClick="modal_AddRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="asset_type_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Add Asset Type</h4>
                </div>
                <div class="modal-body">
                    <div class ="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Asset Type </label>
                        <div class="col-sm-9"><asp:TextBox ID="add_asset_txtbox" runat="server" CssClass ="form-control"></asp:TextBox></div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="add_asset_modal" runat="server" Text="Submit"  CssClass="btn btn-default" OnClick="modal_AddRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%--EDIT MODALS--%>
    <div id="edit_transaction_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Edit Transaction</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Transaction</label>
                        <div class="col-sm-9"><asp:TextBox ID="trans_txtbox_edit_modal" runat="server" CssClass ="form-control"></asp:TextBox></div>
                        <asp:HiddenField ID="hdField_transID" runat="server" />
                    </div>
                  
                </div>
                <div class="modal-footer">
                    <asp:Button ID="update_transactionItem" runat="server" Text="Update"  CssClass="btn btn-default" OnClick="modal_EditRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="edit_industry_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Edit Industry</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Industry </label>
                        <div class="col-sm-9"><asp:TextBox ID="industry_txtbox_edit_modal" runat="server" CssClass ="form-control"></asp:TextBox></div>
                        <asp:HiddenField ID="hdField_industryID" runat="server" />
                    </div>
                    
                </div>
                <div class="modal-footer">
                    <asp:Button ID="update_industryItem" runat="server" Text="Update"  CssClass="btn btn-default" OnClick="modal_EditRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="edit_asset_type_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Edit Asset Type</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: end">Asset Type </label>
                        <div class="col-sm-9"><asp:TextBox ID="asset_txtbox_edit_modal" runat="server" CssClass ="form-control"></asp:TextBox></div>
                        <asp:HiddenField ID="hdField_assetID" runat="server" />
                    </div>
                   
                </div>
                <div class="modal-footer">
                    <asp:Button ID="update_assetItem" runat="server" Text="Update"  CssClass="btn btn-default" OnClick="modal_EditRecord"/>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

      <%--DELETE MODALS--%>
     <div id="delete_transaction_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Delete Transaction Item</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="del_transLabel" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="hdField_del_transID" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="delete_transItem" runat="server" Text="Delete"  CssClass="btn btn-danger" OnClick="modal_DeleteRecord"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <div id="delete_industry_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Delete Industry Item</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="del_industryLabel" runat="server" Text=""></asp:Label>
                        <asp:HiddenField ID="hdField_del_industryID" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="delete_industryItem" runat="server" Text="Delete"  CssClass="btn btn-danger" OnClick="modal_DeleteRecord"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <div id="delete_asset_modal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="header-title">Delete Asset Type Item</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="del_assetLabel" runat="server" Text="" ></asp:Label>
                        <asp:HiddenField ID="hdField_del_assetID" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="delete_assetItem" runat="server" Text="Delete"  CssClass="btn btn-danger" OnClick="modal_DeleteRecord"/>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>


    <script type="text/javascript">
        function passDataToDeleteModal(recordID, recordValue, recordType) {
            var x = returnRecordTypeDel(recordType)
            
            document.getElementById(x[0]).innerHTML = "Do you want to delete : " + recordValue + "?";
            $(x[1]).val(recordID);
        }

        function returnRecordTypeDel(recordType) {
            var x = []
            if (recordType === 'Transaction') {
                x.push("<%= del_transLabel.ClientID%>")
                x.push("#<%= hdField_del_transID.ClientID%>")
            }
            if (recordType == 'Industry') {
                x.push("<%= del_industryLabel.ClientID%>")
                x.push("#<%= hdField_del_industryID.ClientID%>")
            }
            if (recordType == 'Asset') {
                x.push("<%= del_assetLabel.ClientID%>")
                x.push("#<%= hdField_del_assetID.ClientID%>")
            }
            return x;
        }
    </script>
   

    <script type="text/javascript">
        function passDataToEditModal(recordID, recordValue, recordType) {
            var x = returnRecordType(recordType)
            $(x[0]).val(recordValue);
            $(x[1]).val(recordID);
        }

        function returnRecordType(recordType) {
            var x = []
            if (recordType === 'Transaction') {
                x.push("#<%= trans_txtbox_edit_modal.ClientID%>")
                        x.push("#<%= hdField_transID.ClientID%>")
            }
            if (recordType == 'Industry') {
                        x.push("#<%= industry_txtbox_edit_modal.ClientID%>")
                    x.push("#<%= hdField_industryID.ClientID%>")
            }
            if (recordType == 'Asset') {
                    x.push("#<%= asset_txtbox_edit_modal.ClientID%>")
                    x.push("#<%= hdField_assetID.ClientID%>")
            }
            return x;
        }
    </script>



</asp:Content>
