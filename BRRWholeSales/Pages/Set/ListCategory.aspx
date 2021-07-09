<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="ListCategory.aspx.cs" Inherits="Pages_Set_ListCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    
        <div class="col-md-12">
            <span>
                <h2>List Of Category</h2>
            </span>
        </div>
        <div class="row">
            <div class="col-md-5">
                <asp:Button ID="addbtn" runat="server" Text="Add New" PostBackUrl="AddCategory.aspx"></asp:Button>
            </div>

        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gv" runat="server" CssClass="table table-striped table-bordered table-hover" OnRowEditing="gv_RowEditing" OnRowUpdating="gv_RowUpdating" OnRowCancelingEdit="gv_RowCancelingEdit" AutoGenerateColumns="false"
                    AllowPaging="True" OnPageIndexChanging="gv_PageIndexChanging" PageSize="10" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="&nbsp;&nbsp;  ID">
                            <ItemTemplate>
                                &nbsp;&nbsp;
                    <%# Eval("Id")%>
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="&nbsp;&nbsp; Category Name ">
                            <ItemTemplate>
                                  <asp:Label ID="lblcatname" runat="server" Visible="true" Text='<%# Eval("MenuText") %>'></asp:Label>                         
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox runat="server" ID="txtcatname" Text='<%# Eval("MenuText") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="Image Name"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblNamefromtblimage" runat="server" Visible="true" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>
                       
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image Size"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblimagesize" runat="server" Visible="true" Text='<%# Eval("ImageSize") %>'></asp:Label>
                            </ItemTemplate>
                          
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="id" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblcatid" runat="server" Visible="true" Text='<%# Eval("CatIMGID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Label ID="lblPIMGID" runat="server" Visible="false" Text='<%# Eval("CatIMGID") %>'></asp:Label>
                            </EditItemTemplate>
                           
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <img width="80" height="80" src="../../CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                <%-- <ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Center">--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit">
                            <ItemTemplate>
                                <asp:Button CssClass="btn-edit" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("AddCategory.aspx?Id=", Eval("CatIMGID").ToString()) %>'
                                    meta:resourcekey="btnEditResource1" />
                            </ItemTemplate>
                            <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                         <%--<asp:CommandField HeaderText="Edit" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:CommandField>--%>

                        <asp:TemplateField HeaderText="&nbsp;&nbsp; Delete">
                            <ItemTemplate>
                                <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
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

