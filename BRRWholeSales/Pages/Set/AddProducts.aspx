<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="Pages_Set_AddProducts" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" language="javascript">



        function ShowImagePreviewedit(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=Image1.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                }

            }

        <%--          function ShowImagePreviewedit2(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=Image2.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                }

            }


            function ShowImagePreviewedit3(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#<%=Image3.ClientID%>').prop('src', e.target.result)
                };
                reader.readAsDataURL(input.files[0]);
                }

            }--%>


    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <center>                
             <asp:Label ID="lblstuinfo" ForeColor="#86AFD2" Font-Bold="true" Font-Italic="true" Font-Size="XX-Large" runat="server" Text="Add Product"></asp:Label><br />
            <%--  Your Name : <asp:Label ID="lblusername" ForeColor="#86AFD2" Font-Bold="true" Font-Italic="true" Font-Size="Medium" runat="server"></asp:Label>--%>
            </center>
    <hr />

    <div class="col-md-12">

        <div class="row">

            <div class="col-md-6">

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label15" runat="server" Text="Product No."></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtVoucherNo" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPName"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label12" runat="server" Text="Product Code"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtproductcode" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtproductcode_TextChanged" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtproductcode"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtPName" CssClass="form-control" Enabled="true" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtPName" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPName"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>
                    </div>
                    <div class="col-sm-6">

                        <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control category" runat="server"></asp:DropDownList>

                        <%--  <asp:ListBox ID="ddlCategory" runat="server" SelectionMode="Multiple">
                             </asp:ListBox>--%>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlCategory" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlCategory" InitialValue="0"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label6" runat="server" Text="Sub Category"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <%-- <asp:DropDownList ID="ddlSubCategory" OnSelectedIndexChanged="ddlSubCategory_SelectedIndexChanged" required AutoPostBack="true" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                        <asp:ListBox ID="ddlSubCategory" runat="server" SelectionMode="Multiple"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlSubCategory"></asp:RequiredFieldValidator>
                        <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlSubCategory" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlSubCategory" InitialValue="0"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <%--  <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label21" runat="server" Text="Product ID"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtproductid" CssClass="form-control" Enabled="false" placeholder="Remember Product Id" runat="server"></asp:TextBox>
                      
                    </div>
                </div>--%>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label9" runat="server" Text="Quantity"></asp:Label>

                    </div>

                    <div class="col-sm-6">
                        <asp:TextBox ID="txtQuantity" Text="1" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtq2" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator15" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtSelPrice"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label2" runat="server" Text="Del Old Price "></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server"></asp:TextBox>
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatortxtPrice" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtPrice"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label3" runat="server" Text="Del Price"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtSelPrice" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtSelPrice" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtSelPrice"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label23" runat="server" Text="Col Old Price"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtcololdprice" CssClass="form-control" runat="server"></asp:TextBox>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtcololdprice"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label7" runat="server" Text="col Price"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtcollprice" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtcollprice"></asp:RequiredFieldValidator>
                    </div>
                </div>



                <asp:Label runat="server" ID="lblPID" Visible="false"></asp:Label>
                <asp:Label runat="server" ID="lblimagename" Visible="false"></asp:Label>

            </div>





            <div class="col-md-6">

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label22" runat="server" Text="Unit"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtunit" CssClass="form-control" runat="server"></asp:TextBox>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtunit" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtunit"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label17" runat="server" Text="Discount"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtdiscount" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label18" runat="server" Text="Vat"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtvat" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                </div>


                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label4" runat="server" Text="Brand"></asp:Label>
                    </div>
                    <div class="col-sm-6">
                        <asp:ListBox ID="ddlBrands" runat="server" SelectionMode="Multiple"></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlBrands"></asp:RequiredFieldValidator>
                        <%-- <asp:DropDownList ID="ddlBrands" CssClass="form-control" runat="server"></asp:DropDownList>--%>
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorddlBrands" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlBrands" InitialValue="0"></asp:RequiredFieldValidator>ddlsection--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label8" runat="server" Text="Size"></asp:Label>
                    </div>

                    <div class="col-sm-6">

                        <%--<asp:DropDownList runat="server" ID="cblSize2" CssClass="form-control">
                        </asp:DropDownList>--%>
                        <asp:ListBox ID="cblSize2" runat="server" SelectionMode="Multiple" ></asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="cblSize2"></asp:RequiredFieldValidator>
                        &nbsp;&nbsp;
                    </div>
                </div>



                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label13" runat="server" Text="Image 1"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:FileUpload ID="fuImg01" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorfuImg01" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg01"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label14" runat="server" Text="Image 2"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:FileUpload ID="fuImg02" CssClass="form-control" runat="server" />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidatorfuImg02" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg02"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-3 col-sm-offset-1">
                        <asp:Label ID="Label16" runat="server" Text="Image 3"></asp:Label>
                    </div>

                    <div class="col-sm-6">
                        <asp:FileUpload ID="fuImg03" CssClass="form-control" runat="server" />
                        <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidatorfuImg03" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="fuImg03"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-12">
                        <asp:Repeater runat="server" ID="rptredit" Visible="false">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" Text='<%#Eval("PIMGID") %>' ID="imgcheck" />
                                <asp:Label runat="server" Visible="false" ID="lblimagename" Text='<%#Eval("Name") %>'></asp:Label>
                                <img width="100" height="100" src="../../ProductImage/<%#Eval("PID") %>/<%#Eval("Name") %><%#Eval("Extention") %>" alt="<%#Eval("Name") %>" onerror="this.src='images/noimage.jpg'">
                                <%-- <ItemStyle-Width="160px" ItemStyle-HorizontalAlign="Center">--%>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-12">
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px" Visible="false" ImageAlign="Middle" />
                        <%-- <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" Visible="false" ImageAlign="Middle" />
                         <asp:Image ID="Image3" runat="server" Height="100px" Width="100px" Visible="false" ImageAlign="Middle" />--%>
                        <asp:Button ID="btnDelete" style="padding:5px 9px" runat="server" Text="Delete Image" Visible="false"  CssClass="btn btn-primary btn-lg" OnClick="btnDelete_Click" />
                        <asp:FileUpload ID="FileUploadedit" Visible="false"  Width="50%" CssClass="form-control" runat="server" onchange="ShowImagePreviewedit(this);" />
                    </div>
                </div>
                <%--       <div class="row form-group">
                    <div class="col-sm-12">
                       
                    </div>
                </div>
                <div class="row form-group">
                    <div class="col-sm-12">
                       
                    </div>
                </div>--%>

                <div class="row form-group">
                    <div class="col-md-6">
                        <asp:Label ID="Label27" Visible="false" runat="server" Text="Edit Image"></asp:Label>
                    </div>
                    <div class="col-md-4">

                        
                    </div>
                </div>

                <%--  <div class="row form-group">
                    <div class="col-md-6">
                        <asp:Label ID="Label10" Visible="false" runat="server" Text="Edit Image2"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload ID="FileUploadedit1" Visible="false" CssClass="form-control" runat="server" onchange="ShowImagePreviewedit2(this);" />
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-md-6">
                        <asp:Label ID="Label11" Visible="false" runat="server" Text="Edit Image3"></asp:Label>
                    </div>
                    <div class="col-md-4">
                        <asp:FileUpload ID="FileUploadedit2" Visible="false" CssClass="form-control" runat="server" onchange="ShowImagePreviewedit3(this);" />
                    </div>
                </div>--%>
            </div>


        </div>
    </div>
    <div class="row">

        <div class="container">
            <div class="col-md-10">
                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label10" runat="server" Font-Size="Large" Text="Set Section"></asp:Label>
                    </div>


                    <div class="col-sm-9">
                        <asp:ListBox  ID="ddlsection" runat="server" SelectionMode="Multiple">
                            <asp:ListItem Value="0">None</asp:ListItem>
                            <asp:ListItem Value="1">New Arrival</asp:ListItem>
                            <asp:ListItem Value="2">BestSellers</asp:ListItem>
                            <asp:ListItem Value="3">OnSale</asp:ListItem>
                        </asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="ddlsection"></asp:RequiredFieldValidator>
                        <%-- <asp:DropDownList runat="server" Width="50%" CssClass="form-control" ID="ddlsection">
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Home New Arrival</asp:ListItem>
                            <asp:ListItem Value="2">Home BestSellers</asp:ListItem>
                            <asp:ListItem Value="3">Home OnSale</asp:ListItem>
                        </asp:DropDownList>--%>
                    </div>
                </div>


                <%--        <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label11" runat="server" Font-Size="Large" Text="Product Details"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                        <CKEditor:CKEditorControl ID="txtPDetails" BasePath="../../ckeditor/" runat="server">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>--%>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label24" runat="server" Font-Size="Large" Text="Product Ingredients"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                        <CKEditor:CKEditorControl ID="txtingredients" BasePath="../../ckeditor/" runat="server">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label25" runat="server" Font-Size="Large" Text="Nutrition value"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                        <CKEditor:CKEditorControl ID="txtnutritionvalue" BasePath="../../ckeditor/" runat="server">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label26" runat="server" Font-Size="Large" Text="Allergy advice"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                        <CKEditor:CKEditorControl ID="txtallergiadvice" BasePath="../../ckeditor/" runat="server">
                        </CKEditor:CKEditorControl>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label19" runat="server" Font-Size="Large" Text="Occation/Deals Name"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                         <asp:ListBox  ID="txtoccationname" runat="server" SelectionMode="Multiple">
                             <asp:ListItem Value="0">None</asp:ListItem>
                            <asp:ListItem Value="1">Deals</asp:ListItem>
                            <asp:ListItem Value="2">Occation</asp:ListItem>
                            <asp:ListItem Value="3">Popular</asp:ListItem>
                        </asp:ListBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtoccationname"></asp:RequiredFieldValidator>
                    <%--<asp:DropDownList ID="txtoccationname" runat="server" CssClass="form-control" Width="70%">
                            <asp:ListItem Value="Deals">Deals</asp:ListItem>
                            <asp:ListItem Value="Occation">Occation</asp:ListItem>
                            <asp:ListItem Value="Popular">Popular</asp:ListItem>
                        </asp:DropDownList>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label20" runat="server" Font-Size="Large" Text="Occation/Deals Desc"></asp:Label>
                    </div>

                    <div class="col-sm-9">

                        <CKEditor:CKEditorControl ID="txtoccationdesc" BasePath="../../ckeditor/" runat="server">
                        </CKEditor:CKEditorControl>
                        <%--<asp:TextBox runat="server" CssClass="form-control" Width="70%" TextMode="MultiLine" ID="txtoccationdesc"></asp:TextBox>--%>
                    </div>
                </div>

                <div class="row form-group">
                    <div class="col-sm-3">
                        <asp:Label ID="Label21" runat="server" Font-Size="Large" Text="Occation/Deals Remaining"></asp:Label>
                    </div>

                    <div class="col-sm-9">
                        <asp:TextBox runat="server" CssClass="form-control" Width="70%" ID="txtoccationremaining"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col-md-3"></div>
        <div class="row form-group">

            <div class="col-md-6">
                <asp:Button ID="btnAdd" style="padding:5px 9px" runat="server" Text="Add Product" CssClass="btn btn-primary btn-lg" OnClick="btnAdd_Click" />
            </div>

            <div class="col-md-6">
                <asp:Button ID="btnupdate" runat="server" style="padding:5px 9px" Text="Update" CausesValidation="false" CssClass="btn btn-primary btn-lg" OnClick="btnupdate_Click" />
            </div>
        </div>
    </div>

</asp:Content>

