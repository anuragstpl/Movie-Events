Imports System.Data.SqlClient
Imports DataLayer

Public Class lstBooking
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
                cmd.CommandText = "SELECT * from tblBooking"
                cmd.Connection = conn
                Using sda As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    sda.Fill(dt)
                    lstBookings.DataSource = dt
                    lstBookings.DataBind()
                End Using
            End Using
        End Using
    End Sub

    Protected Sub lstBookings_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)

    End Sub

    Protected Sub lstBookings_ItemCommand(sender As Object, e As ListViewCommandEventArgs)

    End Sub
End Class