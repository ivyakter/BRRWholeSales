<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="OfferTitleSet.aspx.cs" Inherits="Pages_Set_OfferTitleSet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="row">
        <div class="col-md-12 text-center">
            <span>
                <h2>Add/Edit Title</h2>
            </span>
        </div>
    </div>
    <br />
    <div class="col-md-12">
        <div class="row">
          
            <div class="col-md-8">
                <div class="form-horizontal">
                    <div class="form-group">
                        <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text=" Title Id:"></asp:Label>
                        <div class="col-md-4">
                            <asp:TextBox CssClass="form-control" ID="txttitleId" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2">
                            Title Name :
                        </label>
                        <div class="col-md-4">
                            <asp:TextBox ID="txttitle" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                            <asp:Button CssClass="Button" ID="btnSave" runat="Server" Visible="false" Text="Save" meta:resourcekey="btnSaveResource1"
                                OnClick="btnSave_Click" />
                            <asp:Button CssClass="Button" ID="btnupdate" Text="Update" runat="server" CausesValidation="False"
                                OnClick="btnupdate_Click" />
                            <asp:Button CssClass="Button" ID="hlkBack" Text="Back" runat="server" PostBackUrl="ListTitle.aspx"
                                CausesValidation="False" meta:resourcekey="hlkBackResource1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</asp:Content>

