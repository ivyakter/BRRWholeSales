<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ListDateforregion.aspx.cs" Inherits="Pages_Set_ListDateforregion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="col-md-12">
        <span>
            <h2>Area Name With Day</h2>
        </span>
    </div>
    <div class="row">
        <div class="col-md-5">
            <asp:Button ID="addbtn" runat="server" Text="Add New" PostBackUrl="SetDateforegion.aspx"></asp:Button>
        </div>

    </div>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="false"
                AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" PageSize="10" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="&nbsp;&nbsp;  ID">
                        <ItemTemplate>
                            &nbsp;&nbsp;
                    <%# Eval("ID")%>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Distance (Per Mile) ">
                        <ItemTemplate>
                            &nbsp;&nbsp;
                    <%# Eval("AreaName")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Day">
                        <ItemTemplate>
                            &nbsp;&nbsp;
                    <%# Eval("DaysForArea")%>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit">
                        <ItemTemplate>
                            <asp:Button CssClass="btn-edit" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("SetDateforegion.aspx?ID=", Eval("ID").ToString()) %>'
                                meta:resourcekey="btnEditResource1" />
                        </ItemTemplate>
                        <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Delete">
                        <ItemTemplate>
                            <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                            <asp:Button CssClass="btn-delete" ID="btnDelete" runat="server" Text="Delete" OnClientClick=" return confirm('Clicking ok will delete this record permanently.') "
                                OnClick="btnDelete_Click" />
                        </ItemTemplate>
                        <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                </Columns>

            </asp:GridView>
        </div>
    </div>


</asp:Content>

