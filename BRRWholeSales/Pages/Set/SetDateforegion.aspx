<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="SetDateforegion.aspx.cs" Inherits="Pages_Set_SetDateforegion" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <br />
    <br />

    <div class="h1 text-center font-red">
        Date Set For Region
    </div>
    <br />
    <br />



            <div class="row">
                <div class="col-md-12">
                    <div class="col-md-8 col-md-offset-4">


                        <div class="form-horizontal">
                            <div class="form-group">
                                <label class="col-md-2">
                                    Area ID :
                                </label>
                                <div class="col-md-4">
                                    <asp:TextBox CssClass="form-control" ID="txtareaid" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-md-2">
                                    Distance:
                                </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddlareaname"  CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                            </div>



                            <div class="form-group">
                                <label class="col-md-2">
                                    Day Name :
                                </label>
                                <div class="col-md-4">
                                    <asp:DropDownList ID="ddldayname" CssClass="form-control" runat="server">
                                        <asp:ListItem>--Select--</asp:ListItem>
                                        <asp:ListItem>Saturday</asp:ListItem>
                                        <asp:ListItem>Sunday</asp:ListItem>
                                        <asp:ListItem>Monday</asp:ListItem>
                                        <asp:ListItem>Tuesday</asp:ListItem>
                                        <asp:ListItem>Wednesday</asp:ListItem>
                                        <asp:ListItem>Thrusday</asp:ListItem>
                                        <asp:ListItem>Friday</asp:ListItem>

                                    </asp:DropDownList>
                                </div>
                            </div>


                            <div class="form-group">
                                <div class="col-md-10 col-sm-9 col-md-offset-2 col-sm-offset-3">
                                    <asp:Button CssClass="Button" ID="btnSave" runat="Server" Text="Save" meta:resourcekey="btnSaveResource1"
                                        OnClick="btnSave_Click" />
                                    <asp:Button CssClass="Button" ID="btnupdate" Text="Update" runat="server" CausesValidation="False"
                                        OnClick="btnupdate_Click" />
                                    <asp:Button CssClass="Button" ID="hlkBack" Text="Back" runat="server" PostBackUrl="ListDateforregion.aspx"
                                        CausesValidation="False" meta:resourcekey="hlkBackResource1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>





</asp:Content>

