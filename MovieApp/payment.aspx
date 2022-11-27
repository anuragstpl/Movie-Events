<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MovieMaster.Master" CodeBehind="payment.aspx.vb" Inherits="MovieApp.payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrap">
        <div class="content-top">
            <div class="section group">
                <div class="col span_2_of_3">
                    <div class="contact-form">
                        <h3>Make Payment</h3>
                        <div>
                            <span>
                                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
                            </span>
                        </div>
                        <div>
                            <span>
                                <label>Select Card Type</label></span>
                            <span>
                                <asp:RadioButtonList ID="rbCardType" type="text" class="form-control" runat="server">
                                    <asp:ListItem>Visa</asp:ListItem>
                                    <asp:ListItem>Mastercard</asp:ListItem>
                                </asp:RadioButtonList>
                            </span>
                        </div>

                        <div>
                            <span>
                                <label>Card Number</label></span>
                            <span>
                                <asp:TextBox ID="txtCardNo" class="form-control" runat="server" ></asp:TextBox></span>
                        </div>



                        <div>
                            <span>
                                <label>Security Code</label></span>
                            <span>
                                <asp:TextBox ID="txtSCode" MaxLength="3" runat="server" ></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <label>Month of Expiry</label></span>
                            <span>
                                <asp:TextBox ID="txtCMonth" runat="server" ></asp:TextBox></span>
                        </div>
                        <div>
                            <span>
                                <label>Year of Expiry</label></span>
                            <span>
                                <asp:TextBox ID="txtCYear" runat="server" ></asp:TextBox></span>
                        </div>

                        <div>
                            <span>
                                <asp:Button ID="btnDone" class="btn btn-default" OnClick="btnDone_Click" runat="server" Text="Done" /><br />
                            </span>
                        </div>
                        <div>
                            <hr />
                        </div>
                        <h3>Redeem Point</h3>
                        <div>
                            <span>
                                <label>
                                    
                                <asp:Label ID="lblRedeemPoint" runat="server"></asp:Label><i>(You need 400 points to make a free booking.)</i>
                                    </label></span>
                        </div>

                        <div>
                            <div>
                                <span>
                                    <label>Points (For Burning)</label></span>
                                <span>
                                    <%--<asp:TextBox ID="txtPoints" runat="server" placeholder="You need 400 points to book a ticket." ></asp:TextBox>--%></span>
                            </div>
                            <span>
                                <asp:Button ID="btnRedeem" class="btn btn-default" OnClick="btnRedeem_Click" runat="server" Text="Redeem" /><br />
                            </span>
                        </div>

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
