<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="AddSize.aspx.cs" Inherits="Pages_Set_AddSize" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <div class="row">
        <div class="col-md-12 text-center">
            <span>
                <h2>Add/Edit Size</h2>
            </span>
        </div>
    </div>
    <br />
    <div class="col-md-12">
        <div class="row">
          
            <div class="col-md-8">
                <div class="form-horizontal">
                    <div class="row form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text=" Size Id:"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txtsizeid" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row form-group">
                        <label class="col-md-2">
                            Size Name :
                        </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txtsizename" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                            <asp:Button CssClass="Button" ID="btnSave" runat="Server" Text="Save" meta:resourcekey="btnSaveResource1"
                                OnClick="btnSave_Click" />
                            <asp:Button CssClass="Button" ID="btnupdate" Text="Update" runat="server" CausesValidation="False"
                                OnClick="btnupdate_Click" />
                            <asp:Button CssClass="Button" ID="hlkBack" Text="Back" runat="server" PostBackUrl="ListSize.aspx"
                                CausesValidation="False" meta:resourcekey="hlkBackResource1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

