<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MovieMaster.Master" CodeBehind="userpage.aspx.vb" Inherits="MovieApp.userpage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- for-mobile-apps -->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Movie Ticket Booking Widget Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <!-- //for-mobile-apps -->
    <link href='//fonts.googleapis.com/css?family=Kotta+One' rel='stylesheet' type='text/css'>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
    <link href="css/style2.css" rel="stylesheet" type="text/css" media="all" />
    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="js/jquery.seat-charts.js"></script>
    <div class="content">
        <h1>Movie Ticket Booking Widget</h1>
        <div class="main">
            <h2>Teatro Movie Cinema Showing Screen 1</h2>
            <div class="demo">
                <div id="seat-map">
                    <div class="front">SCREEN</div>
                </div>
                <div class="booking-details">
                    <ul class="book-left">
                        <li>Movie </li>
                        <li>Time </li>
                        <li>Tickets</li>
                        <li>Total</li>
                        <li>Seats :</li>
                    </ul>
                    <ul class="book-right">
                        <li>
                            <asp:Label ID="lblMovieName" runat="server" Text=""></asp:Label></li>
                        <li>:
                            <asp:Label ID="lblDateTime" runat="server" Text=""></asp:Label></li>
                        <li>:
                            <asp:Label ID="lblTicketCount" runat="server" Text=""></asp:Label></li>
                        <li>: <b><i>MYR</i><span id="total"><asp:Label ID="lblTotalPrice" runat="server" Text=""></asp:Label></span></b></li>
                    </ul>
                    <div class="clear"></div>
                    <ul id="selected-seats" class="scrollbar scrollbar1"></ul>

                    <asp:HiddenField ID="hdnseats" runat="server" />
                    <asp:HiddenField ID="hdnPrice" runat="server" />
                    <asp:Button ID="btnBookNow" runat="server" Text="Book Now" CssClass="checkout-button" OnClick="btnBookNow_Click" />
                  <%--  <button class="checkout-button">Book Now</button>--%>
                    <div id="legend"></div>
                </div>
                <div style="clear: both"></div>
            </div>

            <script type="text/javascript">
                var price = 10; //price
                $(document).ready(function () {
                    var $cart = $('#selected-seats'), //Sitting Area
					$counter = $('#counter'), //Votes
					$total = $('#ContentPlaceHolder1_lblTotalPrice'); //Total money

                    var sc = $('#seat-map').seatCharts({
                        map: [  //Seating chart
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__________',
							'aaaaaaaa__',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'aaaaaaaaaa',
							'__aaaaaa__'
                        ],
                        naming: {
                            top: false,
                            getLabel: function (character, row, column) {
                                return column;
                            }
                        },
                        legend: { //Definition legend
                            node: $('#legend'),
                            items: [
								['a', 'available', 'Available'],
								['a', 'unavailable', 'Sold'],
								['a', 'selected', 'Selected']
                            ]
                        },
                        click: function () { //Click event
                            if (this.status() == 'available') { //optional seat
                                $('<li>Row' + (this.settings.row + 1) + ' Seat' + this.settings.label + '</li>')
									.attr('id', 'cart-item-' + this.settings.id)
									.data('seatId', this.settings.id)
									.appendTo($cart);

                                $counter.text(sc.find('selected').length + 1);
                                $total.text(recalculateTotal(sc) + price);

                                $('#ContentPlaceHolder1_hdnPrice').val(recalculateTotal(sc) + price);
                                var liIds = $('#selected-seats li').map(function (i, n) {
                                    return $(n).attr('id');
                                }).get().join(','); console.log(liIds);
                                $('#ContentPlaceHolder1_hdnseats').val(liIds);
                                return 'selected';
                            } else if (this.status() == 'selected') { //Checked
                                //Update Number
                                $counter.text(sc.find('selected').length - 1);
                                //update totalnum
                                $total.text(recalculateTotal(sc) - price);

                                //Delete reservation
                                $('#cart-item-' + this.settings.id).remove();
                                //optional
                                var liIds = $('#selected-seats li').map(function (i, n) {
                                    return $(n).attr('id');
                                }).get().join(','); console.log(liIds);
                                $('#ContentPlaceHolder1_hdnseats').val(liIds);
                                return 'available';
                            } else if (this.status() == 'unavailable') { //sold
                                return 'unavailable';
                            } else {
                                return this.style();
                            }
                        }
                    });
                    //sold seat
                    sc.get(['1_2', '4_4', '4_5', '6_6', '6_7', '8_5', '8_6', '8_7', '8_8', '10_1', '10_2']).status('unavailable');

                });
                //sum total money
                function recalculateTotal(sc) {
                    var total = 0;
                    sc.find('selected').each(function () {
                        total += price;
                    });

                    return total;
                }
            </script>
        </div>
    </div>
</asp:Content>
