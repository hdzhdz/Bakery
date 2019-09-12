<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bakery.Controls.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
            float: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td>Login</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>UserName:</td>
                <td>
                    <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" Height="26px" OnClick="btnLogin_Click" />
                </td>
                <td>
                    <asp:Label ID="lblWarning" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
