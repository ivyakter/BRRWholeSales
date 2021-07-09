<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ListTitle.aspx.cs" Inherits="Pages_Set_ListTitle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12 text-center">
        <span>
            <h2>Size List</h2>
        </span>
    </div>

    <div class="clearfix">
        <asp:Button ID="addbtn" runat="server" Visible="false" Text="Add New" PostBackUrl="~/Pages/Set/OfferTitleSet.aspx"></asp:Button>
    </div>
    <br />
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
        SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%" OnPageIndexChanging="gv_PageIndexChanging">
        <Columns>
            <asp:TemplateField HeaderText="&nbsp;&nbsp; Title ID">
                <ItemTemplate>
                    &nbsp;&nbsp; <%# Eval("ID")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="&nbsp;&nbsp; Title Name ">
                <ItemTemplate>
                    &nbsp;&nbsp; <%# Eval("Title")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit">
                <ItemTemplate>
                    <asp:Button CssClass="btn-edit" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("OfferTitleSet.aspx?ID=", Eval("ID").ToString()) %>'
                        meta:resourcekey="btnEditResource1" />
                </ItemTemplate>
                <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="&nbsp;&nbsp; Delete">
                <ItemTemplate>
                    <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                    <asp:Button CssClass="btn-delete" ID="btnDelete" runat="server" Text="Delete"
                        OnClientClick=" return confirm('Clicking ok will delete this record permanently.') "
                        OnClick="btnDelete_Click" />
                </ItemTemplate>
                <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

</asp:Content>

