﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MovieMaster.Master" CodeBehind="lstUser.aspx.vb" Inherits="MovieApp.lstUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="lstBookings" runat="server" ItemPlaceholderID="groupPlaceHolder1"  OnPagePropertiesChanging="lstBookings_PagePropertiesChanging">
        <LayoutTemplate>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12" style="width: 84%">
                        <div class="box" style="margin-left: 220px;">
                            <div class="box-header">
                                <h3 class="box-title">Bookings</h3>
                                <br />
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example2" width="80%" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Username</th>
                                            <th>Name</th>
                                            <th>Gender</th>
                                            <th>DOB</th>
                                            <th>Address</th>
                                            <th>Email</th>
                                            <th>Points</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <br />
                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="6">
                                                <br />
                                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstBookings" PageSize="10">
                                                    <Fields>
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowFirstPageButton="false" ShowPreviousPageButton="true"
                                                            ShowNextPageButton="false" />
                                                        <asp:NumericPagerField ButtonType="Link" />
                                                        <asp:NextPreviousPagerField ButtonType="Link" ShowNextPageButton="true" ShowLastPageButton="false" ShowPreviousPageButton="false" />
                                                    </Fields>
                                                </asp:DataPager>
                                            </td>
                                        </tr>
                                    </tfoot>
                                </table>

                            </div>
                            <!-- /.box-body -->
                        </div>
                    </div>
                </div>
            </section>
        </LayoutTemplate>

        <ItemTemplate>
            <tr>

                <td><%# Eval("Username") %></td>
                <td><%# Eval("FirstName")%>&nbsp;<%# Eval("LastName")%></td>
                <td><%# Eval("Gender") %></td>
                <td><%# Eval("DOB") %></td>
                <td><%# Eval("Address")%></td>
                <td><%# Eval("Email")%></td>
                <td><%# Eval("Points")%></td>
            </tr>
        </ItemTemplate>


    </asp:ListView>
</asp:Content>
