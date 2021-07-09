<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="FriedChickenAndChips.aspx.cs" Inherits="Pages_OurServices_FriedChickenAndChips" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
        * {
            box-sizing: border-box;
        }

        .column {
            float: left;
            width: 33.33%;
            padding: 5px;
        }

        /* Clearfix (clear floats) */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        @media screen and (max-width: 500px) {
            .column {
                width: 100%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div id="content">
        <div class="container">
            <h1 class="text-center">Welcome to BRR WHOLE SALE</h1>
            <br />
            <div class="row">
                <div class="col-md-12" style="font-size: larger; text-align: center">
                    <p>As a food-service specialist we offer the highest quality of products and services on the market today. Our 25 years of experience and commitment to excellence have earned us the reputation as one of the best food-service specialists in the industry. Our knowledge of the catering industry means that you can be sure of getting the service, value and support that you need. We have a large product portfolio consisting of over 1500 products, which will give you a choice of quality and value for money on products.</p>
                </div>
            </div>
            <br />


            <div class="row">
                <div class="col-md-12">


                    <div class="column">
                        <img src="../OurServicesImage/img_snow.jpg" alt="Snow" style="width: 80%">
                    </div>
                    <div class="column">
                        <img src="../OurServicesImage/img_forest.jpg" alt="Forest" style="width: 80%">
                    </div>
                    <div class="column">
                        <img src="../OurServicesImage/img_mountains.jpg" alt="Mountains" style="width: 80%">
                    </div>
                </div>
            </div>



        </div>
    </div>
</asp:Content>

