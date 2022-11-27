Imports System.Data.SqlClient
Imports DataLayer

Public Class MovieMaster
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Session("UID") <> Nothing) Then
            lnkLogout.Visible = True
            lnklstBookings.Visible = True
            lnkProfile.Visible = True
            lnkLogin.Visible = False
            lnkRegister.Visible = False
        Else
            lnkLogout.Visible = False
            lnkLogin.Visible = True
            lnkRegister.Visible = True
        End If

        If Not Me.IsPostBack Then
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            Using conn
                Using cmd As New SqlCommand("SELECT *  FROM tblMovie")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = conn
                    DropDownList1.DataSource = cmd.ExecuteReader()
                    DropDownList1.DataTextField = "Name"
                    DropDownList1.DataValueField = "MovieID"
                    DropDownList1.DataBind()
                    conn.Close()
                End Using
            End Using
            DropDownList1.Items.Insert(0, New ListItem("--Select Movie--", "0"))
        End If
    End Sub

    Protected Sub lnkLogout_Click(sender As Object, e As EventArgs)
        Session("UID") = Nothing
        lnklstBookings.Visible = False
        lnkProfile.Visible = False
        lnkLogout.Visible = False
        lnkLogin.Visible = True
        lnkRegister.Visible = True
        Response.Redirect("Login.aspx")
    End Sub

    Protected Sub btnChooseSeats_Click(sender As Object, e As EventArgs)
        Session("MovieName") = DropDownList1.SelectedItem.Text
        Session("MovieDate") = DropDownList4.SelectedItem.Text
        Session("MovieTime") = DropDownList2.SelectedItem.Text
        Session("NoOfPeople") = DropDownList3.SelectedItem.Text
        If (Session("UID") <> Nothing) Then
            Response.Redirect("userpage.aspx")
        Else
            Response.Redirect("login.aspx")
        End If
    End Sub
End Class