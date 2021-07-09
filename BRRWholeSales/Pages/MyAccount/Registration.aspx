<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Registration.aspx.cs" Inherits="Pages_MyAccount_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="../JQueryFormInlineValidations/css/validationEngine.jquery.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <br />

    <h1 class="text-center">Registration Form</h1>
    <br />
    <div class="container">
        <div class="tab-pane" id="Registration">
            <div class="col-md-6">
                <div class="row form-group">

                    <asp:Label for="email" Text="First Name " runat="server" ID="lblname" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label2" runat="server" Text="*"></asp:Label>
                    </asp:Label>

                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox ID="txtfirstname" runat="server" CssClass="form-control" placeholder="First Name" />
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                        </div>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtfirstname" ID="RegularExpressionValidator3" ValidationExpression="^[a-zA-Z''-'\s]{1,40}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid First Name"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator9" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="First Name is required !" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <asp:Label Text="Last Name" runat="server" ID="Label3" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label11" runat="server" Text="*"></asp:Label>
                    </asp:Label>

                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">

                            <asp:TextBox ID="txtlastname" ValidationGroup="mailVal" runat="server" CssClass="form-control" placeholder="Last Name" />
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                        </div>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtlastname" ID="MyPassordMinLengthValidator" ValidationExpression="^[\s\S]{2,}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid Last Name"></asp:RegularExpressionValidator>

                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator1" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Last Name is required !" ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                    </div>


                </div>

                <div class="row form-group">
                    <asp:Label ID="lblemaul2" runat="server" Text="Country" class="col-sm-3 control-label">
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:DropDownList ID="ddlcountry" class="form-control" runat="server">
                                <asp:ListItem>United Kingdom</asp:ListItem>
                            </asp:DropDownList>
                            <span class="input-group-addon"><i class="fa fa-globe"></i></span>

                        </div>
                    </div>
                </div>
                <div class="row form-group">
                    <asp:Label runat="server" Text="Post Code" ID="Label4" class="col-sm-3 control-label">
                        <asp:Label Style="color: red;" ID="Label18" runat="server" Text="*"></asp:Label>
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">

                            <asp:TextBox ID="txtshowpostcode" ValidationGroup="mailVal" runat="server" CssClass="form-control hidden" placeholder="Post Code" />
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                            <input type="text" id="address" placeholder="Post Code" class="form-control" oninput="GetAddress()" />
                            <span class="input-group-addon"><i class="fa fa-pencil">*</i></span>

                        </div>

                        <asp:RequiredFieldValidator Display="Dynamic" ID="RequiredFieldValidator2" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="Post Code is required !" ControlToValidate="txtshowpostcode"></asp:RequiredFieldValidator>
                        <%--<asp:RegularExpressionValidator ID="remail" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtshowpostcode" ErrorMessage="InValid Post Code" ValidationExpression="^([A-PR-UWYZ0-9][A-HK-Y0-9][AEHMNPRTVXY0-9]?[ABEHMNPRVWXY0-9]? {1,2}[0-9][ABD-HJLN-UW-Z]{2}|GIR 0AA)$">
                        </asp:RegularExpressionValidator>--%>
                    </div>
                </div>

                <div class="row form-group hidden">
                    <asp:Label ID="Label19" runat="server" Text="Distance" class="col-sm-3 control-label">
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox runat="server" ValidationGroup="Postcode" ID="txtDistance" Width="100%" class="form-control"></asp:TextBox>
                            <span class="input-group-addon"><i class="fa fa-pencil">*</i></span>
                        </div>
                    </div>
                </div>


                <%----------------%>

                <div class="row form-group">
                    <asp:Label Text="House No:" runat="server" ID="Label10" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label12" runat="server" Text="*"></asp:Label>
                    </asp:Label>

                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">

                            <asp:TextBox ID="txthouseno" ValidationGroup="mailVal" runat="server" CssClass="form-control" placeholder="House No." />
                            <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                        </div>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txthouseno" ID="MyPassordRequiredCharacterValidator" ValidationExpression="^(?=.*\d).+$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid House No"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txthouseno" ID="RegularExpressionValidator5" ValidationExpression="^[\s\S]{1,}$" runat="server" ForeColor="Red" ErrorMessage="Please Enter a valid House No"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" Visible="true" runat="server" ErrorMessage="House No is Required !" ControlToValidate="txthouseno"></asp:RequiredFieldValidator>
                    </div>
                </div>


                <div class="row form-group">
                    <asp:Label runat="server" Text="Address" ID="Label9" class="col-sm-3  control-label">
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox ID="txtaddress" runat="server" class="form-control" placeholder="House Address" />
                            <span class="input-group-addon"><i class="fa fa-address-card-o"></i></span>
                        </div>
                    </div>
                </div>


            </div>

            <div class="col-md-6">

                <div class="row form-group">
                    <asp:Label runat="server" Text="Mobile" ID="Label8" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label13" runat="server" Text="*"></asp:Label>
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox ID="txtmobile" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Mobile" />
                            <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>

                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Mobile No is Required !" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtmobile" ForeColor="Red" ErrorMessage="Please Enter a valid Mobile Number" ValidationExpression="^(\+44\s?7\d{3}|\(?07\d{3}\)?)\s?\d{3}\s?\d{3}(\s?\#(\d{4}|\d{3}))?$">
                        </asp:RegularExpressionValidator>
                    </div>

                </div>
                <div class="row form-group">
                    <asp:Label runat="server" Text="Landline" ID="Label5" class="col-sm-3  control-label">
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox ID="txtlandline" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Landline" />
                            <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>

                        </div>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" Display="Dynamic" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="txtlandline" ForeColor="Red" ErrorMessage="Please Enter a valid Landline Number" ValidationExpression="^(((\+44\s?\d{4}|\(?0\d{4}\)?)\s?\d{3}\s?\d{3})|((\+44\s?\d{3}|\(?0\d{3}\)?)\s?\d{3}\s?\d{4})|((\+44\s?\d{2}|\(?0\d{2}\)?)\s?\d{4}\s?\d{4}))(\s?\#(\d{4}|\d{3}))?$">
                        </asp:RegularExpressionValidator>
                    </div>

                </div>

                <div class="row form-group">
                    <asp:Label runat="server" Text="Email" ID="Label6" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label14" runat="server" Text="*"></asp:Label>
                    </asp:Label>

                    <asp:UpdatePanel runat="server" ID="up1">
                        <ContentTemplate>
                            <div class="col-sm-8 inputGroupContainer">
                                <div class="input-group">
                                    <asp:TextBox ID="txtemail" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Email" />
                                    <span class="input-group-addon"><i class="fa fa-envelope-square"></i></span>

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
                            </div>

                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
                <div class="row form-group">
                    <asp:Label runat="server" Text="Confirm Email" ID="Label7" class="col-sm-3 control-label">
                        <asp:Label Style="color: red;" ID="Label15" runat="server" Text="*"></asp:Label>
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">

                            <asp:TextBox ID="confemail" ValidationGroup="mailVal" runat="server" class="form-control" placeholder="Confirm Email" />
                            <span class="input-group-addon"><i class="fa fa-envelope-square"></i></span>

                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Confirm Email is Required !" ControlToValidate="confemail"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvEmail" runat="server" ValidationGroup="mailVal"
                            ControlToValidate="confemail" ControlToCompare="txtemail"
                            Operator="Equal" Display="Dynamic" ForeColor="Red" ErrorMessage="Email Is Not Matching">
                        </asp:CompareValidator>
                    </div>

                </div>
                <div class="row form-group">
                    <asp:Label Text="Password" runat="server" ID="lblpass2" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label16" runat="server" Text="*"></asp:Label>
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <asp:TextBox ID="txtpassword" ValidationGroup="mailVal" runat="server" TextMode="Password" class="form-control" placeholder="Password" />
                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Password is Required !" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev1" runat="server"
                            ControlToValidate="txtpassword" ForeColor="Red" ValidationGroup="mailVal" Display="Dynamic"
                            ErrorMessage="Minimum 6 characters atleast 1 UpperCase Alphabet, 1 LowerCase Alphabet, 1 Number and 1 Special Character"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$#!%*?&])[A-Za-z\d$@$#!%*?&]{6,}" />
                    </div>



                </div>
                <div class="row form-group">
                    <asp:Label Text="Confirm Password" runat="server" ID="Label1" class="col-sm-3  control-label">
                        <asp:Label Style="color: red;" ID="Label17" runat="server" Text="*"></asp:Label>
                    </asp:Label>
                    <div class="col-sm-8 inputGroupContainer">
                        <div class="input-group">
                            <%--<input name="emailConfirm" type="password" id="Passconfirm" class="form-control" placeholder="Confirm Password" onblur="confirmPassword()" />--%>
                            <asp:TextBox ID="txtpasswordconfirm" runat="server" TextMode="Password" class="form-control" placeholder="Confirm Password" />
                            <span class="input-group-addon"><i class="fa fa-key"></i></span>

                        </div>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" Display="Dynamic" ValidationGroup="mailVal" CssClass="text-danger" runat="server" ErrorMessage="Confirm Password is Required !" ControlToValidate="txtpasswordconfirm"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="ValidationError" Display="Dynamic" ForeColor="Red" ErrorMessage="Confirm Password is Not Matched" ToolTip="Password must be the same" ControlToValidate="txtpasswordconfirm" ControlToCompare="txtpassword"></asp:CompareValidator>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtpasswordconfirm"></asp:RequiredFieldValidator>--%>
                    </div>

                </div>
            </div>

            <div class="row"></div>
            <hr />
            <div class="row">
                <div class="col-sm-7 col-sm-offset-3">
                    <span>
                        <asp:CheckBox ID="chkagree" runat="server" />
                        I agree that I am 18 years or over and I also agreed with the BRR Whole Sale terms & conditions.

                    </span>

                    <hr />
                </div>
            </div>
            <div class="row">
                <div class="col-sm-7 col-sm-offset-5">
                    <asp:Button type="button" ID="btnsaveconti" CausesValidation="false" runat="server" ValidationGroup="mailVal" OnClick="btnsaveconti_Click" Text="Register " class="buttonstyle"></asp:Button>
                    <asp:Button runat="server" ID="btncancel" Text="Cancel" CausesValidation="false" OnClick="btncancel_Click" class="buttonstyle"></asp:Button>
                    <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
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

            //function confirmEmail() {
            //    var email = document.getElementById("ContentPlaceHolder1_txtemail").value
            //    var confemail = document.getElementById("confemail").value
            //    if (email != confemail) {
            //        alert('Email Not Matching!');
            //    }
            //}

            //function confirmPassword() {
            //    var Password = document.getElementById("ContentPlaceHolder1_txtpassword").value
            //    var ConfirmPass = document.getElementById("Passconfirm").value
            //    if (Password != ConfirmPass) {
            //        alert('Password Not Matching!');
            //    }

            //}

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

