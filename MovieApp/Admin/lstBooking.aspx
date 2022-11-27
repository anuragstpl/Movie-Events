<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MovieMaster.Master" CodeBehind="lstBooking.aspx.vb" Inherits="MovieApp.lstBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="lstBookings" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemCommand="lstBookings_ItemCommand" OnPagePropertiesChanging="lstBookings_PagePropertiesChanging">
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
                                            <th>Booking ID</th>
                                            <th>Movie</th>
                                            <th>Seats Count</th>
                                            <th>Status</th>

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

                <td><%# Eval("BCode") %></td>
                <td><%# Eval("Movie") %></td>
                <td><%# Eval("Quantity") %></td>
                <td><%# Eval("Status") %></td>

            </tr>
        </ItemTemplate>


    </asp:ListView>
</asp:Content>
