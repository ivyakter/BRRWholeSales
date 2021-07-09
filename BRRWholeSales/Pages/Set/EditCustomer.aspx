<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="EditCustomer.aspx.cs" Inherits="Pages_Set_EditCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <link href="../JQueryFormInlineValidations/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <br />
    <h4 class="text-center">Edit Customer Information Form</h4>
    <br />
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-6">
                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label18" runat="server" Text="First Name"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtfirstname" placeholder="First Name" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtfirstname" ID="RegularExpressionValidator6" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid First Name"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="First Name is required !" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label2" runat="server" Text="Last Name"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtlastname" placeholder="Last Name" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtlastname" ID="MyPassordMinLengthValidator" ValidationExpression="^[\s\S]{2,}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid Last Name"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Last Name is required !" ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label3" runat="server" Text="Country"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:DropDownList ID="ddlcountry" class="form-control" runat="server">
                            <asp:ListItem>United Kingdom</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label11" runat="server" Text="Post Code"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox runat="server" placeholder="Post Code" ValidationGroup="mailVal" ID="txtshowpostcode" class="form-control"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="remail" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtshowpostcode" ErrorMessage="InValid Post Code" ValidationExpression="^(([A-Z]{1,2}\d[A-Z\d]?|ASCN|STHL|TDCU|BBND|[BFS]IQQ|PCRN|TKCA) ?\d[A-Z]{2}|BFPO ?\d{1,4}|(KY\d|MSR|VG|AI)[ -]?\d{4}|[A-Z]{2} ?\d{2}|GE ?CX|GIR ?0A{2}|SAN ?TA1)$">
                        </asp:RegularExpressionValidator>

                        <asp:TextBox runat="server" Visible="false" CssClass="hidden" ValidationGroup="Postcode" ID="txtDistance" class="form-control"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label4" runat="server" Text="House No:"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txthouseno" ValidationGroup="mailVal" runat="server" CssClass="form-control" placeholder="House No." />
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txthouseno" ID="MyPassordRequiredCharacterValidator" ValidationExpression="^(?=.*\d).+$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid House No"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txthouseno" ID="RegularExpressionValidator5" ValidationExpression="^[\s\S]{1,}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid House No"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="House No is Required !" ControlToValidate="txthouseno"></asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>

            <div class="col-md-6">

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label10" runat="server" Text="Address"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtaddress" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label9" runat="server" Text="Mobile"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtmobile" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Mobile" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Mobile No is Required !" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtmobile" ForeColor="Red" ErrorMessage="Please Enter a valid Mobile Number" ValidationExpression="^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}(\s?\#(\d{4}|\d{3}))?$">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label22" runat="server" Text="Landline"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtlandline" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Landline" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtlandline" ForeColor="Red" ErrorMessage="Please Enter a valid Landline Number" ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$">
                        </asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:UpdatePanel runat="server" ID="up1">
                            <ContentTemplate>
                                <div class="input-group">
                                    <asp:TextBox ID="txtemail" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Email" />

                                </div>
                                <asp:Label ID="lblemail" Font-Bold="true" ForeColor="#ff0000" runat="server" Text="Email Is Not Valid" Visible="false"></asp:Label>

                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Email is Required !" ControlToValidate="txtemail"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                    runat="server" Display="Dynamic" ErrorMessage="Please Enter Valid Email ID"
                                    ValidationGroup="mailVal" ControlToValidate="txtemail"
                                    CssClass="requiredFieldValidateStyle"
                                    ForeColor="Red"
                                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                </asp:RegularExpressionValidator>

                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label6" runat="server" Text="Note" ></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <textarea name="txtNote" id="txtNote" placeholder="Write a Note.." style="width:100%;" runat="server" ></textarea>
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label1" Visible="false" runat="server" Text="Password"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtpassword"  Visible="false" ValidationGroup="mailVal" runat="server" TextMode="Password" class="form-control" placeholder="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Password is Required !" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server"
                            ControlToValidate="txtpassword" ForeColor="Red" ValidationGroup="mailVal" Display="Dynamic"
                            ErrorMessage="Minimum 6 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*?&])[A-Za-z\d$@$!%*?&]{6,}" />
                    </div>
                </div>
            </div>

        </div>
    </div>

    <hr />
    <div class="row">
        <div class="col-md-3"></div>
        <div class="row form-group">

            <div class="col-md-4">
                <asp:Button ID="btnAdd" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnsaveconti_Click" />
            </div>

            <div class="col-md-4">
                <asp:Button ID="btnupdate" runat="server" OnClick="btncancel_Click" Text="Cancel" CausesValidation="false" CssClass="btn btn-primary" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="Button1" runat="server" PostBackUrl="ListCustomerForAdmin.aspx" Text="Back to list" CausesValidation="false" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>

    <asp:Label runat="server" ID="distan"></asp:Label>

    <script src="../../JQueryFormInlineValidations/js/jquery-1.6.min.js" type="text/javascript"></script>
    <script src="../JQueryFormInlineValidations/js/jquery.validationEngine-en.js" type="text/javascript"></script>
    <script src="../JQueryFormInlineValidations/js/jquery.validationEngine.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDjR14OREWodXlFSAi-S78TwQG5XhGILdg"></script>
    <script type="text/javascript">


        function CheckHouseNo() {
            var houseNo = document.getElementById('houseNo').value

            if (isNaN(houseNo)) {

            }
        }
        function GetAddress() {
            var address = document.getElementById('address').value;
            var geocoder = geocoder = new google.maps.Geocoder();
            geocoder.geocode({ 'address': address }, function (results, status) {
                if (status == google.maps.GeocoderStatus.OK) {
                    if (results[0]) {
                        var latitude = results[0].geometry.location.lat();
                        var longitude = results[0].geometry.location.lng();

                        var rs = calcCrow(51.531228, 0.003344, latitude, longitude);

                        //alert(51.531228, 0.003344, latitude, longitude);

                        document.getElementById('ContentPlaceHolder1_txtDistance').value = rs.toFixed(2);

                        document.getElementById('ContentPlaceHolder1_txtshowpostcode').value = document.getElementById('address').value;


                        //document.getElementById('ContentPlaceHolder1_txtpostcode').value = document.getElementById('address').value;
                    }
                }
            });
        }

        //This function takes in latitude and longitude of two location and returns the distance between them as the crow flies (in km)
        function calcCrow(lat1, lon1, lat2, lon2) {
            var R = 6371; // km
            var dLat = toRad(lat2 - lat1);
            var dLon = toRad(lon2 - lon1);
            var lat1 = toRad(lat1);
            var lat2 = toRad(lat2);

            var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                Math.sin(dLon / 2) * Math.sin(dLon / 2) * Math.cos(lat1) * Math.cos(lat2);
            var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
            var d = R * c;
            var e = d / 1.60; // For Mile
            return e;
        }

        // Converts numeric degrees to radians
        function toRad(Value) {
            return Value * Math.PI / 180;
        }

        //});

        //$('#submit').click(function () {

        //    //alert("Hello");

        //    //Get Postcode
        //    var number = $('#number').val();
        //    var postcode = $('#address').val().toUpperCase();;

        //    //Get latitude & longitude
        //    $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?address=' + postcode + '&key=[AIzaSyDjR14OREWodXlFSAi-S78TwQG5XhGILdg]', function (data) {

        //        var lat = data.results[0].geometry.location.lat;
        //        var lng = data.results[0].geometry.location.lng;

        //        //Get address    
        //        $.getJSON('https://maps.googleapis.com/maps/api/geocode/json?latlng=' + lat + ',' + lng + '&key=[AIzaSyDjR14OREWodXlFSAi-S78TwQG5XhGILdg]', function (data) {
        //            var address = data.results[0].address_components;
        //            var street = address[1].long_name;
        //            var town = address[2].long_name;
        //            var county = address[3].long_name;

        //            //Insert
        //            $('#text').text(number + ', ' + street + ', ' + town + ', ' + county + ', ' + postcode)

        //            alert(number + ', ' + street + ', ' + town + ', ' + county + ', ' + postcode)
        //        });
        //    });
        //});





        function confirmEmail() {
            var email = document.getElementById("ContentPlaceHolder1_txtemail").value
            var confemail = document.getElementById("confemail").value
            if (email != confemail) {
                alert('Email Not Matching!');
            }


        }

        function confirmPassword() {
            var Password = document.getElementById("ContentPlaceHolder1_txtpassword").value
            var ConfirmPass = document.getElementById("Passconfirm").value
            if (Password != ConfirmPass) {
                alert('Password Not Matching!');
            }

        }

        <%--    function checkEmail(event) {

            var msg = document.getElementById("<%=lblemail.ClientID%>");
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            if (!re.test(event.value)) {
                msg.style.visibility = "visible";
                return false;
            }
            return true;
        }--%>


        <%--        function ValidateFirstName(txt) {

            var msg = document.getElementById("<%=lblFirstNAmeError.ClientID%>");
            if (txt.value.length < 1) {

                msg.style.visibility = "visible";
            }

            else {

                msg.style.visibility = "hidden";
            }

        }--%>

        <%--        function ValidateSecondName(txt) {

            var msg = document.getElementById("<%=lblminimum2cherecter.ClientID%>");
            if (txt.value.length < 2) {

                msg.style.visibility = "visible";
            }

            else {

                msg.style.visibility = "hidden";
            }

        }--%>

        <%-- function ValidatePostCode(txt) {

            var msg = document.getElementById("<%=lblminimumfivecharacter.ClientID%>");
            if (txt.value.length < 5) {

                msg.style.visibility = "visible";
            }

            else {

                msg.style.visibility = "hidden";
            }

        }--%>


        //popup validation
        jQuery(document).ready(function () {
            jQuery("#form1").validationEngine();
        });





    </script>
</asp:Content>

