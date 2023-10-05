<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="Promatranja.aspx.vb" Inherits="Promatranja_Promatranja" Title="Promatranja" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script type="text/javascript">

        function uploadstart() {
            alert("Datoteka se učitava, molimo pričekajte!");
        }

        function performDelete(button) {
            __doPostBack(button.name, '')
        }

        function confirmDelete(button, action) {
            var alert = alertify.confirm('<span style="color:black;">Potvrda akcije</span>', '<span style="color:red;">Jeste li sigurni?</span>', function (e) {
                if (e) {
                    if (action) {
                        action(button);
                    }
                }
            }, function () { });
            alert.set('asp:labels', { ok: '<%= Resources.MainResource.btnOk %>', cancel: '<%= Resources.MainResource.BtnOdustani %>' });
        }


        $(document).ready(function () {
            AjaxFileUpload_change_text();

        });



        function AjaxFileUpload_change_text() {

            //Here you can edit whatever you want = "..."

            $(".ajax__fileupload_selectFileButton").text("Odaberi datoteku");
            $(".ajax__fileupload_dropzone").text("Prebaci datoteku ovdje");
            $(".ajax__fileupload_uploadbutton").text("Učitaj");

            document.getElementById("ctl00_ContentPlaceHolder1_AjaxFileUpload1_FileStatusContainer").innerHTML = "Molim odaberite datoteku.";

            Sys.Extended.UI.Resources.AjaxFileUpload_SelectFile = "Odaberi datoteku";
            Sys.Extended.UI.Resources.AjaxFileUpload_DropFiles = "Prebaci datoteku ovdje";
            Sys.Extended.UI.Resources.AjaxFileUpload_Pending = "Čekanje";
            Sys.Extended.UI.Resources.AjaxFileUpload_Remove = "Ukloni";
            Sys.Extended.UI.Resources.AjaxFileUpload_Upload = "Učitaj";
            Sys.Extended.UI.Resources.AjaxFileUpload_Uploaded = "Učitano";
            Sys.Extended.UI.Resources.AjaxFileUpload_UploadedPercentage = "Učitano {0} %";
            Sys.Extended.UI.Resources.AjaxFileUpload_Uploading = "Učitavanje";
            Sys.Extended.UI.Resources.AjaxFileUpload_FileInQueue = "{0} datoteka na čekanju.";
            Sys.Extended.UI.Resources.AjaxFileUpload_AllFilesUploaded = "Sve datoteke učitane.";
            Sys.Extended.UI.Resources.AjaxFileUpload_FileList = "Lista učitanih datoteka:";
            Sys.Extended.UI.Resources.AjaxFileUpload_SelectFileToUpload = "Molim odaberite datoteku za učitavanje.";
            Sys.Extended.UI.Resources.AjaxFileUpload_Cancelling = "Poništavanje...";
            Sys.Extended.UI.Resources.AjaxFileUpload_UploadError = "Pojavila se greška kod učitavanja.";
            Sys.Extended.UI.Resources.AjaxFileUpload_CancellingUpload = "Poništavanje učitavanja...";
            Sys.Extended.UI.Resources.AjaxFileUpload_UploadingInputFile = "Učitavanje datoteke: {0}.";
            Sys.Extended.UI.Resources.AjaxFileUpload_Cancel = "Poništi";
            Sys.Extended.UI.Resources.AjaxFileUpload_Canceled = "Poništeno";
            Sys.Extended.UI.Resources.AjaxFileUpload_UploadCanceled = "Učitavanje datoteke poništeno";
            Sys.Extended.UI.Resources.AjaxFileUpload_DefaultError = "Greška kod učitavanja";
            Sys.Extended.UI.Resources.AjaxFileUpload_UploadingHtml5File = "Učitavanje datoteke: {0} veličina {1} bajtova.";
            Sys.Extended.UI.Resources.AjaxFileUpload_error = "Greška";

        }


    </script>
    &nbsp;
    
    <table width="85%" align="center">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <br />
                        <asp:Panel ID="PanelPromatranjePretraga" runat="server" Width="100%"
                            GroupingText="">
                            <div class="form-group">
                                <div class="form-row align-items-center">
                                    <div class="col-auto">
                                        <asp:Label for="DropDownListLokacije" runat="server">Lokacija:</asp:Label>
                                        <asp:DropDownList ID="DropDownListLokacije" runat="server" Width="150px" class="form-control">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-auto">
                                        <asp:Label for="DropDownListInstrumenti" runat="server">Instrument:</asp:Label>
                                        <asp:DropDownList ID="DropDownListInstrumenti" runat="server" Width="300px" class="form-control">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-auto">
                                        <asp:Label for="DropDownListObjekti" runat="server">Objekt:</asp:Label>
                                        <asp:DropDownList ID="DropDownListObjekti" runat="server" Width="150px" class="form-control">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-auto">
                                        <asp:Label for="DropDownListMjeseci" runat="server">Mjesec:</asp:Label>
                                        <asp:DropDownList ID="DropDownListMjeseci" runat="server" Width="250px" class="form-control">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                            <asp:ListItem Text="1. Mjesec" Value="1"></asp:ListItem>
                                            <asp:ListItem Text="2. Mjesec" Value="2"></asp:ListItem>
                                            <asp:ListItem Text="3. Mjesec" Value="3"></asp:ListItem>
                                            <asp:ListItem Text="4. Mjesec" Value="4"></asp:ListItem>
                                            <asp:ListItem Text="5. Mjesec" Value="5"></asp:ListItem>
                                            <asp:ListItem Text="6. Mjesec" Value="6"></asp:ListItem>
                                            <asp:ListItem Text="7. Mjesec" Value="7"></asp:ListItem>
                                            <asp:ListItem Text="8. Mjesec" Value="8"></asp:ListItem>
                                            <asp:ListItem Text="9. Mjesec" Value="9"></asp:ListItem>
                                            <asp:ListItem Text="10. Mjesec" Value="10"></asp:ListItem>
                                            <asp:ListItem Text="11. Mjesec" Value="11"></asp:ListItem>
                                            <asp:ListItem Text="12. Mjesec" Value="12"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-auto">
                                        <asp:Label for="DropDownListGodine" runat="server">Godina:</asp:Label>
                                        <asp:DropDownList ID="DropDownListGodine" runat="server" Width="150px" class="form-control">
                                            <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-auto align-bottom">
                                        <asp:Label for="btnPretrazi" runat="server">&nbsp;</asp:Label>
                                        <asp:Button ID="btnPretrazi" Text="Pretraži" runat="server" class="form-control btn btn-primary" />
                                    </div>

                                    <div class="col-auto align-bottom">
                                        <asp:Label for="btnPretrazi" runat="server">&nbsp;</asp:Label>
                                        <asp:Button ID="btnNovoPromatranje" Text="Novo promatranje" runat="server" class="form-control btn btn-primary" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <br />
                        <asp:Panel ID="PanelPromatranja" runat="server" GroupingText=""
                            Width="100%" Visible="false">
                            <div class="panel">
                                &nbsp;Rezultat pretrage     
                            </div>
                            &nbsp;<asp:GridView ID="GridViewPromatranja" runat="server" DataSourceID="SqlDataSourcePromatranja"
                                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" GridLines="None"
                                EmptyDataText="Nema podataka!"
                                PageSize="10" Width="100%" CssClass="gridview" DataKeyNames="promatranje_id">
                                <FooterStyle CssClass="footer" />
                                <AlternatingRowStyle CssClass="altrow" />
                                <HeaderStyle />
                                <PagerStyle />
                                <RowStyle CssClass="row1" HorizontalAlign="Left" />
                                <SelectedRowStyle />
                                <EmptyDataRowStyle ForeColor="#284E98" />
                                <Columns>
                                    <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ibtnSlika" runat="server" CausesValidation="False"
                                                ImageUrl="~/slike/slika2.png" ToolTip="Prikaz slika"
                                                CommandArgument='<%# Bind("promatranje_id")%>' CommandName="PrikaziSlika" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="promatranje_id" HeaderText="Promatranje broj" InsertVisible="False" ReadOnly="True" SortExpression="promatranje_id" />
                                    <asp:BoundField DataField="Objekt" HeaderText="Objekt" SortExpression="Objekt" />
                                    <asp:BoundField DataField="Objekt Vrsta" HeaderText="Objekt Vrsta" SortExpression="Objekt Vrsta" />
                                    <asp:BoundField DataField="Datum" HeaderText="Datum" SortExpression="Datum" />
                                    <asp:BoundField DataField="Instrument" HeaderText="Instrument" SortExpression="Instrument" />
                                    <asp:BoundField DataField="Lokacija" HeaderText="Lokacija" SortExpression="Lokacija" />
                                    <asp:BoundField DataField="Svjetlina" HeaderText="Svjetlina" SortExpression="Svjetlina" />
                                    <asp:BoundField DataField="Povećanje" HeaderText="Povećanje" SortExpression="Povećanje" />
                                    <asp:BoundField DataField="Barlow" HeaderText="Barlow" SortExpression="Barlow" />
                                    <asp:BoundField DataField="Okular" HeaderText="Okular" SortExpression="Okular" />
                                </Columns>
                            </asp:GridView>
                        </asp:Panel>
                        &nbsp;<br />
                        &nbsp;&nbsp;
                        <br />
                        <br />
                        <asp:SqlDataSource ID="SqlDataSourcePromatranja" runat="server"
                            ConnectionString="<%$ ConnectionStrings:AstroSQLConnectionString %>"
                            SelectCommand="[dbo].[uspPromatranje_GET]" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownListLokacije" Name="lokacija_id" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownListInstrumenti" Name="instrument_id" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownListObjekti" Name="objekt_id" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownListMjeseci" Name="month" PropertyName="SelectedValue" Type="Int32" />
                                <asp:ControlParameter ControlID="DropDownListGodine" Name="year" PropertyName="SelectedValue" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
    </table>

    <asp:Button ID="btnShowPopupEdit" runat="server" Style="display: none" />
    <cc1:ModalPopupExtender ID="mdlPopupEdit" runat="server" TargetControlID="btnShowPopupEdit"
        PopupControlID="pnlPopupEdit" CancelControlID="btnCloseEdit" BackgroundCssClass="modalBackground" />
    <asp:Panel ID="pnlPopupEdit" runat="server" Style="display: none" CssClass="modalPopup" BehaviorID="modal1">
        <div id="Div1" runat="server" style="max-height: 850px; overflow: auto;">
            <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                <ContentTemplate>
                    <table height="725px" width="750px" cellpadding="0" cellspacing="0" style="background: #ffffff; border-radius: 5px;">
                        <tr valign="top">
                            <td class="body">
                                <table width="100%" style="padding: 10px; border: none;">
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnCloseEdit" runat="server" Text="Button" Style="display: none" />
                                            <a id="btnClose" class="closeButton" runat="server" onserverclick="btnZatvorimpeSelected_Click"
                                                title="Zatvori"></a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="naslov">&nbsp;<asp:Label ID="lblUrediNaslov" runat="server">Novo promatranje</asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <div class="asp:labelatxt1">
                                                <table width="650px" cellpadding="0" cellspacing="0" style="background: #ffffff;">
                                                    <tr valign="top">
                                                        <td>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td width="100%" height="10px">

                                                                                    <asp:Label ID="labelErrEdit" runat="server" ForeColor="#990000" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table height="180px" cellpadding="8px">
                                                                            <tr>
                                                                                <td width="200px">Lokacija:
                                                                                </td>
                                                                                <td width="530px">
                                                                                    <asp:DropDownList ID="DropDownListLokacijaEdit" runat="server" Width="150px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>

                                                                                <td>Instrument:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListInstrumentiEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Povecanje:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListPovecanjeEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>Tip promatranja:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListPromatranjeTipEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Svjetlina:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListSvjetlinaEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td></td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Slika kvaliteta:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListSlikaKvalitetaEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>Objekt vrsta:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListObjektVrstaEdit" runat="server"
                                                                                        Width="300px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>Objekt:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DropDownListObjektiEdit" runat="server"
                                                                                        Width="150px" class="form-control">
                                                                                        <asp:ListItem Text="" Value="-1"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td></td>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="200px">Datum:
                                                                                </td>
                                                                                <td width="200px">
                                                                                    <asp:TextBox ID="txtDatumEdit" runat="server" class="form-control" Width="150px"></asp:TextBox>
                                                                                    <cc1:CalendarExtender ID="Calendar1" runat="server" TargetControlID="txtDatumEdit" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="200px">Opis:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="txtOpisEdit" runat="server" TextMode="MultiLine" Width="500px" Height="100px" MaxLength="4000" class="form-control"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td width="200px">Slika:</td>
                                                                                <td></td>
                                                                            </tr>

                                                                        </table>
                                                                        <asp:Panel ID="osnPodaci" runat="server" GroupingText="" Width="100%" class="panel panel-default">
                                                                            <div class="panel-heading">
                                                                                &nbsp;Upload datoteke
                                                                            </div>


                                                                            <cc1:AjaxFileUpload ID="AjaxFileUpload1" runat="server" AllowedFileTypes="jpeg,jpg,png" />


                                                                        </asp:Panel>

                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="8px">
                                                                            <tr>
                                                                                <td width="100%">
                                                                                    <br />
                                                                                    <asp:Button ID="btnSpremiPromjene" runat="server" Text="Spremi" Visible="false" class="btn btn-primary" /><asp:Button ID="btnSpremiNovoPromatranje" runat="server" Text="Spremi" Visible="false" class="btn btn-primary" />

                                                                                    &nbsp;&nbsp;
                                                     
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </div>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                    </table>

                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

    </asp:Panel>
    <asp:Button ID="btnShowSlika" runat="server" Style="display: none" />
    <cc1:ModalPopupExtender ID="mdlPopupSlika" runat="server" TargetControlID="btnShowSlika"
        PopupControlID="pnlSlika" CancelControlID="btnCloseSlika" BackgroundCssClass="modalBackgroundSlika" />
    <asp:Panel ID="pnlSlika" runat="server" Style="display: none" BehaviorID="modal1">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                <table width="600px" height="775px" cellpadding="0" cellspacing="0" style="background: #ffffff; border-radius: 5px;">
                    <tr valign="top">
                        <td class="body">
                            <table style="border: none;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="btnCloseSlika" runat="server" Text="Button" Style="display: none" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="naslov">&nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div id="SlikaPrikaz" class="SlikaCenter" runat="server" visible="false">
                                            <asp:ImageButton ID="imgPrevious" CssClass="imgPrevious" runat="server" Visible="false" ImageUrl="/Slike/arrowLeft.png" /><asp:Image ID="imgSlika" runat="server" Visible="false" Width="600px" /><asp:ImageButton ID="imgNext" CssClass="imgNext" runat="server" Visible="false" ImageUrl="/Slike/arrowRight.png" />
                                            <asp:ImageButton ID="btnZatvoriSliku" CssClass="btnZatvoriSliku" runat="server" ImageUrl="/Slike/zatvori2.png" />
                                        </div>
                                    </td>
                                </tr>
                            </table>

                        </td>
                    </tr>
                </table>



            </ContentTemplate>
        </asp:UpdatePanel>
    </asp:Panel>
</asp:Content>
