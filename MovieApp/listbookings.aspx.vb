Imports System.Data.SqlClient
Imports DataLayer

Public Class listbookings
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.BindListView()
        End If

        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        Dim sqlSelect = "SELECT * FROM tblCustomer WHERE Username=@Username"
        Dim comm4 As New SqlCommand(sqlSelect, conn)
        comm4.Parameters.AddWithValue("@Username", Session("Username"))
        'step 5 - execute your command
        Dim reader As SqlDataReader = comm4.ExecuteReader()
        If reader.Read = True Then
            lblRedeemPoint.Text = "You have " + reader.Item("Points").ToString() + " points."
            Session("Points") = reader.Item("Points")
        End If
        reader.Close()
        conn.Close()
    End Sub

    Private Sub BindListView()
        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        Using conn
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT * from tblBooking where UID=" + Session("UID").ToString()
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

    Protected Sub lstBookings_ItemCommand(sender As Object, e As ListViewCommandEventArgs)
        If (e.CommandName = "CancelBooking") Then
            Dim conn As New SqlConnection()
            conn = DataConnection.OpenConnection()
            Using conn
                Using cmd As New SqlCommand()
                    cmd.CommandText = "delete from tblBooking where BID=" + e.CommandArgument.ToString()
                    cmd.Connection = conn
                    cmd.ExecuteNonQuery()

                End Using
            End Using
            BindListView()
        End If

    End Sub

    Protected Sub lstBookings_PagePropertiesChanging(sender As Object, e As PagePropertiesChangingEventArgs)

    End Sub
End Class