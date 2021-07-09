<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="AddCategory.aspx.cs" Inherits="Pages_Set_AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">

        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgCurrent1.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                }

        }

        
        function ShowImagePreviewedit(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image2.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                }

            }

           
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <br />
    <br />

    <%--    <asp:UpdatePanel ID="updatepanel1" runat="server">
        <ContentTemplate>--%>


    <div class="col-md-12">
        <div class="row">
            <div class="col-md-6">

                <div class="form-horizontal">
                    <div class="row form-group">
                        <div class="col-md-6">
                            Category ID :
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txtcatid" runat="server"></asp:TextBox>
                            <asp:Label runat="server" ID="lblmaincatID" Visible="false"></asp:Label>
                        </div>
                    </div>
                    <div class="row form-group">
                        <div class="col-md-6">
                            Category Name:
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txtcategoryname" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            Big Image(580X300):
                        </div>
                        <div class="col-md-4">
                            <asp:FileUpload ID="fuImg01" ToolTip="Size :1349x313" CssClass="form-control" runat="server" onchange="ShowImagePreview(this);" />
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            Small Image 1( 271x150):
                        </div>
                        <div class="col-md-4">
                            <asp:FileUpload ID="fuImg02" ToolTip="Size : 271x150" CssClass="form-control" runat="server" onchange="ShowImagePreview(this);" />
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            Small Image 2( 271x150):
                        </div>
                        <div class="col-md-4">
                            <asp:FileUpload ID="fuImg03" ToolTip="Size : 271x150" CssClass="form-control" runat="server" onchange="ShowImagePreview(this);" />
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            Edit Image:
                        </div>
                        <div class="col-md-4">
                            <asp:FileUpload ID="FileUploadedit" Visible="false" CssClass="form-control" runat="server" onchange="ShowImagePreviewedit(this);" />
                        </div>
                    </div>

                    <div class="row form-group">

                        <div class="col-md-6">
                            Category Title :
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txttitle" runat="server"></asp:TextBox>
                        </div>
                    </div>

                    <div class="row form-group">
                        <div class="col-md-6">
                            Category Description :
                        </div>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txtdesc" runat="server"></asp:TextBox>
                        </div>
                    </div>


                    <div class="row form-group">
                        <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                            <asp:Button CssClass="Button" ID="btnSave" runat="Server" Text="Save" meta:resourcekey="btnSaveResource1"
                                OnClick="btnSave_Click" />
                            <asp:Button CssClass="Button" ID="btnupdate" Text="Update" runat="server" CausesValidation="False"
                                OnClick="btnupdate_Click" />
                            <asp:Button CssClass="Button" ID="hlkBack" Text="Back" runat="server" PostBackUrl="ListCategory.aspx"
                                CausesValidation="False" meta:resourcekey="hlkBackResource1" />
                        </div>
                    </div>
                </div>


            </div>




            <div class="col-md-6">
                <div class="row">
                <div class="col-md-6">
                    <asp:Image ID="imgCurrent1" runat="server" Height="150px" Width="150px" ImageAlign="Middle" /><br />
                  <%--  <span style="color: Red">Big Image Dimention : 440x550</span>--%>

                    <asp:Repeater runat="server" ID="rptredit" Visible="false">
                        <ItemTemplate>
                            <img width="150" height="150" src="../../CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                            <%-- <ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Center">--%>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <div class="col-md-6">
                    <asp:Image ID="Image2" runat="server" Height="150px" Width="150px" Visible="false" ImageAlign="Middle" /><br />
                   
                </div>

                </div>


            </div>
        </div>
    </div>
    <%--       </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

