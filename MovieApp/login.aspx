<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MovieMaster.Master" CodeBehind="login.aspx.vb" Inherits="MovieApp.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="content-top">
            <div class="section group">
                <div class="col span_2_of_3">
                    <div class="contact-form">
                        <h3>Sign In Form</h3>
                        <div>
                            <span>
                                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <label>Username</label></span>
                            <span>
                                <asp:TextBox ID="txtUsername" type="text" required  runat="server"></asp:TextBox></span>
                        </div>
                        <div>
                            <span>
                                <label>Password</label></span>
                            <span>
                                <asp:TextBox ID="txtPassword" TextMode="Password" required  runat="server"></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <asp:Button ID="btnSignIn" runat="server" Text="Sign In" /></span>
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
