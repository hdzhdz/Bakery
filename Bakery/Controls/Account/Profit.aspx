<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profit.aspx.cs" Inherits="Bakery.Controls.Account.Profit" %>

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
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Profit by day:</td>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Profit by week:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Profit by Month:</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
