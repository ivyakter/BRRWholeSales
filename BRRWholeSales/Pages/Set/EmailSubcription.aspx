<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="EmailSubcription.aspx.cs" Inherits="Pages_Set_EmailSubcription" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
  


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">





    <h1>Subcription Emails</h1>
    <hr />
   <%-- <div class="row">
        <div class="col-md-12">
            <div class="col-md-6" style="height: 25px;">
                <div class="row form-group">
                    <div class="col-md-4">
                        <asp:Label ID="label5" runat="server" Text="Date"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" ></asp:TextBox>
                        <cc1:CalendarExtender ID="DateClanaderExtender" runat="server" TargetControlID="txtDate" Format="yyyy-MM-dd">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate"
                            CssClass="failureNotification" ErrorMessage="Date required." ToolTip="Date required."
                            ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                    </div>
                    <asp:Label ID="lbldiscode" runat="server"></asp:Label>
                </div>
            </div>
        </div>
    </div>--%>


    <asp:GridView ID="GvEmail" runat="server" OnPageIndexChanging="GvEmail_PageIndexChanging" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
        SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
        <Columns>
            <asp:TemplateField HeaderText=" ID">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblid" Text='<%# Eval("ID")%>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblEmail" Text='<%# Eval("Email")%>'></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Submission Date">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lblSubmissionDate" Text='<%# Eval("SubmissionDate", "{0:dd/MM/yyyy}")%>'></asp:Label>

                </ItemTemplate>
            </asp:TemplateField>


        </Columns>
    </asp:GridView>

</asp:Content>

