<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="Pages_MyAccount_MyAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #hiddentext {
            /*position: absolute;*/
            /*width: 1000px;*/
            /*height: 450px;*/
            overflow: inherit;
            color: red;
            z-index: 10000;
            display: none;
            padding: 0px;
            margin: 0px;
        }

        #lbldeliverytime:hover + #hiddentext {
            display: block;
        }
    </style>

    <%--<script lang="javascript" type="text/javascript">
        function ShowPopup() {
            $("#btnShowPopup").click();
        }
    </script>--%>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <br />
    <div class="col-md-12">
        <div class="col-md-3 hidden-sm hidden-xs">
            <div class="wrap-cat-icon wrap-cat-icon1">
                <h2 class="title14 title-cat-icon">My Account</h2>
                <ul class="list-cat-icon">
                    <li class="has-cat-mega">
                      <%--  <a href="#" data-toggle="modal" data-target="#myexistingproduct">
                            <span>View My Existing Order</span></a>--%>
                    </li>
                    <li class="has-cat-mega" data-toggle="modal" data-target="#myrecentinvoice">
                        <a href="#">
                            <span>View Recent Invoices</span></a>

                    </li>
                    <%--<li><a href="#">
                        <span>View My Account Details</span></a></li>--%>
                    <li><a href="MyAccount.aspx" >
                        <span>Place A New Order</span></a></li>
                    <li>
                          <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                                   <span>Track My Order</span></asp:LinkButton>
                    </li>
                    <li><a href="#" data-toggle="modal" data-target="#myhelp">
                        <span>Feedback & Help</span></a></li>                  
                    <li>
                        <%-- <a href="#" data-toggle="modal" data-target="#myprofile"><span>My Profile</span></a>--%>
                        <asp:LinkButton ID="lnkmyprofile" runat="server" data-toggle="modal" data-target="#myprofile">
                                   <span>My Profile</span></asp:LinkButton>
                    </li>
                    <li><a href="#">
                        <span>Logout</span></a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9 col-sm-12 col-xs-12">
            <br />
            <asp:UpdatePanel ID="updatepanel1" runat="server">
                <ContentTemplate>
                       <asp:Panel ID="pnlAll" runat="server" >
                    <div class="row">
                        <%--   <div class="col-md-12">--%>
                        <h2 class="title-shop-page">Order Manager</h2>
                        <div class="my-profile-box register-content-box">
                            <div class="form-my-account">
                                <div class="row">
                                    <%-- <div class="col-md-12 col-sm-12 col-xs-12">--%>


                                    <div class="row form-group">
                                        <div class="col-sm-4 ">
                                            <asp:Label ID="Label15" runat="server" Text="User Details :"></asp:Label>
                                        </div>

                                        <div class="col-sm-8">
                                            <asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>

                                    <%--       <div class="row form-group">
                                                <div class="col-sm-4 ">
                                                    <asp:Label ID="Label2" runat="server" Text="Address :"></asp:Label>
                                                </div>

                                                <div class="col-sm-8">
                                                    <asp:TextBox ID="txtaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                                </div>
                                            </div>--%>

                                    <div class="row form-group">
                                        <div class="col-sm-4 ">
                                            <asp:Label ID="Label1" runat="server" Text="Action :"></asp:Label>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlaction" runat="server" OnSelectedIndexChanged="ddlaction_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Value="0">--Select Action--</asp:ListItem>
                                                <asp:ListItem Value="1">Place order</asp:ListItem>                                             
                                                <asp:ListItem Value="2" data-toggle="modal" data-target="#myrecentinvoice">Check Recent Invoices</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-sm-4 ">
                                            <asp:Label ID="lblshoppingtype" runat="server" Visible="false" Text="Shopping Type :"></asp:Label>
                                        </div>
                                        <div class="col-sm-8">
                                            <asp:DropDownList ID="ddlshoppingtype" Visible="false" OnSelectedIndexChanged="ddlshoppingtype_SelectedIndexChanged" AutoPostBack="true" runat="server">
                                                <asp:ListItem Value="0">--Select Action--</asp:ListItem>
                                                <asp:ListItem Value="1">Delivery</asp:ListItem>
                                                <asp:ListItem Value="2">Collection</asp:ListItem>

                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col-sm-4 ">
                                            <asp:Label ID="lbldate" Visible="false" runat="server" Text="Date :"></asp:Label>
                                        </div>
                                        <div class="col-sm-8">

                                            <asp:Calendar ID="CalendarDel" OnSelectionChanged="CalendarDel_SelectionChanged" Visible="false" AutoPostBack="true"  OnDayRender="CalendarDel_DayRender" Width="100%" runat="server"></asp:Calendar>
                                            <asp:DropDownList ID="ddldatetime" CssClass="form-control" Font-Size="Larger" AutoPostBack="true" OnSelectedIndexChanged="ddldatetime_SelectedIndexChanged" Visible="false" runat="server">
                                                <asp:ListItem Value="0"> --Select--</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <asp:Panel runat="server" ID="pnldelivery" Visible="false">
                                        <asp:UpdatePanel runat="server" ID="up1">
                                            <ContentTemplate>
                                                <div class="row form-group">
                                                    <div class="col-sm-4 ">
                                                        <asp:Label ID="Label2" runat="server" Text="Delivery Time :"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-8">

                                                        <asp:TextBox id="lbldeliverytime" title="We deliver Between 9Am to 5Pm, And we will cofrim the delivery time 2 Hours before the Delivery. If you need any time specification Please contact our customer service*" runat="server"  Text="Between 9 am To 5 pm*" ></asp:TextBox>
                                                    </div>
                                                </div>

                                                <span id="hiddentext">We deliver Between 9Am to 5Pm, And we will cofrim the delivery time 2 Hours before the Delivery. If you need any time specification Please contact our customer service*
                                                </span>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                    </asp:Panel>

                                    <asp:Panel runat="server" ID="pnlcollectiontimeslot" Visible="false">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                                            <ContentTemplate>

                                                <div class="row form-group">
                                                    <div class="col-sm-4 ">
                                                        <asp:Label ID="Label3" runat="server" Text="Time Slot :"></asp:Label>
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <asp:DropDownList ID="ddlcollectiontimeslot" CssClass="form-control" Font-Size="Larger" AutoPostBack="true" runat="server">
                                                        </asp:DropDownList>
                                                    </div>
                                                </div>




                                            </ContentTemplate>
                                        </asp:UpdatePanel>


                                    </asp:Panel>
                                    <%-- </div>--%>
                                </div>

                                <div class="col-md-6">
                                    <p>
                                        <asp:Button runat="server" ID="btnsubmit" Visible="false" type="submit" class="register-button save-change" Text="Save Changes" />
                                    </p>
                                </div>

                                <div class="col-md-6">
                                    <p>
                                        <asp:Button runat="server" ID="btncontichopping" CausesValidation="false" OnClick="btncontichopping_Click" type="submit" class="register-button save-change" Text="Continue Shopping" />
                                    </p>
                                </div>


                            </div>
                        </div>
                        <%--   </div>--%>
                    </div>
                      </asp:Panel>
                         <asp:Panel ID="pnlTracOrder" runat="server" Visible="false">
                         <div class="modal-header">                          
                            <h4 class="modal-title" id="H3">Track my order</h4>
                               <asp:Label ID="lblmess" runat="server" Text="You can find your order status by inserting your invoice number on the avobe box. All your invoices number ia available on My account> View Recent Invoices page."></asp:Label>

                        </div>
                          <div class="tab-content">                                      
                                        <asp:TextBox ID="txtOrderrTrack" CssClass="form-control" Placeholder="Please insert your invoice no..." Width="50%" runat="server"></asp:TextBox>
                              <br />
                                        <asp:Button type="button" runat="server" ID="OrderTrackButton" CausesValidation="false"  OnClick="OrderTrackButton_Click" Text="Track Order" ></asp:Button>
                                                        
                                       <br />  <br />
                              <asp:GridView Visible="false" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                                            SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Invoice No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderid")%>'></asp:Label>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Shopping Type ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("ShoppingType")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                    <asp:TemplateField  HeaderText="Date ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Date","{0:d}")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="Total ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; £<%# Eval("Total")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Status")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField >
                                                    <ItemTemplate>
                                                      <%--<asp:Button ID="btnInvoice" runat="server" Text="View Invoice" PostBackUrl='<%# String.Concat("../Report/OrderDetails.aspx?OrderID=",Eval("orderid").ToString()) %>' CssClass="btn-success" />--%>

                                                        <a href='<%# String.Concat("../Report/OrderDetails.aspx?OrderID=",Eval("orderid").ToString()) %>' target="_blank" Class="btn-success" >View Invoice</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                         </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>




            <%--//////////////////////////////Existing Products/////////////////--%>
            <div class="modal fade" id="myexistingproduct" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="btnX" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                            <h4 class="modal-title text-center" id="myModalLabel">My Existing Product</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <asp:GridView ID="GvExistingOrder" runat="server" AutoGenerateColumns="false" OnPageIndexChanging="GvExistingOrder_PageIndexChanging" CssClass="table table-striped table-bordered table-hover"
                                            SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Order ID">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("orderid")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Product Name ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Pname")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Quantity ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Quantity")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Price ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Price")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Total ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Total")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false" HeaderText="Ordered Date ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Date","{0:d}")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Delivery Date ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("DeliveyDate","{0:d}")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Shopping Type ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("ShoppingType")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField Visible="false" HeaderText="Time Slot ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("TimeSlot")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Status")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <%--   <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit">
                                                    <ItemTemplate>
                                                        <asp:Button CssClass="btn-edit" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("AddSize.aspx?ID=", Eval("ID").ToString()) %>'
                                                            meta:resourcekey="btnEditResource1" />

                                                    </ItemTemplate>
                                                    <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="&nbsp;&nbsp; Delete">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                        <asp:Button CssClass="btn-delete" ID="btnDelete" runat="server" Text="Delete"
                                                            OnClientClick=" return confirm('Clicking ok will delete this record permanently.') "
                                                            OnClick="btnDelete_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                                            </Columns>
                                        </asp:GridView>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <%--/////////////////////////Recent Invoice/////////////////--%>
            <div class="modal fade" id="myrecentinvoice" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="Button1" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                            <h4 class="modal-title" id="H1">My Recent Invoice</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <h1>Recent Invoice</h1>

                                        <asp:GridView ID="gvrRecentInvoice" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                                            SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
                                           <Columns>
                                                <asp:TemplateField HeaderText="Invoice No">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("orderid")%>'></asp:Label>
                                                       
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                 <asp:TemplateField HeaderText="Shopping Type ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("ShoppingType")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                    <asp:TemplateField  HeaderText="Date ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Date","{0:d}")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                                <asp:TemplateField HeaderText="Total ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; £<%#(Convert.ToDecimal(Eval("Total").ToString())+Convert.ToDecimal(Eval("Vat").ToString())) %>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Status ">
                                                    <ItemTemplate>
                                                        &nbsp;&nbsp; <%# Eval("Status")%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField >
                                                    <ItemTemplate>
                                                      <%--<asp:Button ID="btnInvoice" runat="server" Text="View Invoice" PostBackUrl='<%# String.Concat("../Report/OrderDetails.aspx?OrderID=",Eval("orderid").ToString()) %>' CssClass="btn-success" />--%>

                                                        <a href='<%# String.Concat("../Report/OrderDetails.aspx?OrderID=",Eval("orderid").ToString()) %>' target="_blank" Class="btn-success" >View Invoice</a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <%--/////////////////////////Place A New Order/////////////////--%>
            <div class="modal fade" id="myneworder" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="Button2" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                            <h4 class="modal-title" id="H2">My New Order</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <h1>Place A new Order</h1>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
          <%--/////////////////////////Feedback/////////////////--%>
            <div class="modal fade" id="myfeedback" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="Button4" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                            <h4 class="modal-title" id="H4">Feedback</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <h1>Feedback</h1>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <%--/////////////////////////Help/////////////////--%>
            <div class="modal fade" id="myhelp" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="Button5" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                            <h4 class="modal-title" id="H5">Help</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <div id="Div1">
                                            <div class="content-page">
                                                <div class="container">
                                                      <div class="contact-form-page">
                                                          <p class="desc">BRR Wholeasle always welcome the customer's valuable feedback. Please fill up the following form for your feedback or any query. Or you can call us on 01992 252141</p>
                                                          <br />
                                                        <div class="form-contact">
                                                            <div>
                                                                <div class="row">
                                                                    <div class="col-md-3 col-sm-4 col-xs-12">
                                                                        <asp:TextBox ID="txtNameContact" PlaceHolder="Name*" runat="server" CssClass="form-control" ></asp:TextBox>
                                                                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Name is required !" ControlToValidate="txtNameContact"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="col-md-3 col-sm-4 col-xs-12">
                                                                       <asp:TextBox ID="txtEmailContact" PlaceHolder="Email*" runat="server" CssClass="form-control" ></asp:TextBox>
                                                                         <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Email is required !" ControlToValidate="txtEmailContact"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="col-md-6 col-sm-4 col-xs-12">
                                                                       <asp:TextBox ID="txtConatact" runat="server" PlaceHolder="Contact No*" CssClass="form-control" ></asp:TextBox>
                                                                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Conatact No is required !" ControlToValidate="txtConatact"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                     <div class="col-md-12 col-sm-12 col-xs-12">
                                                                       <asp:TextBox ID="txtSubjectContact" runat="server" PlaceHolder="Subject*" CssClass="form-control" ></asp:TextBox>
                                                                          <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator3" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Subject No is required !" ControlToValidate="txtSubjectContact"></asp:RequiredFieldValidator>
                                                                    </div>
                                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                                       <asp:TextBox ID="txtMessageContact" TextMode="MultiLine" PlaceHolder="Message*" Height="150px" runat="server" CssClass="form-control" ></asp:TextBox>
                                                                        <asp:Button ID="btnContact" runat="server" Text="Send" OnClick="btnContact_Click" CssClass="btn-danger" />
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br />
                                                    <div class="contact-map">
                                                       <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9928.098537753069!2d0.003301!3d51.531108!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6fd7aec7e2fb9eb6!2sBRR%20Wholesale%20Ltd!5e0!3m2!1sen!2sbd!4v1582812795595!5m2!1sen!2sbd" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                                                    </div>
                                                    <!-- End Map -->
                                                    <div class="contact-info-page">
                                                        <div class="list-contact-info">
                                                            <div class="row">
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <div class="item-contact-info">
                                                                        <a class="contact-icon icon-address" href="#"><i class="fa fa-address-card"></i></a>
                                                                        <h2>London,E15 3NW, UK. </h2>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <div class="item-contact-info">
                                                                        <a class="contact-icon icon-phone" href="#"><i class="fa fa-phone"></i></a>
                                                                        <h2>Call: <a href="#">01992 252141 </a></h2>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-4 col-sm-4 col-xs-12">
                                                                    <div class="item-contact-info last-item">
                                                                        <a class="contact-icon icon-email" href="#"><i class="fa fa-envelope"></i></a>
                                                                        <h2><a href="#">sales@brrwholesale.com</a></h2>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                      
                                                    </div>
                                                  
                                                </div>
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <%--/////////////////////////My Profile/////////////////--%>
            <div class="modal fade" id="myprofile" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <asp:Button type="button" runat="server" ID="Button6" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>

                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                    <!-- Tab panes -->
                                    <div class="tab-content">

                                        <div id="content">
                                            <div class="content-page woocommerce">
                                                <div class="container">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <h2 class="title-shop-page">My Profile</h2>
                                                            <div class="my-profile-box register-content-box">
                                                                <div class="form-my-account">
                                                                    <div class="row">
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="lblfirstname" Text="First name"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtfirstname"></asp:TextBox>
                                                                                <asp:Label runat="server" ID="lblid" Visible="false"></asp:Label>
                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="lbllastname" Text="Last Name"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtlastname"></asp:TextBox>
                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="lblemail" Text="Email"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtemail"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">                                                                                                                             <p>
                                                                                <asp:Label runat="server" ID="Label4" Text="Mobile"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtContactNo"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="Label5" Text="House No"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtHouseNo"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">                                                                                                                             <p>
                                                                                <asp:Label runat="server" ID="Label6" Text="Address"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtAddress"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="Label7" Text="Landline"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtLandline"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">                                                                                                                             <p>
                                                                                <asp:Label runat="server" ID="Label8" Text="Post Code"></asp:Label>
                                                                                <asp:TextBox runat="server" ID="txtPostCode"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">
                                                                            <p>
                                                                                <asp:Label runat="server" ID="Label9" Text="Country"></asp:Label>
                                                                                <asp:TextBox runat="server" Enabled="false" ID="txtCountry"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-12">                                                                                                                             <p>
                                                                                <asp:Label runat="server" ID="Label10" Text="Distance"></asp:Label>
                                                                                <asp:TextBox runat="server" Enabled="false" ID="txtDistance"></asp:TextBox>

                                                                            </p>
                                                                        </div>
                                                                    </div>

                                                                    <h3 class="title18 title-change-pasword">Password change</h3>
                                                                    <p>
                                                                        <label for="current-password">Current password (leave blank to leave unchanged)</label>

                                                                        <asp:TextBox runat="server" TextMode="Password" ID="txtcurrentPassword"></asp:TextBox>
                                                                    </p>
                                                                    <p>
                                                                        <label for="new-password">New password (leave blank to leave unchanged)</label>
                                                                        <asp:TextBox runat="server" TextMode="Password" ID="txtnewpassword"></asp:TextBox>
                                                                    </p>
                                                                    <p>
                                                                        <label for="confirm-password">Confirm new password</label>
                                                                        <asp:TextBox runat="server" TextMode="Password" ID="txtconfirmpassword"></asp:TextBox>
                                                                     <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="ValidationError" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm Password is Not Matched" ToolTip="Password must be the same" ControlToValidate="txtconfirmpassword" ControlToCompare="txtnewpassword"></asp:CompareValidator>
                                                                    </p>



                                                                    <p>
                                                                        <asp:Button runat="server" class="register-button save-change" Text="Save Changes" ID="btnUpdate" OnClick="btnUpdate_Click" />
                                                                        <%-- <input type="submit" class="register-button save-change" name="register" value="Save Changes">--%>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Content Page -->
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>






        </div>


    </div>

</asp:Content>

