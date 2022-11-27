Public Class userpage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            lblMovieName.Text = Session("MovieName").ToString()
            lblDateTime.Text = Session("MovieDate").ToString() + " " + Session("MovieTime").ToString()
            lblTicketCount.Text = Session("NoOfPeople").ToString()

        End If
    End Sub

    Protected Sub btnBookNow_Click(sender As Object, e As EventArgs)
        Session("SeatNos") = hdnseats.Value
        Session("Price") = hdnPrice.Value
        Response.Redirect("payment.aspx")
    End Sub
End Class