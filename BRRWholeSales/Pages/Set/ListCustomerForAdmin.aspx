<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ListCustomerForAdmin.aspx.cs" Inherits="Pages_Set_ListCustomerForAdmin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-3 col-md-offset-2">
                <asp:Label runat="server" ID="lblproductname" Text=" Search By Email Address :"></asp:Label>
            </div>

            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtCustomerSearch" CssClass="form-control" OnTextChanged="txtCustomerSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>
     <br />
    <div class="row">
        <div class="col-md-12" style="overflow: auto">
            <asp:GridView ID="addGrid" runat="server" AllowPaging="true" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="addGrid_PageIndexChanging" PageSize="10" OnRowCommand="addGrid_RowCommand" OnRowCancelingEdit="addGrid_RowCancelingEdit" OnRowEditing="addGrid_RowEditing" OnRowUpdating="addGrid_RowUpdating" Width="100%"
                AutoGenerateColumns="False" EmptyDataText="No Data Record">
                <RowStyle HorizontalAlign="Center" />
                <Columns>

                    <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btndelete" runat="server" CausesValidation="false" style="padding:6px;" CssClass="btn btn-danger btn-xs" Font-Size="Small" CommandName="cmdDelete" CommandArgument='<%#Eval("ID")%>'
                                Text="Delete" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btndelete"
                                    ConfirmText="Do You Realy Want To Delete This Information !!!" runat="server">
                                </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Edit" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" CausesValidation="false" style="padding:5px 10px;" CssClass="btn btn-warning btn-xs" Font-Size="Small" PostBackUrl='<%# String.Concat("EditCustomer.aspx?PIMGID=", Eval("ID").ToString()) %>'
                                Text="Edit" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--<asp:CommandField HeaderText="Edit" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>--%>

                    <asp:TemplateField HeaderText="Email" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Visible="true" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail" runat="server" Text='<%#Eval("Email")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--  <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" First Name" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Visible="true" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Last Name" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblSurName" runat="server" Visible="true" Text='<%# Eval("SurName") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Phone Number" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Visible="true" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%#Eval("Phone")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--<ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Post Code" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblpostcode" runat="server" Visible="true" Text='<%# Eval("PostCode") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="HouseNo" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblHouseNo" runat="server" Visible="true" Text='<%# Eval("HouseNo") %>'></asp:Label>
                        </ItemTemplate> 
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Address" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblAddress" runat="server" Visible="true" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate> 
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Distance" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblDistance" runat="server" Visible="true" Text='<%# Eval("Distance") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpostcode" runat="server" Text='<%#Eval("Distance")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%-- <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                                        

                </Columns>
                <HeaderStyle Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </div>


</asp:Content>

