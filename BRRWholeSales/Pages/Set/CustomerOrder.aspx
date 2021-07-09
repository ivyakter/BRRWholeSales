<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="CustomerOrder.aspx.cs" Inherits="Pages_Set_CustomerOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         *{
    font-size:15px !important;
}
        .Grid {
            table-layout: fixed;
            width: 100%;
        }

            .Grid .Shorter {
                overflow: hidden;
                text-overflow: ellipsis;
                white-space: nowrap;
            }
       .pager span { color:red;font-weight:bold; font-size:16pt; }
    </style> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <div class="col-md-12">
        <div class="row">
            <div class="col-md-2">
                <asp:Label runat="server" ID="lblproductname" Text=" Search by Order Id :"></asp:Label>
            </div>

            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtOrderId" CssClass="form-control" OnTextChanged="txtproductname_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Label runat="server" ID="Label1" Text=" Search by Email :"></asp:Label>
            </div>

            <div class="col-md-4">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" OnTextChanged="txtproductname_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>
    <br />
     <div class="row">
        <div class="col-md-12" style="overflow: scroll">
            <asp:GridView ID="addGrid" runat="server" AllowPaging="true" CssClass="table-striped table-bordered table-hover table table-nowrap Grid" OnPageIndexChanging="addGrid_PageIndexChanging" OnRowCommand="addGrid_RowCommand" PageSize="10" Width="100%" AutoGenerateColumns="False" EmptyDataText="No Data Record">
                <RowStyle HorizontalAlign="Center" />
                <PagerStyle CssClass="pager" />
                <Columns>
                   
                    <asp:TemplateField HeaderText=" OrderId" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName" runat="server" Visible="true" Text='<%# Eval("orderid") %>'></asp:Label>
                        </ItemTemplate>                        
                        <ItemStyle HorizontalAlign="Center" Width="50"></ItemStyle>
                    </asp:TemplateField>

                   <asp:TemplateField HeaderText=" Order Type" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lbldelivery" runat="server" Visible="true" Text='<%# Eval("ShoppingType") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Name" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                           <asp:Label ID="lblpostcode" runat="server" Visible="true" Text='<%# Eval("FirstName") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"  Width="250"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Email" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                           <span contenteditable><%#Eval("CustomerId") %></span>  
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone" runat="server" Visible="true" Text='<%# Eval("Date","{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblStatus" runat="server" Visible="true" Text='<%# Eval("Status") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            £<asp:Label ID="lblTotal" runat="server" Visible="true" Text='<%#(Convert.ToDecimal(Eval("Total").ToString())+Convert.ToDecimal(Eval("Vat").ToString())) %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>
                                  
                    <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button CssClass="btn-edit btn btn-warning btn-xs" style="padding:5px 9px" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("EditOrder.aspx?ID=",Eval("CustomerId").ToString()+"&OrderId="+Eval("orderid").ToString()) %>'
                                    meta:resourcekey="btnEditResource1" />
                            </ItemTemplate>                           
                        </asp:TemplateField>      

                </Columns>
                <HeaderStyle Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </div>

</asp:Content>

