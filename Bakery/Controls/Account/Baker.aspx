<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Baker.aspx.cs" Inherits="Bakery.Controls.Account.Baker" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
            float: left;
        }
        .auto-style2 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td>Get Recipe:</td>
                <td>&nbsp;</td>
                <td>_____</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Look Recipe Up by ID</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtRecipe_ID" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:DropDownList ID="cboRecipe" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRecipe" DataTextField="Name" DataValueField="Recipe_ID" OnSelectedIndexChanged="cboRecipe_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRecipe" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetRecipe" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td rowspan="4">
                    <asp:TextBox ID="txtInstruction" runat="server" Height="295px" Width="720px" MaxLength="50" Rows="10" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Look Recipe Up by Name:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtRecipe_Name" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Label ID="lblRecipeWarning" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnLookUpRecipe" runat="server" OnClick="btnLookUpRecipe_Click" Text="Search by Name/ID" />
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnGetRecipeDetail" runat="server" OnClick="btnGetRecipeDetail_Click" Text="Get Detail Instruction" />
                </td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">|<br />
                    |<br />
                    |<br />
                    |</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    <asp:GridView ID="GridViewIngredient" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceIngredientForBaker">
                        <Columns>
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceIngredientForBaker" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetRecipeIngredientForBakerByID" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="recipe_ID" SessionField="Recipe_ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Add Amount Made:</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Cookies Batch Baked:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtCookiesBaked" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Price: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lblAddedCookies" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnCookiesAdded" runat="server" OnClick="btnCookiesAdded_Click" Text="Add" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
