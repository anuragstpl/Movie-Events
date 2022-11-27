Public Class MovieMaster1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub lnkLogout_Click(sender As Object, e As EventArgs)
        Response.Redirect("Login.aspx")
    End Sub
End Class