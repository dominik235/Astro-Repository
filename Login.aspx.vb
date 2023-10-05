
Imports System.Data
Imports System.Data.SqlClient

Partial Class Login
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Context.User.Identity.IsAuthenticated = False Then
            Session.RemoveAll()
        Else
            Dim username = Session("username")
        End If
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim login_status As Boolean = False
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspOsobaLogin_GET]", cn)
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@username", txtUserNameLogin.Text.Trim)
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim row_count As Integer = sqlReader.GetInt32(0)

                            If row_count > 0 Then
                                login_status = True
                            End If

                        End While
                    End Using
                End Using
            End Using

            If login_status Then
                lblLoginError.Text = ""
                Session.Add("username", txtUserNameLogin.Text)
                GetUserID(txtUserNameLogin.Text)
                Response.Redirect("~/AstroHome.aspx", False)
                FormsAuthentication.SetAuthCookie(txtUserNameLogin.Text, False)
            Else
                lblLoginError.Text = "Login credentials are incorrect."
            End If
        Catch ex As Exception
            lblLoginError.Text = ex.Message.ToString
        End Try

    End Sub

    Private Sub GetUserID(username As String)
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT osoba_id FROM [AstroRepository].[dbo].[tOsoba_Login] WHERE Username = @username", cn)

                    cmd.Parameters.AddWithValue("@username", username)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        If sqlReader.Read Then
                            Session.Add("user_id", sqlReader.GetInt32(0))

                        End If
                    End Using

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
End Class
