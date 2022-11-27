<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MovieMaster.Master" CodeBehind="register.aspx.vb" Inherits="MovieApp.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="wrap">
        <div class="content-top">
            <div class="section group">
                <div class="col span_2_of_3">
                    <div class="contact-form">
                        <h3>Sign Up Form</h3>
                        <div>
                            <span>
                                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <label>Username</label></span>
                            <span>
                                <asp:TextBox ID="txtUsername" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>


                        <div>
                            <span>
                                <label>First Name</label></span>
                            <span>
                                <asp:TextBox ID="txtFirstName" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <label>Last Name</label></span>
                            <span>
                                <asp:TextBox ID="txtLastName" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <label>Date of Birth</label></span>
                            <span>
                                <asp:TextBox ID="txtDOB" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <label>Gender</label></span>
                            <span>
                                <asp:DropDownList ID="ddlGender" type="text" class="form-control" runat="server" AutoPostBack="True">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                </asp:DropDownList>
                            </span>
                        </div>

                        <div>
                            <span>
                                <label>Address</label></span>
                            <span>
                                <asp:TextBox ID="txtAddress" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <label>Email Address</label></span>
                            <span>
                                <asp:TextBox ID="txtEmail" type="text" class="form-control" runat="server" required></asp:TextBox></span>
                        </div>



                        <div>
                            <span>
                                <label>Password</label></span>
                            <span>
                                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" required></asp:TextBox></span>
                        </div>

                         <div>
                            <span>
                                <label>Confirm Password</label></span>
                            <span>
                                <asp:TextBox ID="txtConPassword" TextMode="Password" runat="server" required></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <asp:Button ID="btnRegister" type="submit" class="btn btn-default" runat="server" Text="Register" /></span>
                        </div>
                        </>
                    </div>
                </div>
                <div class="col span_1_of_3">
                    <div class="contact_info">

                        <img src="images/Movies-Oscar-icon.png" />
                    </div>

                </div>

            </div>
            <div class="clear"></div>
        </div>
    </div>

   
</asp:Content>
