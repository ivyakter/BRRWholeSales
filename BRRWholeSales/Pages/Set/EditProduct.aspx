<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="Pages_Set_EditProduct" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <br />
    <br />
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-3 col-md-offset-2">
                <asp:Label runat="server" ID="lblproductname" Text=" Search by product code :"></asp:Label>
            </div>

            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtproductname" CssClass="form-control" OnTextChanged="txtproductname_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="col-md-12" style="padding-top: 60px">
        <div class="row" style="overflow-x: scroll">

            <div class="col-md-12">
                <asp:GridView ID="GridView1" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    PageSize="15" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" OnRowCommand="GridView1_RowCommand" runat="server" AutoGenerateColumns="False"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btndelete" runat="server" CausesValidation="false" CssClass="btn btn-danger btn-xs" Font-Size="Small" CommandName="cmdDelete" CommandArgument='<%#Eval("PID")%>'
                                    Text="Delete" />
                                <asp:ConfirmButtonExtender ID="ConfirmButtonExtender1" TargetControlID="btndelete"
                                    ConfirmText="Do You Realy Want To Delete This Information !!!" runat="server">
                                </asp:ConfirmButtonExtender>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" ForeColor="Black"></HeaderStyle>
                        </asp:TemplateField>

                        <%--<asp:CommandField HeaderText="Edit" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:CommandField>--%>

                        <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button CssClass="btn-edit btn btn-warning btn-xs" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("AddProducts.aspx?PIMGID=", Eval("PID").ToString()) %>'
                                    meta:resourcekey="btnEditResource1" />
                            </ItemTemplate>
                            <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:HiddenField ID="hfId" Value='<%# Eval("PID") %>' runat="server" />
                                <asp:Repeater ID="rprt" runat="server">
                                    <ItemTemplate>
                                        <img width="30" src="../../ProductImage/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" height="30" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                    </ItemTemplate>
                                </asp:Repeater>
                                <%-- <ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Center">--%>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="id" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("PID") %>'></asp:Label>
                            </ItemTemplate>
                            <%--  <EditItemTemplate>
                                <asp:Label ID="lblPIMGID" runat="server" Visible="false" Text='<%# Eval("PIMGID") %>'></asp:Label>
                            </EditItemTemplate>--%>
                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblPName" runat="server" Visible="true" Text='<%# Eval("PName") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPName" Width="100%" runat="server" Text='<%#Eval("PName")%>'></asp:TextBox>
                                <asp:TextBox ID="txtPID" runat="server" Visible="false" Text='<%#Eval("PID") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" Width="300px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                          <asp:TemplateField HeaderText="ProductCode" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblProductCodes" runat="server" Visible="true" Text='<%# Eval("ProductCode") %>'></asp:Label>
                            </ItemTemplate>
                          
                            <ControlStyle Height="20px"/>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Occation" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblOccation" runat="server" Visible="true" Text='<%# Eval("Occation") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOccation" runat="server" Text='<%#Eval("Occation")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <%-- <ControlStyle Height="20px" Width="100px" />--%>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="OccationDesc" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblOccationDesc" runat="server" Visible="true" Text='<%# Eval("OccationDesc") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOccationDesc" runat="server" Text='<%#Eval("OccationDesc")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px"/>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="OccationRemain" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblOccationRemain" runat="server" Visible="true" Text='<%# Eval("OccationRemain") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtOccationRemain" runat="server" Text='<%#Eval("OccationRemain")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                         <asp:TemplateField HeaderText="ProductCode" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblproductcode" runat="server" Visible="true" Text='<%# Eval("ProductCode") %>'></asp:Label>
                            </ItemTemplate>
                           
                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>



                        <%--     <asp:TemplateField HeaderText="Namefromtblproductimage" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblNamefromtblimage" runat="server" Visible="true" Text='<%# Eval("Name") %>'></asp:Label>
                            </ItemTemplate>

                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>--%>






                        <asp:TemplateField HeaderText="Old Price" Visible="false" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblcusid" runat="server" Visible="true" Text='<%# Eval("PPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPPrice" runat="server" Text='<%#Eval("PPrice")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" Width="100px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Del Price" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblSellPrice" runat="server" Visible="true" Text='<%# Eval("PSelPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPSelPrice" runat="server" Text='<%#Eval("PSelPrice")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Col Price" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblcollprice" runat="server" Visible="true" Text='<%# Eval("CollectionPrice") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtcollprice" runat="server" Text='<%#Eval("CollectionPrice")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Category"  ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblcategory" runat="server" Visible="true" Text='<%# Eval("MenuText") %>'></asp:Label>
                            </ItemTemplate>
                    
                            <ControlStyle Height="20px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>


                        <%-- <asp:TemplateField HeaderText="Description" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblDescription" runat="server" Visible="true" Text='<%# Server.HtmlDecode(Eval("PDescription").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <CKEditor:CKEditorControl ID="txtPDescription" Height="100px" Text='<%# Server.HtmlDecode(Eval("PDescription").ToString()) %>' Width="500px" BasePath="../../ckeditor/" runat="server">
                                </CKEditor:CKEditorControl>
                             
                            </EditItemTemplate>
                            <ControlStyle Height="100px" Width="500px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>--%>


                        <%--         <asp:TemplateField HeaderText="Details" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblDetails" runat="server" Visible="true" Text=' <%# Server.HtmlDecode(Eval("PProductDetails").ToString()) %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <CKEditor:CKEditorControl ID="txtPProductDetails" Height="100px" Text=' <%# Server.HtmlDecode(Eval("PProductDetails").ToString()) %>' Width="500px" BasePath="../../ckeditor/" runat="server">
                                </CKEditor:CKEditorControl>
                             
                            </EditItemTemplate>
                            <ControlStyle Height="100px" Width="500px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Unit" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Label ID="lblUnit" runat="server" Visible="true" Text='<%# Eval("Unit") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtUnit" runat="server" Text='<%#Eval("Unit")%>'></asp:TextBox>
                            </EditItemTemplate>
                            <ControlStyle Height="20px" />
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>



</asp:Content>

