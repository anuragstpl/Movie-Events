Imports System.Data.SqlClient
Imports DataLayer
Imports System.Net.Mail

Public Class register
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Try
            'step 1 -create a connection con
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            'step 2 - create a command comm
            Dim sqlInsert As String = "INSERT INTO tblCustomer(Username,FirstName,LastName,Gender,DOB,Address,Email,Password,DateRegistered) VALUES(@Username,@FirstName,@LastName,@Gender,@DOB,@Address,@Email,@Password,@DateRegistered)"
            Dim comm As New SqlCommand(sqlInsert, conn)
            comm.Parameters.AddWithValue("@Username", txtUsername.Text)
            comm.Parameters.AddWithValue("@FirstName", txtFirstName.Text)
            comm.Parameters.AddWithValue("@LastName", txtLastName.Text)
            comm.Parameters.AddWithValue("@Gender", ddlGender.SelectedValue)
            comm.Parameters.AddWithValue("@DOB", txtDOB.Text)
            comm.Parameters.AddWithValue("@Address", txtAddress.Text)
            comm.Parameters.AddWithValue("@Email", txtEmail.Text)
            comm.Parameters.AddWithValue("@Password", txtPassword.Text)
            comm.Parameters.AddWithValue("@DateRegistered", Now())
            'step 3 - execute your command
            comm.ExecuteNonQuery() ' insert, update, delete
            'step 4 - close all
            conn.Close()
            lblError.Text = "You have been successfully registered"
            lblError.ForeColor = Drawing.Color.Blue
            Dim Smtp_Server As New SmtpClient
            Dim e_mail As New MailMessage()
            Smtp_Server.UseDefaultCredentials = False
            Smtp_Server.Credentials = New Net.NetworkCredential("purcellcompliance@gmail.com", "m2n1shlko")
            Smtp_Server.Port = 587
            Smtp_Server.EnableSsl = True
            Smtp_Server.Host = "smtp.gmail.com"

            e_mail = New MailMessage()
            e_mail.From = New MailAddress("anuragc64@gmail.com")
            e_mail.To.Add(txtEmail.Text)
            e_mail.Subject = "Registration Successfull"
            e_mail.IsBodyHtml = False
            e_mail.Body = "You are successfully registered as user on Teatro Online Ticket System."
            Smtp_Server.Send(e_mail)
        Catch ex As Exception

        End Try
    End Sub
End Class