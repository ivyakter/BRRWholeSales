<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="CustomerReview.aspx.cs" Inherits="Pages_Set_CustomerReview" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-3 col-md-offset-2">
                <asp:Label runat="server" ID="lblproductname" Text=" Search By Pid :"></asp:Label>
            </div>

            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtCustomerSearch" CssClass="form-control" OnTextChanged="txtCustomerSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>
     <br />
    <div class="row">
        <div class="col-md-11" style="overflow: auto">
            <asp:GridView ID="addGrid" runat="server" AllowPaging="true" CssClass="table table-striped table-bordered table-hover"  OnRowCommand="addGrid_RowCommand" OnPageIndexChanging="addGrid_PageIndexChanging" PageSize="10" Width="100%"
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
                    
                    <asp:TemplateField HeaderText="Name" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Visible="true" Text='<%# Eval("CustomerName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Comments" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Visible="true" Text='<%# Eval("Comments") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product ID" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblSurName" runat="server" Visible="true" Text='<%# Eval("ProDuctID") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    
                    <asp:TemplateField HeaderText="Date" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblpostcode" runat="server" Visible="true" Text='<%# Eval("Date") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                </Columns>
                <HeaderStyle Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </div>


</asp:Content>

