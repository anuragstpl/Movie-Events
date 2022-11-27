Imports System.Data.SqlClient
Imports DataLayer

Public Class Login1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnSignIn_Click(sender As Object, e As EventArgs)
        'step 2 -create a connection con
        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        'step 4 - create a command comm
        Dim sqlSelect = "SELECT * FROM Admin WHERE Username=@Username AND Password=@Password"
        Dim comm As New SqlCommand(sqlSelect, conn)
        comm.Parameters.AddWithValue("@Username", txtUsername.Text.Trim())
        comm.Parameters.AddWithValue("@Password", txtPassword.Text.Trim())
        'step 5 - execute your command
        Dim reader As SqlDataReader = comm.ExecuteReader

        If reader.Read = True Then
            Session("Username") = txtUsername.Text
            Response.Redirect("lstUser.aspx")
        Else
            lblError.Text = "Invalid userid and password!"
        End If
        'step 6 - close all
        reader.Close()
        conn.Close()
    End Sub
End Class