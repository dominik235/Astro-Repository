
Partial Class AstroHome
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Context.User.Identity.IsAuthenticated = False Then
                Response.Redirect("~/Login.aspx", False)
            End If
        End If

    End Sub
End Class
