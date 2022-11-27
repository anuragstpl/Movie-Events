Imports System.Data.SqlClient

Public Class DataConnection
    Public Shared Function OpenConnection() As SqlConnection
        Dim conn As New SqlConnection("Data Source=localhost;Initial Catalog=cinemovDB;Integrated Security=True")
        conn.Open()
        Return conn
    End Function
End Class
