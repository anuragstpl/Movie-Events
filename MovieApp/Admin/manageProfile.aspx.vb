Imports System.Data.SqlClient
Imports DataLayer

Public Class manageProfile
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

    Protected Sub btnEditUsers_Click(sender As Object, e As EventArgs)
        Try
            'step 2 -create a connection con
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            Dim sqlUpdate As String = "UPDATE Admin SET Password=@Password, Email=@Email,Name=@Name,Address=@Address"
            Dim comm As New SqlCommand(sqlUpdate, conn)
            comm.Parameters.AddWithValue("@Password", txtPassword.Text.Trim)
            comm.Parameters.AddWithValue("@Email", txtEmail.Text)
            comm.Parameters.AddWithValue("@Name", txtName.Text)
            comm.Parameters.AddWithValue("@Address", txtAddress.Text)
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
        Dim sqlSelect = "SELECT * FROM Admin"
        Dim comm As New SqlCommand(sqlSelect, conn)
        'step 5 - execute your command
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.Read = True Then
            lblUsername.Text = Session("Username")
            txtEmail.Text = reader.Item("Email")
            txtName.Text = reader.Item("Name")
            txtAddress.Text = reader.Item("Address")
            txtPassword.Text = reader.Item("Password")
            txtConfirmPassword.Text = reader.Item("Password")
        End If
        reader.Close()
        conn.Close()
    End Sub
End Class