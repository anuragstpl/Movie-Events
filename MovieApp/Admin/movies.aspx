<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin/MovieMaster.Master" CodeBehind="movies.aspx.vb" Inherits="MovieApp.movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://fonts.googleapis.com/css?family=Allerta" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.0/css/mdb.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.3.0/js/mdb.min.js"></script>
    <style type="text/css">
        .prod_page {
            float: left;
            width: 100%;
        }

        .product_item_view {
            float: left;
            width: 100%;
            margin-top: 40%;
        }


        .product_detail_view {
            float: left;
            width: 78%;
            padding: 20px;
            box-shadow: 0 0 3px #aaa;
            padding: 10px;
            margin-top: 2%;
            margin-left: 260px;
        }

        .pro_heading {
            float: left;
            width: 100%;
            font-size: 45px;
            font-weight: normal;
            font-family: 'Allerta', sans-serif;
            ;
        }

        .new_coll {
            float: left;
            width: 100%;
            font-size: 18px;
            font-style: italic;
            margin: 30px 0;
            position: relative;
        }

        #stock_available {
            color: red;
            font-size: 18px;
            font-weight: 500;
            font-style: normal;
            text-decoration: none !important;
            padding: 40%;
        }

        .pro_rate {
            float: left;
            width: 100%;
            margin: 15px 0;
            padding-left: 10%;
            font-size: 25px;
            font-style: italic;
        }

        /*label {
            font-size: 1.8rem;
        }*/

        .color_quantity {
            width: 80%;
            float: left;
            margin-left: 10%;
            border-top: 1px solid #aaa;
            border-bottom: 1px solid #aaa;
            height: 70px;
            padding: 10px;
            margin-bottom: 30px;
        }

        .color {
            width: 35%;
            float: left;
        }

        .color_select {
            float: left;
            width: 50%;
            margin-left: 10px;
            margin-top: 10px;
        }

            .color_select li {
                float: left;
                width: 7%;
                text-align: center;
                padding: 0 10px;
            }

        #red {
            width: 15px;
            height: 15px;
            background-color: red;
            float: left;
            border-radius: 1em;
        }

        #green {
            width: 15px;
            height: 15px;
            background: green;
            background-color: green;
            float: left;
            border-radius: 1em;
        }

        #black {
            width: 15px;
            height: 15px;
            background: black;
            background-color: black;
            float: left;
            border-radius: 1em;
        }

        .color span {
            float: left;
            margin-bottom: 2px;
            width: 100%;
        }

        .slash {
            float: left;
            width: 5%;
            font-size: 75px;
            padding: 0;
            margin: 0;
            line-height: 0.6;
        }

        .quantity {
            float: left;
            width: 45%;
        }
    </style>
    <%--  <link
        href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
        crossorigin="anonymous">--%>
    <asp:Panel runat="server" ID="pnlAddMovie">
        <div class="box-body" style="margin-left: 250px;">
            <div class="row">
                <div class="col-md-6">
                    <p>&nbsp;</p>
                    <div class="form-group">
                        <label>Movie Name*</label>
                        <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" required placeholder="Enter Title"></asp:TextBox>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-md-12">
                    <div class="form-group">
                        <label>Description*</label>
                        <asp:TextBox runat="server" TextMode="MultiLine" ID="txtDescription" Rows="3" CssClass="form-control" required placeholder="Enter Description"></asp:TextBox>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-md-6">
                    <label></label>
                    <div class="form-group">
                        <asp:Button runat="server" ID="btnAddMovie" OnClick="btnAddMovie_Click" Text="Add Movie" CssClass="btn btn-block btn-success" />
                    </div>
                </div>
            </div>
            <!-- /.row -->
        </div>
    </asp:Panel>
    <asp:ListView ID="lstMovies" runat="server" ItemPlaceholderID="groupPlaceHolder1" OnItemCommand="lstMovies_ItemCommand" OnPagePropertiesChanging="lstMovies_PagePropertiesChanging">
        <LayoutTemplate>
            <section class="content">
                <div class="row">
                    <div class="col-xs-12" style="width: 84%">
                        <div class="box" style="margin-left: 220px; margin-top: 20px; margin-bottom: -30px;">
                            <div class="box-header">
                                <h3 class="box-title">Now Showing</h3>

                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">

                                <table id="example2" class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Description</th>
                                            <th>Delete</th>
                                            

                                        </tr>
                                    </thead>
                                    <tbody>

                                        <asp:PlaceHolder runat="server" ID="groupPlaceHolder1"></asp:PlaceHolder>

                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <td colspan="4">
                                                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="lstMovies" PageSize="10">
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
                <td><%#Eval("Name") %></td>
                <td><%#Eval("Description") %></td>
                <td>
                    <asp:LinkButton runat="server" ID="lnkDelete" CssClass="fa fa-fw fa-remove" OnClientClick="javascript:return confirm('Are you sure you want to delete the movie?');" CommandArgument='<%# Eval("MovieID") %>' ToolTip="Delete Movie" CommandName="DeleteMovie">Delete</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>


    </asp:ListView>

</asp:Content>
