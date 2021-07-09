<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" EnableEventValidation="false" Inherits="Pages_Report_OrderDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Report</title>
    <style>
        * {
            border: 0;
            box-sizing: content-box;
            color: inherit;
            font-family: inherit;
            font-size: inherit;
            font-style: inherit;
            font-weight: inherit;
            line-height: inherit;
            list-style: none;
            margin: 0;
            padding: 0;
            text-decoration: none;
            vertical-align: top;
        }

            /* content editable */

            *[contenteditable] {
                border-radius: 0.25em;
                min-width: 1em;
                outline: 0;
            }

            *[contenteditable] {
                cursor: pointer;
            }

                *[contenteditable]:hover, *[contenteditable]:focus, td:hover *[contenteditable], td:focus *[contenteditable], img.hover {
                    background: #DEF;
                    box-shadow: 0 0 1em 0.5em #DEF;
                }

        span[contenteditable] {
            display: inline-block;
        }

        /* heading */

        h1 {
            font: bold 100% sans-serif;
            letter-spacing: 0.5em;
            text-align: center;
            text-transform: uppercase;
        }

        /* table */

        table {
            font-size: 75%;
            table-layout: fixed;
            width: 100%;
        }

        table {
            border-collapse: separate;
            border-spacing: 2px;
        }

        th, td {
            border-width: 1px;
            padding: 0.5em;
            position: relative;
            text-align: left;
        }

        th, td {
            border-radius: 0.25em;
            border-style: solid;
        }

        th {
            background: #EEE;
            border-color: #BBB;
        }

        td {
            border-color: #DDD;
        }

        /* page */

        html {
            font: 16px/1 'Open Sans', sans-serif;
            overflow: auto;
            padding: 0.5in;
        }

        html {
            background: #999;
            cursor: default;
        }

        body {
            box-sizing: border-box;
            height: 11in;
            margin: 0 auto;
            overflow: hidden;
            padding: 0.5in;
            width: 8.5in;
        }

        body {
            background: #FFF;
            border-radius: 1px;
            box-shadow: 0 0 1in -0.25in rgba(0, 0, 0, 0.5);
        }

        /* header */

        header {
            margin: 0 0 2em;
        }

            header:after {
                clear: both;
                content: "";
                display: table;
            }

            header h1 {
                background: #000;
                border-radius: 0.25em;
                color: #FFF;
                margin: 0 0 1em;
                padding: 0.5em 0;
            }

            header address {
                float: left;
                font-size: 75%;
                font-style: normal;
                line-height: 1.25;
                margin: 0 1em 1em 0;
            }

                header address p {
                    margin: 0 0 0.25em;
                }

            header span, header img {
                display: block;
                float: right;
            }

            header span {
                margin: 0 0 1em 1em;
                max-height: 25%;
                max-width: 60%;
                position: relative;
            }

            header img {
                max-height: 100%;
                max-width: 100%;
            }

            header input {
                cursor: pointer;
                -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
                height: 100%;
                left: 0;
                opacity: 0;
                position: absolute;
                top: 0;
                width: 100%;
            }

        /* article */

        article, article address, table.meta, table.inventory {
            margin: 0 0 1em;
        }

            article:after {
                clear: both;
                content: "";
                display: table;
            }

            article h1 {
                clip: rect(0 0 0 0);
                position: absolute;
            }

            article address {
                float: left;
                font-size: 125%;
                font-weight: bold;
            }

        /* table meta & balance */

        table.meta, table.balance {
            float: right;
            width: 45%;
        }

            table.meta:after, table.balance:after {
                clear: both;
                content: "";
                display: table;
            }

            /* table meta */

            table.meta th {
                width: 40%;
            }

            table.meta td {
                width: 60%;
            }

        /* table items */

        table.inventory {
            clear: both;
            width: 100%;
        }

            table.inventory th {
                font-weight: bold;
                text-align: center;
            }

            table.inventory td:nth-child(1) {
                width: 26%;
            }

            table.inventory td:nth-child(2) {
                width: 38%;
            }

            table.inventory td:nth-child(3) {
                text-align: right;
                width: 12%;
            }

            table.inventory td:nth-child(4) {
                text-align: right;
                width: 12%;
            }

            table.inventory td:nth-child(5) {
                text-align: right;
                width: 12%;
            }

        /* table balance */

        table.balance th, table.balance td {
            width: 50%;
        }

        table.balance td {
            text-align: right;
        }
        /* aside */
        aside h1 {
            border: none;
            border-width: 0 0 1px;
            margin: 0 0 1em;
        }

        aside h1 {
            border-color: #999;
            border-bottom-style: solid;
        }

        @media print {
            * {
                -webkit-print-color-adjust: exact;
            }

            html {
                background: none;
                padding: 0;
            }

            body {
                box-shadow: none;
                margin: 0;
            }

            span:empty {
                display: none;
            }
        }

        @page {
            margin: 0;
        }

        .btn {
            padding: 10px 40px;
            border: 2px solid #000;
            border-radius: 10px;
            background-color: red;
            color: #fff;
            margin-bottom: 20px;
            float: right;
            height: 13px;
            width: 100px;
            position: relative;
            opacity: 1;
        }

        .add {
            line-height: 26px;
            font-size: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel runat="server" ID="Panel_Name">
        <div>
            <header>

                <!--<h1>Invoice</h1>-->
                <address contenteditable>
                    
                    <p>BRR Wholesale Ltd</p>
                    <p>Unit-15</p>
                    <p>Canning Road, Abbey Trading Point</p>
                    <p>London</p>
                    <p>E15 3NW</p>                    
                    <br />
                    <p>Website: www.brrwholesale.com</p>
                    <p>Telephone: 01992252141</p>
                    <p>Email: <a href="mailto:info@brrwholesale.com">info@brrwholesale.com</a></p>
                </address>
                <span>
                   
                  <img alt="" style="width: 200px;" src="<%= Page.ResolveUrl("~")%>images/home12/logo2.png" /><input type="file" accept="image/*" /></span>

            </header>
            <article>
                <h1>Recipient</h1>
                <address contenteditable>
                    <asp:Repeater ID="rptCustomer" runat="server">
                        <ItemTemplate>
                            <div class="add">
                                <p>
                                    <%#Eval("FirstName") %>&nbsp;<%#Eval("SurName") %><br />
                                    <%#Eval("HouseNo") %>, <%#Eval("Address") %> -<%#Eval("PostCode") %><br />
                                    <%#Eval("country") %>.<br />
                                    Email: <%#Eval("Email") %>
                                </p>
                                <p>
                                    Phone: <%#Eval("Phone") %><br />
                                    <%--Order Date: <%#Eval("Date") %>--%>
                                </p>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </address>
                <table class="meta">
                    <tr>
                        <th><span contenteditable>Invoice No:</span></th>
                        <td><span contenteditable>
                            <asp:TextBox ID="txtInvoice" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Invoice date:</span></th>
                        <td><span contenteditable>
                            <asp:TextBox ID="txtDate" Width="150%" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Shopping Type:</span></th>
                        <td><span contenteditable>
                            <asp:TextBox ID="txtShoppingType" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Due Date:</span></th>
                        <td style="text-align:left;><span id="prefix" contenteditable></span><span>
                            <asp:TextBox ID="txtDueDate" Width="150%" runat="server"></asp:TextBox></span></td>
                    </tr>
                </table>
                <table class="inventory">
                    <thead>
                        <tr>
                            <th><span contenteditable>Code</span></th>
                            <th><span contenteditable>Product Name</span></th>
                            <th><span contenteditable>Quantity</span></th>
                            <th><span contenteditable>Price</span></th>
                            <th><span contenteditable>Vat</span></th>
                            <th><span contenteditable>Net Amount</span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Repeater ID="rptSale" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="text-align:center;"><span contenteditable><%#Eval("Barcode") %></span></td>
                                    <td style="text-align:center;"><span contenteditable><%#Eval("Pname") %></span></td>
                                    <td style="text-align:center;"><span data-prefix></span><span contenteditable><%#Eval("Quantity") %></span></td>
                                    <td style="text-align:center;"><span contenteditable>£<%#Eval("Price") %></span></td>
                                    <td style="text-align:center;"><span data-prefix></span><span>£<%#Eval("vat") %></span></td>
                                    <td style="text-align:center;"><span data-prefix></span><span>£<%#Eval("Total") %></span></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>

                <table class="balance">
                    <tr>
                        <th><span contenteditable>Net Amount</span></th>
                        <td><span data-prefix></span><span>
                            <asp:TextBox ID="txtNetAmount" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Vat Amount</span></th>
                        <td><span data-prefix></span><span contenteditable>
                            <asp:TextBox ID="txtVatAmount" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Total</span></th>
                        <td><span data-prefix></span><span>
                            <asp:TextBox ID="txtTotal" runat="server"></asp:TextBox></span></td>
                    </tr>
                    <%--<tr>
                        <th><span contenteditable>Previous Balance</span></th>
                        <td><span data-prefix>$</span><span>600.00</span></td>
                    </tr>
                    <tr>
                        <th><span contenteditable>Total Due</span></th>
                        <td><span data-prefix>$</span><span>600.00</span></td>
                    </tr>--%>
                </table>
            </article>
            
            <br />
            <%--<aside>
                <h1><span contenteditable>Terms and conditions can be found on: brrwholesale.com</span></h1>
                <div contenteditable>
                    <p>Registered in England and Wales No. 08366495, VAT Registration Number GB 168 2010 28</p>
                    <p>Registered Address Unit 15, Canning Road, Abbey Trading Point, London, E15 3NW, United Kingdom</p>
                </div>
            </aside>--%>
           
        </div>
            </asp:Panel>
         <center>
             <asp:Button CssClass="btn" ID="btn_Download" OnClick="btn_Download_Click" runat="server" Text="Download" />
            <asp:Button CssClass="btn" ID="btn_Print"  OnClientClick="myFunction();" runat="server" Text="Print" />
                </center>
    </form>

    <script>
        function myFunction() {
            document.getElementById("btn_Print").style.display = "none";
            document.getElementById("btn_Download").style.display = "none";
            window.print();

        }
    </script>
</body>
</html>
