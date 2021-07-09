<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="CustomerRequest.aspx.cs" Inherits="Pages_Set_CustomerRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
     <div class="row">
        <div class="col-md-12" style="overflow: scroll">
            <asp:GridView ID="addGrid" runat="server" AllowPaging="true" CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="addGrid_PageIndexChanging" PageSize="10" OnRowCancelingEdit="addGrid_RowCancelingEdit" OnRowEditing="addGrid_RowEditing" OnRowUpdating="addGrid_RowUpdating" Width="100%"
                AutoGenerateColumns="False" EmptyDataText="No Data Record">
                <RowStyle HorizontalAlign="Center" />
                <Columns>

                    <asp:TemplateField HeaderText="Delete" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("CustomerId") %>'></asp:Label>
                            <asp:Button CssClass="btn btn-danger  btn-sm" ID="Button1" runat="server" Text="Delete" OnClientClick=" return confirm('Clicking ok to delete this And Sent Message to Customer.') "
                                    OnClick="btndelete_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Update" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" CausesValidation="false" CssClass="btn btn-success btn-sm" Font-Size="Small" Text="Approve" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:CommandField HeaderText="Update" CausesValidation="false" ControlStyle-CssClass="btn btn-warning btn-xs" HeaderStyle-ForeColor="Black" ShowEditButton="true">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:CommandField>--%>

                        <%--<asp:TemplateField HeaderText="ID." HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblid" runat="server" Visible="true" Text='<%# Eval("ID") %>'></asp:Label>
                        </ItemTemplate>
                    
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>--%>

                    <asp:TemplateField HeaderText=" FirstName" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Visible="true" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="SurName" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblSurName" runat="server" Visible="true" Text='<%# Eval("SurName") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Post Code" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblpostcode" runat="server" Visible="true" Text='<%# Eval("PostCode") %>'></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Address" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblDistance" runat="server" Visible="true" Text='<%# Eval("Address") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtpostcode" runat="server" Text='<%#Eval("Address")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%-- <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                       <asp:TemplateField HeaderText="House No" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblHouseNo" runat="server" Visible="true" Text='<%# Eval("HouseNo") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtHouseNo" runat="server" Text='<%#Eval("HouseNo")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%-- <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Email" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblemail" runat="server" Visible="true" Text='<%# Eval("Email") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtemail" runat="server" Text='<%#Eval("Email")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--  <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="New Password" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblPassword" runat="server" Visible="true" Text='<%# Eval("Password") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPassword" runat="server" Text='<%#Eval("Password")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--  <ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Phone" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Visible="true" Text='<%# Eval("Phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPhone" runat="server" Text='<%#Eval("Phone")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--<ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Landline" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblLandline" runat="server" Visible="true" Text='<%# Eval("Landline") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLandline" runat="server" Text='<%#Eval("Landline")%>'></asp:TextBox>
                        </EditItemTemplate>
                        <%--<ControlStyle Height="20px" Width="100px" />--%>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                </Columns>
                <HeaderStyle Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </div>

</asp:Content>

