<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuppliersAndIngredients.aspx.cs" Inherits="Bakery.Controls.Account.SuppliersAndIngredients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 1155px;
            float: left;
        }
        .auto-style2 {
            height: 23px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style4 {
            height: 23px;
            width: 119px;
        }
        .auto-style5 {
            width: 119px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            width: 119px;
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Suppliers:</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style4">Recipe:</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td>Suppliers ID: </td>
                <td>
                    <asp:TextBox ID="txtSupplierID" runat="server">0</asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">Recipe_ID</td>
                <td>
                    <asp:TextBox ID="txtRecipeID" runat="server">0</asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td rowspan="2">Name:</td>
                <td rowspan="2">
                    <asp:TextBox ID="txtSupplierName" runat="server"></asp:TextBox>
                </td>
                <td rowspan="2">&nbsp;</td>
                <td class="auto-style5">Name :</td>
                <td>
                    <asp:TextBox ID="txtRecipeName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="cboRecipeName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRecipe" DataTextField="Name" DataValueField="Recipe_ID" OnSelectedIndexChanged="cboRecipeName_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRecipe" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetRecipe" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Instruction:</td>
                <td>
                    <asp:TextBox ID="txtRecipeInstruction" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Contract:</td>
                <td>
                    <asp:TextBox ID="txtSupplierContract" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="cboSupllier" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceSupplierName" DataTextField="Name" DataValueField="Supplier_ID" Height="16px" OnSelectedIndexChanged="cboContract_SelectedIndexChanged" Width="124px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceSupplierName" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetSupplier" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="auto-style5">Employee ID:</td>
                <td>
                    <asp:TextBox ID="txtRecipeEmployeeID" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="cboRecipeEmployeName" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceEmployee" DataTextField="FirsName" DataValueField="Employee_ID" OnSelectedIndexChanged="cboRecipeEmployeID_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetEmployee" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style5">Cookies per Batch:</td>
                <td>
                    <asp:TextBox ID="txtCookiesPerBatch" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Start Date:</td>
                <td>
                    <asp:Calendar ID="Calendar_Supplier" runat="server"></asp:Calendar>
                </td>
                <td>
                    <asp:Label ID="lblContractDate" runat="server"></asp:Label>
                </td>
                <td class="auto-style5">Date Created:</td>
                <td>
                    <asp:Calendar ID="Calendar_Recipe" runat="server"></asp:Calendar>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Rating</td>
                <td>
                    <asp:TextBox ID="txtSupplierRating" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">Rating:</td>
                <td>
                    <asp:TextBox ID="txtRecipeRating" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_AddSupplier" runat="server" OnClick="btn_AddSupplier_Click" Text="Add" />
                </td>
                <td>
                    <asp:Button ID="btn_LookUpSupplier" runat="server" OnClick="btn_LookUpSupplier_Click" Text="Look Up By Name" />
                </td>
                <td>
                    <asp:Button ID="btn_UpdateSupplier" runat="server" OnClick="btn_UpdateSupplier_Click" Text="Update" />
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnAddRecipe" runat="server" OnClick="btnAddRecipe_Click" Text="Add" />
                </td>
                <td>
                    <asp:Button ID="btnLookUpRecipe" runat="server" OnClick="btnLookUpRecipe_Click" Text="Look Up By Name" />
                </td>
                <td>
                    <asp:Button ID="btnUpdateRecipe" runat="server" OnClick="btnUpdateRecipe_Click" Text="Update" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3">
                    <asp:Label ID="lblSupplierWarning" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" colspan="3">
                    <asp:Label ID="lblRecipeWarning" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>___________</td>
                <td>____________________________</td>
                <td>________________</td>
                <td class="auto-style5">_______________</td>
                <td>__________________________</td>
                <td>_____________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Ingredients:</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2"></td>
                <td class="auto-style4">Recipe&#39;s Detail:</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
            </tr>
            <tr>
                <td>Ingredient ID:</td>
                <td>
                    <asp:TextBox ID="txtIngredientID" runat="server">0</asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&lt;= Choose the ingredient from the left side</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Name: </td>
                <td>
                    <asp:TextBox ID="txtIngredientName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="cboIngredient" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceIngredient" DataTextField="Name" DataValueField="Ingredient_ID" Height="16px" OnSelectedIndexChanged="cboIngredient_SelectedIndexChanged" Width="183px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceIngredient" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetIngredient" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Supplier ID:</td>
                <td>
                    <asp:TextBox ID="txtIngredientSupplierID" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Unit:</td>
                <td>
                    <asp:TextBox ID="txtIngredientUnit" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&lt;= Amount of this Unit:</td>
                <td>
                    <asp:TextBox ID="txtAmountRecipeDetail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:DropDownList ID="cboIngredientsOfRecipe" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceRecipeDetail" DataTextField="Ingredient_ID" DataValueField="Ingredient_ID" OnSelectedIndexChanged="cboIngredientsOfRecipe_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourceRecipeDetail" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetRecipeDetail" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="0" Name="Recipe_ID" SessionField="Recipe_ID" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>Amount:</td>
                <td>
                    <asp:TextBox ID="txtIngredientAmount" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">Cost Per Unit:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtIngredientCostPerUnit" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td>Total Cost:</td>
                <td>
                    <asp:TextBox ID="txtIngredientTotalCost" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Expiration Date:</td>
                <td>
                    <asp:Calendar ID="Calendar_Ingredient" runat="server"></asp:Calendar>
                </td>
                <td>
                    <asp:Label ID="lblExpirationDate" runat="server"></asp:Label>
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Rating:</td>
                <td>
                    <asp:TextBox ID="txtIngredientRating" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btn_AddIngredient" runat="server" OnClick="btn_AddIngredient_Click" Text="Add" />
                </td>
                <td>
                    <asp:Button ID="btn_LookUpIngredient" runat="server" OnClick="btn_LookUpIngredient_Click" Text="Look Up By Name" />
                </td>
                <td>
                    <asp:Button ID="btn_UpdateIngredient" runat="server" OnClick="btn_UpdateIngredient_Click" Text="Update" />
                </td>
                <td class="auto-style5">
                    <asp:Button ID="btnAddRecipeDetail" runat="server" OnClick="btnAddRecipeDetail_Click" Text="Add/Update the Amount of Ingredient" />
                </td>
                <td>
                    <asp:Button ID="btnLookUpIngredientInRecipeDetail" runat="server" OnClick="btnLookUpIngredientInRecipeDetail_Click" Text="Look Up Ingredient In Recipe" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnDeleteRecipeIngredient" runat="server" OnClick="btnDeleteRecipeIngredient_Click1" Text="Delete The Ingredient" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="3">
                    <asp:Label ID="lblIngredientWarning" runat="server"></asp:Label>
                </td>
                <td class="auto-style3" colspan="3">
                    <asp:Label ID="lblRecipeDetailWarning" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
