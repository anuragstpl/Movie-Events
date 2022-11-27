Imports DataLayer
Imports System.Data.SqlClient

Public Class EditProfile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("Username") = "" Then
                Response.Redirect("frmUserPage.aspx")
            Else
                loadData()
            End If
        End If
    End Sub

    Protected Sub btnUpdateProfile_Click(sender As Object, e As EventArgs)
        Try
            'step 2 -create a connection con
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            Dim sqlUpdate As String = "UPDATE tblCustomer SET Password=@Password, Email=@Email WHERE UID=@UID"
            Dim comm As New SqlCommand(sqlUpdate, conn)

            comm.Parameters.AddWithValue("Password", txtPassword.Text.Trim)
            comm.Parameters.AddWithValue("Email", txtEmail.Text)
            comm.Parameters.AddWithValue("UID", CInt(Session("UID")))
            comm.ExecuteNonQuery()
            lblMessage.Text = "Profile successfully updated..."
            conn.Close()

        Catch ex As Exception
            lblMessage.Text = ex.Message
        End Try
    End Sub

    Private Sub loadData()
        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        'step 4 - create a command comm
        Dim sqlSelect = "SELECT * FROM tblCustomer WHERE Username=@Username"
        Dim comm As New SqlCommand(sqlSelect, conn)
        comm.Parameters.AddWithValue("@Username", Session("Username"))
        'step 5 - execute your command
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.Read = True Then
            lblUsername.Text = Session("Username")
            Response.Write(reader.Item("UID"))
            txtEmail.Text = reader.Item("Email")
            txtPassword.Text = reader.Item("Password")
        End If
        reader.Close()
        conn.Close()
    End Sub
End Class