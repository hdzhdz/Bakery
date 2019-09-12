<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Bakery.Controls.Account.Admin" %>

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
                <td>
                    <asp:Button ID="btn_goToSupply" runat="server" OnClick="btn_goToSupply_Click" Text="Supply, Ingredient and Recipe" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnEmployee" runat="server" OnClick="btnEmployee_Click" Text="Employee Management" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnProfit" runat="server" Text="Profits" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
