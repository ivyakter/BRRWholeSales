<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="Pages_Set_ChangePassword" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <asp:ScriptManager runat="server" ID="scm1"></asp:ScriptManager>
 <%--    <div class="col-md-12 h2 text-center">
        <span>
           Chane UserName Or Password
        </span>
    </div>--%>

    <br />
    <br />
   

    <div class="col-md-12">

        <div class="form-horizontal">
            <%--     <div class="col-md-12">--%>

            <center>                
                <asp:Label ID="lblstuinfo" ForeColor="#86AFD2" Font-Bold="true" Font-Italic="true" Font-Size="XX-Large" runat="server" Text="   Change UserName Or Password"></asp:Label>
            </center>
            <hr />
           
            <div class="form-group">
                <asp:Label ID="Label1" runat="server" CssClass="col-md-4 control-label" Text="User Name"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtusername" CssClass="form-control" runat="server" Width="50%"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtusername"></asp:RequiredFieldValidator>
                </div>
            </div>

              <div class="form-group">
                <asp:Label ID="Label2" runat="server" CssClass="col-md-4 control-label" Text="Password"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox ID="txtpassword" CssClass="form-control" runat="server" Width="50%"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                </div>
            </div>


            <div class="form-group">
                <div class="col-md-5"></div>
                <div class="col-md-4">
                    <asp:Button ID="btnAdd" runat="server" Text="Add New Admin" CssClass="btn btn-default" OnClick="btnAdd_Click" />
                </div>
            </div>
         
        </div>
    </div>
    <br />
    <br />


    <%-- //////////////////////--%>
    <div>
      <center>
           <asp:Button ID="Button1" CausesValidation="false" CssClass="btn btn-primary btn-md" runat="server" Text="Show All Admin" />
      </center>
       

        <asp:ModalPopupExtender ID="mp1" runat="server" PopupControlID="UpdatePanel1" TargetControlID="Button1"
            CancelControlID="Button2" BackgroundCssClass="Background">
        </asp:ModalPopupExtender>

        <%--   <asp:Panel ID="Panl1" runat="server" CssClass="Popup" align="center" Style="display: none">--%>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server" CssClass="Popup"  UpdateMode="Conditional" 
                ChildrenAsTriggers="true" align="center" Style="display: none">

            <ContentTemplate>

                <div class="modal-dialog model-lg">
                    <div class="modal-content" style="min-width:725px">
                        <div class="modal-header">

                         <asp:Label ID="Label3" ForeColor="#86AFD2" Font-Bold="true" Font-Italic="true" Font-Size="XX-Large" runat="server" Text="All Users "></asp:Label>
                  
                        </div>
                        <div class="row">                      
                                <div class="col-md-12">
                                   <asp:GridView ID="addGrid" runat="server" AllowPaging="true" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="addGrid_PageIndexChanging" PageSize="4" OnRowCommand="addGrid_RowCommand" OnRowCancelingEdit="addGrid_RowCancelingEdit" OnRowEditing="addGrid_RowEditing" OnRowUpdating="addGrid_RowUpdating" Width="100%"
                                        AutoGenerateColumns="False" EmptyDataText="No Data Record">
                                       <RowStyle HorizontalAlign="Left" />
                                        <Columns>

                                            <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Button ID="btndelete" runat="server" CausesValidation="false" CssClass="btn btn-danger btn-xs" Font-Size="Small" CommandName="cmdDelete" CommandArgument='<%#Eval("ID")%>'
                                                        Text="Delete"/>
                                                    <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btndelete"
                                                        ConfirmText="Do You Realy Want To Delete This Information !!!" runat="server">
                                                    </asp:ConfirmButtonExtender>
                                                </ItemTemplate>
                                                <HeaderStyle HorizontalAlign="Center" ForeColor="Black"></HeaderStyle>
                                            </asp:TemplateField>

                                            <asp:CommandField HeaderText="Edit" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:CommandField>

                                            <asp:TemplateField HeaderText="ID." Visible="false">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("ID") %>'></asp:Label>
                                                </ItemTemplate>                                             
                                                <HeaderStyle ForeColor="Black"></HeaderStyle>
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="User Name" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblname" runat="server" Visible="true" Text='<%# Eval("Name") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtname" runat="server" Text='<%#Eval("Name")%>'></asp:TextBox>
                                                    <asp:TextBox ID="txtId" runat="server" Visible="false" Text='<%#Eval("ID") %>'></asp:TextBox>
                                                </EditItemTemplate>
                                                                                                                                      
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Password" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblpassword" runat="server" Visible="true" Text='<%# Eval("Password") %>'></asp:Label>
                                                </ItemTemplate>
                                                <EditItemTemplate>
                                                    <asp:TextBox ID="txtpassword" runat="server" Text='<%#Eval("Password")%>'></asp:TextBox>                                               
                                                </EditItemTemplate>                                                                                          
                                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                            </asp:TemplateField>



                                        </Columns>
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <AlternatingRowStyle BackColor="White" />
                                    </asp:GridView>

                                </div>
                         </div>  
                      
                        <div class="modal-footer">                       
                            <asp:Button ID="Button2" runat="server" CausesValidation="false" OnClick="Button2_Click" Enabled="True" class="btn btn-danger" Text="Close" />
                        </div>
                    </div>
                </div>
                <br />
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
            </Triggers>

        </asp:UpdatePanel>
       
    </div>


</asp:Content>

