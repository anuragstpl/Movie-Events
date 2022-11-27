<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MovieMaster.Master" CodeBehind="EditProfile.aspx.vb" Inherits="MovieApp.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="wrap">
        <div class="content-top">
            <div class="section group">
                <div class="col span_2_of_3">
                    <div class="contact-form">
                        <h3>Edit Profile</h3>
                        <div>
                            <span>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <label>Username</label></span>
                            <span>
                                <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>
                                </span>
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
                                <asp:Button ID="btnUpdateProfile" type="submit" class="btn btn-default" OnClick="btnUpdateProfile_Click" runat="server" Text="Update Profile" /></span>
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
