Imports System.Data.SqlClient
Imports DataLayer

Public Class payment
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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

    Public Function GenerateRandomString(ByRef iLength As Integer) As String
        Dim rdm As New Random()
        Dim allowChrs() As Char = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".ToCharArray()
        Dim sResult As String = ""

        For i As Integer = 0 To iLength - 1
            sResult += allowChrs(rdm.Next(0, allowChrs.Length))
        Next

        Return sResult
    End Function



    Protected Sub btnDone_Click(sender As Object, e As EventArgs)
        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        'insert to tblBooking  
        Dim query2 As String = "INSERT INTO tblBooking(BCode, BDate, UID, Movie, Quantity,SeatID,Status,Price,BookingType) VALUES (@BCode, @BDate, @UID, @MID, @Quantity,@SeatID,@Status,@Price,@BookingType);SELECT @@IDENTITY;"
        Dim comm2 As New SqlCommand(query2, conn)
        comm2.Parameters.AddWithValue("@BCode", GenerateRandomString(10))
        comm2.Parameters.AddWithValue("@BDate", Now)
        comm2.Parameters.AddWithValue("@UID", Session("UID"))
        comm2.Parameters.AddWithValue("@MID", Session("MovieName"))
        comm2.Parameters.AddWithValue("@Quantity", Session("NoOfPeople"))
        comm2.Parameters.AddWithValue("@SeatID", Session("SeatNos"))
        comm2.Parameters.AddWithValue("@Price", Session("Price"))
        comm2.Parameters.AddWithValue("@Status", "Confirmed")
        comm2.Parameters.AddWithValue("@BookingType", rbCardType.SelectedItem.Text)
        'comm2.ExecuteNonQuery()

        Dim cmd_result As Integer = CInt(comm2.ExecuteScalar())

        'insert to Transactions  
        Dim sqlUpdate As String = ("insert into tblCardTransaction values(@CType,@CNumber,@CSNumber,@Month,@Year,@BID)")
        Dim comm As New SqlCommand(sqlUpdate, conn)
        comm.Parameters.AddWithValue("@CType", rbCardType.SelectedValue)
        comm.Parameters.AddWithValue("@CNumber", txtCardNo.Text)
        comm.Parameters.AddWithValue("@CSNumber", txtSCode.Text)
        comm.Parameters.AddWithValue("@Month", txtCMonth.Text)
        comm.Parameters.AddWithValue("@Year", txtCYear.Text)
        comm.Parameters.AddWithValue("@BID", cmd_result.ToString())
        comm.ExecuteNonQuery()


        Dim sqlSelect = "Update tblCustomer set Points=@Points WHERE Username=@Username"
        Dim comm4 As New SqlCommand(sqlSelect, conn)
        comm4.Parameters.AddWithValue("@Points", Convert.ToInt32(Session("Points")) + 25)
        comm4.Parameters.AddWithValue("@Username", Session("Username"))
        'step 5 - execute your command
        Dim reader As SqlDataReader = comm4.ExecuteReader()
        If reader.Read = True Then
            lblRedeemPoint.Text = reader.Item("Points")
        End If
        reader.Close()
        conn.Close()

        Response.Redirect("final.aspx")

    End Sub

    Protected Sub btnRedeem_Click(sender As Object, e As EventArgs) Handles btnRedeem.Click
        If (Session("Points") < 400) Then
            lblMessage.Text = "You don't have suffiecient points to made the purchase."
            Return
        End If

        Dim conn As New SqlConnection()
        conn = DataConnection.OpenConnection()
        'insert to tblBooking  
        Dim query2 As String = "INSERT INTO tblBooking(BCode, BDate, UID, Movie, Quantity,SeatID,Status,Price,BookingType) VALUES (@BCode, @BDate, @UID, @MID, @Quantity,@SeatID,@Status,@Price,@BookingType);SELECT @@IDENTITY;"
        Dim comm2 As New SqlCommand(query2, conn)
        comm2.Parameters.AddWithValue("@BCode", GenerateRandomString(10))
        comm2.Parameters.AddWithValue("@BDate", Now)
        comm2.Parameters.AddWithValue("@UID", Session("UID"))
        comm2.Parameters.AddWithValue("@MID", Session("MovieName"))
        comm2.Parameters.AddWithValue("@Quantity", Session("NoOfPeople"))
        comm2.Parameters.AddWithValue("@SeatID", Session("SeatNos"))
        comm2.Parameters.AddWithValue("@Status", "Confirmed")
        comm2.Parameters.AddWithValue("@BookingType", "Points Redeem")
        comm2.ExecuteNonQuery()

        Dim sqlSelect = "Update tblCustomer set Points=@Points WHERE Username=@Username"
        Dim comm4 As New SqlCommand(sqlSelect, conn)
        comm4.Parameters.AddWithValue("@Points", Convert.ToInt32(Session("Points")) - 400)
        comm4.Parameters.AddWithValue("@Username", Session("Username"))
        comm4.ExecuteNonQuery()
        conn.Close()

    End Sub
End Class