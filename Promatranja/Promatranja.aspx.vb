
Imports System.Data
Imports System.Data.SqlClient
Imports System.Xml

Partial Class Promatranja_Promatranja
    Inherits System.Web.UI.Page

    Private Property slike_path As ArrayList
        Get

            If Session("slike_path") Is Nothing Then
                Session("slike_path") = New ArrayList()
            End If

            Return CType(Session("slike_path"), ArrayList)
        End Get
        Set(ByVal value As ArrayList)
            Session("slike_path") = value
        End Set
    End Property
    Private Property ses_promatranje_id As Integer
        Get

            If Session("promatranje_id") Is Nothing Then
                Session("promatranje_id") = New Integer
            End If

            Return CType(Session("promatranje_id"), Integer)
        End Get
        Set(ByVal value As Integer)
            Session("promatranje_id") = value
        End Set
    End Property

    Private Property slike_naziv As ArrayList
        Get

            If Session("slike_naziv") Is Nothing Then
                Session("slike_naziv") = New ArrayList()
            End If

            Return CType(Session("slike_naziv"), ArrayList)
        End Get
        Set(ByVal value As ArrayList)
            Session("slike_naziv") = value
        End Set
    End Property

    Private Property slika_index As Integer
        Get

            If Session("slika_index") Is Nothing Then
                Session("slika_index") = New Integer
            End If

            Return CType(Session("slika_index"), Integer)
        End Get
        Set(ByVal value As Integer)
            Session("slika_index") = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Context.User.Identity.IsAuthenticated = False Then
                Response.Redirect("~/Login.aspx", False)
            End If

            PopuniDDLLokacije()
            PopuniDDLInstrumenti()
            PopuniDDLObjekti()
            PopuniDDLGodine()
            PopuniDDLPromatranjeTip()
            PopuniDDLSlikaKvaliteta()
            PopuniDDLObjektVrsta()
            PopuniDDLPovecanje()
            PopuniDDLSvjetlina()
        End If
    End Sub

    Protected Sub AjaxFileUpload1_UploadComplete(sender As Object, e As AjaxControlToolkit.AjaxFileUploadEventArgs) Handles AjaxFileUpload1.UploadComplete
        Dim filename As String = e.FileName
        Dim FullPath As String = Server.MapPath("~/UploadSlike/") + Date.Now.Hour.ToString + "_" & Date.Now.Minute.ToString + "_" & Date.Now.Second.ToString + "-" & filename
        Dim pathSave As String = "/UploadSlike/" + Date.Now.Hour.ToString + "_" & Date.Now.Minute.ToString + "_" & Date.Now.Second.ToString + "-" & filename

        Try

            slike_path.Add(pathSave)
            slike_naziv.Add(filename)

            AjaxFileUpload1.SaveAs(FullPath)

        Catch ex As Exception
            Console.WriteLine(ex.Message)
        End Try

    End Sub

    Private Sub PopuniDDLLokacije()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT lokacija_id, Vrijednost FROM [AstroRepository].[dbo].[tLokacija] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListLokacije.Items.Add(listItem)
                            DropDownListLokacijaEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLPromatranjeTip()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT promatranje_tip_id, Vrijednost FROM [AstroRepository].[dbo].[tPromatranje_tip] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListPromatranjeTipEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLSlikaKvaliteta()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT slika_kvaliteta_id, Vrijednost FROM [AstroRepository].[dbo].[tSlika_Kvaliteta] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListSlikaKvalitetaEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLObjektVrsta()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT objekt_vrsta_id, Vrijednost FROM [AstroRepository].[dbo].[tObjekt_Vrsta] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListObjektVrstaEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLPovecanje()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT povecanje_id, Vrijednost FROM [AstroRepository].[dbo].[tPovecanje] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListPovecanjeEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLInstrumenti()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT instrument_id, Vrijednost FROM [AstroRepository].[dbo].[tInstrument] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListInstrumenti.Items.Add(listItem)
                            DropDownListInstrumentiEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLObjekti()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT objekt_id, Vrijednost FROM [AstroRepository].[dbo].[tObjekt] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListObjekti.Items.Add(listItem)
                            DropDownListObjektiEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Sub PopuniDDLSvjetlina()
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT svjetlina_id, Vrijednost FROM [AstroRepository].[dbo].[tSvjetlina] WHERE Datum_do IS NULL", cn)

                    Using sqlReader As SqlDataReader = cmd.ExecuteReader
                        While sqlReader.Read
                            Dim listItem As New ListItem


                            listItem.Value = sqlReader.GetInt32(0)
                            listItem.Text = sqlReader.GetString(1)

                            DropDownListSvjetlinaEdit.Items.Add(listItem)

                        End While
                    End Using
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub

    Private Sub PopuniDDLGodine()
        Dim pocetna_godina As Integer = 2023

        Dim trenutna_godina As Integer = CInt(DateTime.Now.Year)

        For i As Integer = pocetna_godina To trenutna_godina
            Dim listItem As New ListItem

            listItem.Value = i
            listItem.Text = i

            DropDownListGodine.Items.Add(listItem)
        Next

    End Sub

    Protected Sub btnPretrazi_Click(sender As Object, e As EventArgs) Handles btnPretrazi.Click
        GridViewPromatranja.DataBind()
        PanelPromatranja.Visible = True
    End Sub

    Protected Sub btnNovoProm_Click(sender As Object, e As EventArgs) Handles btnNovoPromatranje.Click
        mdlPopupEdit.Show()
        OcistiFormuEdit()

        btnSpremiNovoPromatranje.Visible = True
    End Sub

    Private Sub OcistiFormuEdit()
        slike_naziv.Clear()
        slike_path.Clear()

        DropDownListLokacijaEdit.SelectedValue = -1
        DropDownListPovecanjeEdit.SelectedValue = -1
        DropDownListSvjetlinaEdit.SelectedValue = -1
        DropDownListSlikaKvalitetaEdit.SelectedValue = -1
        DropDownListObjektiEdit.SelectedValue = -1
        txtDatumEdit.Text = ""
        txtOpisEdit.Text = ""
        DropDownListInstrumentiEdit.SelectedValue = -1
        DropDownListPromatranjeTipEdit.SelectedValue = -1
        DropDownListObjektVrstaEdit.SelectedValue = -1
    End Sub

    Protected Sub btnZatvorimpeSelected_Click(sender As Object, e As System.EventArgs)
        mdlPopupEdit.Hide()
    End Sub

    Protected Sub btnSpremiNovoPromatranje_Click(sender As Object, e As EventArgs) Handles btnSpremiNovoPromatranje.Click

        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspPromatranje_INS]", cn)
                    cmd.CommandType = CommandType.StoredProcedure


                    cmd.Parameters.AddWithValue("@instrument_id", DropDownListInstrumentiEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@povecanje_id", DropDownListPovecanjeEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@lokacija_id", DropDownListLokacijaEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@promatranje_tip_id", DropDownListInstrumentiEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@svjetlina_id", DropDownListSvjetlinaEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@slika_kvaliteta_id", DropDownListSlikaKvalitetaEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@objekt_id", DropDownListObjektiEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@objekt_vrsta_id", DropDownListObjektVrstaEdit.SelectedValue)
                    cmd.Parameters.AddWithValue("@datum", DateTime.Parse(txtDatumEdit.Text))
                    cmd.Parameters.AddWithValue("@ucr", Session("user_id"))

                    If txtOpisEdit.Text.Trim <> "" Then
                        cmd.Parameters.AddWithValue("@opis", txtOpisEdit.Text)
                    Else
                        cmd.Parameters.AddWithValue("@opis", DBNull.Value)
                    End If

                    Dim promatranje_id = cmd.ExecuteScalar()

                    For i = 0 To slike_naziv.Count - 1 Step 1
                        Dim slika_id As Integer = SpremiSliku(slike_naziv(i), slike_path(i))
                        SpremiSlikaPromatranje(promatranje_id, slika_id)
                    Next

                    mdlPopupEdit.Hide()
                    GridViewPromatranja.DataBind()
                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub
    Private Function SpremiSliku(naziv As String, path As String) As Integer
        Dim slika_id As Integer = 0

        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspSlika_INS]", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@naziv", naziv)
                    cmd.Parameters.AddWithValue("@path", path)
                    cmd.Parameters.AddWithValue("@ucr", Session("user_id"))

                    slika_id = Convert.ToInt32(cmd.ExecuteScalar())

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
        Return slika_id
    End Function

    Private Sub SpremiSlikaPromatranje(promatranje_id As Integer, slika_id As Integer)

        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspSlikaPromatranje_INS]", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@promatranje_id", promatranje_id)
                    cmd.Parameters.AddWithValue("@slika_id", slika_id)
                    cmd.Parameters.AddWithValue("@ucr", Session("user_id"))

                    cmd.ExecuteNonQuery()

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try
    End Sub

    Protected Sub GridViewPromatranja_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridViewPromatranja.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim promatranje_id As Integer = e.Row.DataItem("promatranje_id").ToString

            CType(e.Row.FindControl("ibtnSlika"), ImageButton).CommandArgument = CType(e.Row.DataItem, Data.DataRowView).Row("promatranje_id").ToString()

            If Not ImaSliku(promatranje_id) Then
                e.Row.Cells.Item(0).Text = ""
                e.Row.Cells.Item(0).Enabled = False
            End If

        End If

    End Sub

    Protected Sub GridViewPromatranja_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridViewPromatranja.RowCommand
        Dim argumenti = e.CommandArgument.ToString
        Dim argumentiList = argumenti.Split(";")
        Dim slike As New ArrayList

        If e.CommandName = "PrikaziSlika" Then
            Dim promatranje_id = argumentiList(0)
            ses_promatranje_id = promatranje_id

            slike = DohvatiSlikePromatranje(promatranje_id)

            slika_index = 0

            imgSlika.ImageUrl = DohvatiPathSlike(slike(0))
            imgSlika.Visible = True
            imgNext.Visible = True
            imgPrevious.Visible = False
            SlikaPrikaz.Visible = True
            mdlPopupSlika.Show()
        End If
        GridViewPromatranja.DataBind()
    End Sub

    Protected Sub imgNext_Click(sender As Object, e As EventArgs) Handles imgNext.Click
        Dim slike As New ArrayList
        slike = DohvatiSlikePromatranje(ses_promatranje_id)

        slika_index += 1

        If slika_index >= 0 Then
            imgPrevious.Visible = True
        Else
            imgPrevious.Visible = False
        End If

        If slika_index = slike.Count - 1 Then
            imgNext.Visible = False
        End If

        imgSlika.ImageUrl = DohvatiPathSlike(slike(slika_index))
        GridViewPromatranja.DataBind()
    End Sub
    Protected Sub btnZatvoriSliku_Click(sender As Object, e As EventArgs) Handles btnZatvoriSliku.Click
        mdlPopupSlika.Hide()
    End Sub

    Protected Sub btnZatvoriSlikaSelected_Click(sender As Object, e As System.EventArgs)
        mdlPopupSlika.Hide()
    End Sub
    Protected Sub imgPrevious_Click(sender As Object, e As EventArgs) Handles imgPrevious.Click
        Dim slike As New ArrayList
        slike = DohvatiSlikePromatranje(ses_promatranje_id)

        slika_index -= 1

        If slika_index = 0 Then
            imgPrevious.Visible = False
        Else
            imgNext.Visible = True
        End If

        If slika_index = slike.Count - 1 Then
            imgNext.Visible = False
        End If

        imgSlika.ImageUrl = DohvatiPathSlike(slike(slika_index))
        GridViewPromatranja.DataBind()
    End Sub

    Private Function DohvatiSlikePromatranje(promatranje_id As Integer) As ArrayList
        Dim slike As New ArrayList

        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspSlikaPromatranje_GET]", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@promatranje_id", promatranje_id)

                    Dim sqlReader As SqlDataReader = cmd.ExecuteReader

                    While sqlReader.Read
                        slike.Add(sqlReader.GetInt32(0))
                    End While

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try

        Return slike
    End Function

    Private Function DohvatiPathSlike(slika_id As Integer) As String
        Dim path As String = ""

        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("[dbo].[uspSlikaPath_GET]", cn)
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@slika_id", slika_id)

                    Dim sqlReader As SqlDataReader = cmd.ExecuteReader

                    While sqlReader.Read
                        path = sqlReader.GetString(0)
                    End While

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try

        Return path
    End Function

    Private Function ImaSliku(promatranje_id As Integer) As Boolean
        Dim ima_sliku As Boolean = False
        Try
            Using cn As SqlConnection = New SqlConnection(ConfigurationManager.ConnectionStrings("AstroSQLConnectionString").ConnectionString)
                cn.Open()

                Using cmd As SqlCommand = New SqlCommand("SELECT * FROM [AstroRepository].[dbo].[tSlika_Promatranje] WHERE Promatranje_id = @promatranje_id AND Datum_do IS NULL; SELECT SCOPE_IDENTITY()", cn)
                    cmd.Parameters.AddWithValue("@promatranje_id", promatranje_id)

                    Dim broj_redaka = cmd.ExecuteScalar()

                    If broj_redaka > 0 Then
                        ima_sliku = True
                    End If

                End Using
            End Using

        Catch ex As Exception
            Console.WriteLine(ex.Message.ToString)
        End Try

        Return ima_sliku
    End Function
End Class
