<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="AddBannerImage.aspx.cs" Inherits="Pages_Set_AddBannerImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" language="javascript">

        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgCurrent.ClientID%>').prop('src', e.target.result)
                    };
                    reader.readAsDataURL(input.files[0]);
                    }
                }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <br />
    <br />

    <div class="row">
        <div class="col-md-12">
            <div class="col-md-8" style="float: left">
                <h2>Banner Image Set</h2>
                <hr />
                <div class="col-md-8" style="float: left">


                    <div class="form-horizontal">
                        <div class="row form-group">
                            <div class="col-md-4">
                                Image Position  :
                            </div>
                            <div class="col-md-8">
                                <asp:TextBox CssClass="form-control" Text="1" Enabled="false" ID="txtposition" runat="server"></asp:TextBox>
                            </div>
                        </div>


                        <div class="row form-group">
                            <div class="col-md-4">
                                Image 
                            </div>

                            <div class="col-md-8">
                                <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" onchange="ShowImagePreview(this);" />
                                <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidatorfuImg01" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg01"></asp:RequiredFieldValidator>--%>
                            </div>
                        </div>




                        <div class="form-group">
                            <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                                <asp:Button CssClass="Button" ID="btnSave" runat="Server" CausesValidation="false" Text="Save" meta:resourcekey="btnSaveResource1"
                                    OnClick="btnSave_Click" />

                                <%--  <asp:Button CssClass="Button" ID="hlkBack" Text="Edit" runat="server" PostBackUrl="ListBrand.aspx"
                                CausesValidation="False" meta:resourcekey="hlkBackResource1" />--%>
                            </div>
                        </div>
                    </div>
                    <asp:Image ID="imgCurrent" runat="server" Height="150px" Width="150px" ImageAlign="Middle" /><br />
                    <span style="color: Red">Image Dimention : 1349x60</span>
                </div>

                <div class="col-md-2" style="float: left; height: 400px; border-right-style: dotted">
                </div>
            </div>
            <div class="col-md-4" style="float: left">

                <h2>Hider / Show Banner </h2>
                <hr />

                Set Banner :
                <asp:DropDownList runat="server" ID="ddlbannershowhide" CssClass="form-control">
                    <asp:ListItem Value="select">--Select--</asp:ListItem>
                    <asp:ListItem Value="0">Hide</asp:ListItem>
                    <asp:ListItem Value="1">Show</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:Button runat="server" ID="btnshowhide" Text="Set This" OnClick="btnshowhide_Click" />
            </div>
        </div>
    </div>
</asp:Content>

