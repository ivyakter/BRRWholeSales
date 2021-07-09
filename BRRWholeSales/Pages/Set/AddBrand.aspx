<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="AddBrand.aspx.cs" Inherits="Pages_Set_AddBrand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">


    <br />
    <br />

            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-8 col-md-offset-4">


                        <div class=" form-horizontal">
                            <div class="row form-group">
                                <div class="col-md-4">
                                    Brand ID :
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox CssClass="form-control" ID="txtbrandid" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col-md-4">
                                    Brand Name:
                                </div>
                                <div class="col-md-4">
                                    <asp:TextBox CssClass="form-control" ID="txtbrandname" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="row form-group">
                                <div class="col-md-4">
                                   Image 
                                </div>

                                <div class="col-md-4">
                                    <asp:FileUpload ID="fuImg01" CssClass="form-control"  runat="server" />
                                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidatorfuImg01" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg01"></asp:RequiredFieldValidator>--%>
                                </div>
                            </div>




                            <div class="form-group">
                                <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                                    <asp:Button CssClass="Button" ID="btnSave" runat="Server" Text="Save" meta:resourcekey="btnSaveResource1"
                                        OnClick="btnSave_Click"/>
                                  
                                    <asp:Button CssClass="Button" ID="hlkBack" Text="Edit" runat="server" PostBackUrl="ListBrand.aspx"
                                        CausesValidation="False" meta:resourcekey="hlkBackResource1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>






</asp:Content>

