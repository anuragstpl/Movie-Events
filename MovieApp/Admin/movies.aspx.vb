Imports System.Data.SqlClient
Imports DataLayer

Public Class movies
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindListView()
        End If
    End Sub

    Private Sub BindListView()
        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        Using conn
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT * from tblMovie"
                cmd.Connection = conn
                Using sda As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    lstMovies.DataSource = dt
                    lstMovies.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub lstMovies_ItemCommand(sender As Object, e As ListViewCommandEventArgs)
        If (e.CommandName = "DeleteMovie") Then
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            Using conn
                Using cmd As New SqlCommand()
                    cmd.CommandText = "delete from tblMovie where MovieID=" + e.CommandArgument.ToString()
                    cmd.Connection = conn
                    cmd.ExecuteNonQuery()

                End Using
            End Using
            BindListView()
        End If
    End Sub

    Protected Sub lstMovies_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)

    End Sub

    Protected Sub btnAddMovie_Click(sender As Object, e As EventArgs)
        Try
            'step 1 -create a connection con
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            'step 2 - create a command comm
            Dim sqlInsert As String = "INSERT INTO tblMovie(Name,Description) VALUES(@Name,@Description)"
            Dim comm As New SqlCommand(sqlInsert, conn)
            comm.Parameters.AddWithValue("@Name", txtTitle.Text)
            comm.Parameters.AddWithValue("@Description", txtDescription.Text)
            'step 3 - execute your command
            comm.ExecuteNonQuery() ' insert, update, delete
            'step 4 - close all
            conn.Close()
            BindListView()
        Catch ex As Exception

        End Try
    End Sub
End Class