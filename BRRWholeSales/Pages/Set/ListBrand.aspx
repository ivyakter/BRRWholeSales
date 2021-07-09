<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ListBrand.aspx.cs" Inherits="Pages_Set_ListBrand" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <div class="col-md-12">
        <span>
            <h2>List Of Brand</h2>
        </span>
    </div>
    <div class="row">
        <div class="col-md-5">
            <asp:Button ID="addbtn" runat="server" Text="Add New" PostBackUrl="AddBrand.aspx"></asp:Button>
        </div>

    </div>
    <br />

    <div class="row">
        <div class="col-md-12">

            <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered table-hover" OnRowCommand="gv_RowCommand" AutoGenerateColumns="false"
                AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" OnRowDataBound="gv_RowDataBound" OnRowEditing="gv_RowEditing" OnRowCancelingEdit="gv_RowCancelingEdit" OnRowUpdating="gv_RowUpdating" PageSize="10" Width="100%">
                <Columns>

                    <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btndelete" runat="server" CausesValidation="false" CssClass="btn btn-danger btn-xs" Font-Size="Small" CommandName="cmdDelete" CommandArgument='<%#Eval("ID")%>'
                                Text="Delete" />
                            <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btndelete"
                                ConfirmText="Do You Realy Want To Delete This Information !!!" runat="server">
                            </asp:ConfirmButtonExtender>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" ForeColor="Black"></HeaderStyle>
                    </asp:TemplateField>

                    <asp:CommandField HeaderText="Edit" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>

                    <asp:TemplateField HeaderText="&nbsp;&nbsp;  ID">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtbid" runat="server" Visible="false" Text='<%# Eval("ID") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="id" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblbid" runat="server" Visible="true" Text='<%# Eval("BID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblPIMGID" runat="server" Visible="false" Text='<%# Eval("BIMGID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>


                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Brand Name ">
                        <ItemTemplate>
                            <asp:Label ID="lbbrandname" runat="server" Visible="true" Text='<%# Eval("BrandName") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtbrandname" runat="server" Text='<%# Eval("BrandName") %>'></asp:TextBox>
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <img width="80" src="../../BrandImage/<%#Eval("BID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">                    
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                      <asp:TemplateField HeaderText="Namefromtblproductimage" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblNamefromtblimage" runat="server" Visible="true" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>

                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>



                </Columns>

            </asp:GridView>
        </div>
    </div>



</asp:Content>

