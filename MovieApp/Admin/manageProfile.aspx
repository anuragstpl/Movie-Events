<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MovieMaster.Master" CodeBehind="manageProfile.aspx.vb" Inherits="MovieApp.manageProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <link rel="stylesheet" href="../../plugins/daterangepicker/daterangepicker.css">
    <!-- bootstrap datepicker -->
    <link rel="stylesheet" href="../../plugins/datepicker/datepicker3.css">
    <!-- iCheck for checkboxes and radio inputs -->
    <link rel="stylesheet" href="../../plugins/iCheck/all.css">
    <!-- Bootstrap Color Picker -->
    <link rel="stylesheet" href="../../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <!-- Bootstrap time Picker -->
    <link rel="stylesheet" href="../../plugins/timepicker/bootstrap-timepicker.min.css">
    <!-- Select2 -->
    <link rel="stylesheet" href="/plugins/select2/select2.min.css">
     <div>

        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <section class="content-header">
                <h1>Edit User
                </h1>
                <ol class="breadcrumb">
                    <li><a href="#"><i class="fa fa-dashboard"></i>Dashboard</a></li>
                    <li><a href="#">Admin</a></li>
                    <li class="active">Edit Admin</li>
                </ol>
            </section>

            <!-- General Info -->
            <section class="content">

                <!-- SELECT2 EXAMPLE -->
                <div class="box box-default">
                    <div class="box-header with-border">
                        <h3 class="box-title">General Info</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    
                                    <asp:Label runat="server" ID="lblMessage" CssClass="form-control" ></asp:Label>
                                </div>

                                <div class="form-group">
                                    <label>Username*</label>
                                    <asp:Label runat="server" ID="lblUsername" CssClass="form-control" ></asp:Label>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Email*</label>
                                    <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" required placeholder="Enter Email"></asp:TextBox>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Name*</label>
                                    <asp:TextBox runat="server" ID="txtName" CssClass="form-control" required placeholder="Enter Name"></asp:TextBox>
                                </div>
                                <!-- /.form-group -->
                                <div class="form-group">
                                    <label>Address*</label>
                                    <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control" required placeholder="Enter Address"></asp:TextBox>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <!-- /.col -->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Password*</label>
                                    <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control" TextMode="Password" pattern=".{8,}"  required title="(8 chars minimum)"  placeholder="Enter Password"></asp:TextBox>
                                </div>

                            </div>

                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm Password*</label>
                                    <asp:TextBox runat="server" ID="txtConfirmPassword" CssClass="form-control" TextMode="Password" pattern=".{8,}"  required title="(8 chars minimum)" placeholder="Enter Password Again"></asp:TextBox>
                                </div>

                            </div>
                            <div class="col-md-6">
                                <label></label>
                                <div class="form-group">
                                    <asp:Button runat="server" ID="btnEditUsers" Text="Edit Admin" CssClass="btn btn-block btn-success" OnClick="btnEditUsers_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.box-body -->

                </div>
                <!-- /.box -->


            </section>
            <!-- /.content -->
            <!-- General Info -->
            
            <!-- /.content -->
        </div>

    </div>
</asp:Content>
