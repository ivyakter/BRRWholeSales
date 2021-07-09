<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="DashBoard.aspx.cs" Inherits="Pages_Set_DashBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">



    <div class="main-body">
        <div class="page-wrapper">
            <!-- Page-header start -->
            <div class="page-header">
                <div class="row align-items-end">
                    <div class="col-lg-8">
                        <div class="page-header-title">
                            <div class="d-inline">
                                <h4>Invoice Summary</h4>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="page-header-breadcrumb">
                            <ul class="breadcrumb-title">
                                <li class="breadcrumb-item">
                                    <a href="index.html"><i class="feather icon-home"></i></a>
                                </li>
                                <li class="breadcrumb-item"><a href="#!">Widget</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Page-header end -->
            <!-- Page body start -->
            <div class="page-body">
                <div class="row">
                    <div class="col-xl-5">
                        <!-- Sales and expense card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Sales And Expenses</h5>
                            </div>
                            <div class="card-block">
                                <canvas id="barChart" width="400" height="300"></canvas>
                            </div>
                        </div>
                        <!-- Sales and expense card end -->
                    </div>
                    <div class="col-xl-7">
                        <!-- Sales, Receipt and Dues card start -->
                        <div class="card">
                            <div class="card-header">
                                <h5>Sales, Receipt And Dues</h5>

                            </div>
                            <div class="card-block table-border-style">
                                <div class="table-responsive">
                                    <table class="table table-lg table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Sales</th>
                                                <th>Receipt</th>
                                                <th>Dues</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <th scope="row">Today</th>
                                                <td>$250.00</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">This Week</th>
                                                <td>$380.00</td>
                                                <td>Thornton</td>
                                                <td>@fat</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">This Month</th>
                                                <td>$450.00</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">This Year</th>
                                                <td>$600.00</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                            <tr>
                                                <th scope="row">Total</th>
                                                <td>$600.00</td>
                                                <td>the Bird</td>
                                                <td>@twitter</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Sales, Receipt and Dues card end -->
                    </div>

                  
                        <div class="col-lg-12">
                            <!-- Recent Orders card start -->
                            <div class="card">
                                <div class="card-header">
                                    <h5>Recent Orders</h5>

                                </div>
                                <div class="card-block table-border-style">
                                    <div class="table-responsive">
                                        <table class="table table-lg table-styling">
                                            <thead>
                                                <tr class="table-primary">
                                                    <th>#</th>
                                                    <th>Order No.</th>
                                                    <th>Product Name</th>
                                                    <th>Quantity</th>
                                                    <th>Price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <th scope="row">1</th>
                                                    <td>54822</td>
                                                    <td>Product 1</td>
                                                    <td>2</td>
                                                    <td>
                                                        <label class="label label-md label-danger">$99.00</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">2</th>
                                                    <td>54823</td>
                                                    <td>Product 2</td>
                                                    <td>1</td>
                                                    <td>
                                                        <label class="label label-md label-success">$29.00</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">3</th>
                                                    <td>54824</td>
                                                    <td>Product 3</td>
                                                    <td>3</td>
                                                    <td>
                                                        <label class="label label-md label-warning">$109.00</label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- Recent Orders card end -->
                        </div>
                   
                </div>
            </div>
            <!-- Page body end -->
        </div>
    </div>





</asp:Content>

