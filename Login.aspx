<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" Title="Astro Repository Login page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
</head>
<body>
    <form runat="server">

        <div class="form-group">
            <table width="20%" align="center" style="margin-top: 130px;">

                <tr>
                    <td align="center">
                        <div style="background-color: aquamarine; border: 1px solid #e2e2e2; padding: 30px 70px 20px 70px; -moz-border-radius: 7px; -webkit-border-radius: 7px; border-radius: 7px; box-shadow: 0 0 5px 3px BLUE;">
                            <table border="0" cellpadding="6">
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUsername" runat="server">Username:</asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtUserNameLogin" runat="server" class="form-control" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblPassword" runat="server">Password:</asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="password" class="form-control" MaxLength="50"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary" />
                                    </td>

                                </tr>

                            </table>
                            <span style="font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: 10px; color: cornflowerblue;">ASTRO REPOSITORY</span>
                        </div>
                        <br />
                        <asp:Label ID="lblLoginError" runat="server" ForeColor="red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
