<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeManagement.aspx.cs" Inherits="Bakery.Controls.Account.EmployeeManagement" %>

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
            width: 231px;
        }
        .auto-style3 {
            width: 53px;
        }
        .auto-style4 {
            width: 53px;
            text-align: justify;
        }
        .auto-style5 {
            text-align: justify;
        }
        .auto-style6 {
            height: 23px;
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
                <td class="auto-style2">Employess:</td>
                <td colspan="3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">______________</td>
                <td colspan="3">
                    <asp:GridView ID="GridViewEmployee" runat="server" AutoGenerateColumns="False" DataKeyNames="Employee_ID" DataSourceID="SqlDataSourceEmployee" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" InsertVisible="False" SortExpression="Employee_ID" />
                            <asp:BoundField DataField="FirsName" HeaderText="FirsName" SortExpression="FirsName" />
                            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                            <asp:BoundField DataField="Account" HeaderText="Account" SortExpression="Account" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                            <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                            <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
                            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                            <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                            <asp:BoundField DataField="Salary" HeaderText="Salary" SortExpression="Salary" />
                            <asp:BoundField DataField="DateJoin" HeaderText="DateJoin" SortExpression="DateJoin" />
                            <asp:BoundField DataField="DateLeft" HeaderText="DateLeft" SortExpression="DateLeft" />
                            <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceEmployee" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetEmployee" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Employee ID:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtEmployeeID" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style5" rowspan="15">
                    <asp:GridView ID="GridViewClerk" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_ID,Order_ID" DataSourceID="SqlDataSourceClerk">
                        <Columns>
                            <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Item_ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" InsertVisible="False" ReadOnly="True" SortExpression="Order_ID" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceClerk" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetProductsSoldBy" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Employee_ID" SessionField="SelectedEmployee" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridViewBaker_Made" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_ID" DataSourceID="SqlDataSourceBaker">
                        <Columns>
                            <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Item_ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Date Made" HeaderText="Date Made" SortExpression="Date Made" />
                            <asp:BoundField DataField="Sold" HeaderText="Sold" ReadOnly="True" SortExpression="Sold" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceBaker" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetProductsMadeBy" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Employee_ID" SessionField="SelectedEmployee" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td class="auto-style5" rowspan="15">
                    <asp:GridView ID="GridViewBaker_Sold" runat="server" AutoGenerateColumns="False" DataKeyNames="Item_ID" DataSourceID="SqlDataSourceBakerSold">
                        <Columns>
                            <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Item_ID" />
                            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                            <asp:BoundField DataField="Sold" HeaderText="Sold" SortExpression="Sold" />
                            <asp:BoundField DataField="Date Sold" HeaderText="Date Sold" SortExpression="Date Sold" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSourceBakerSold" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetProductsMadeByandSold" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Employee_ID" SessionField="SelectedEmployee" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">First Name:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Last Name:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Account:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtAccount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Street:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">City:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Zip:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Phone:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Position:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtPosition" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Salary:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtSalary" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Date Join:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDateJoin" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Date Left</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtDateLeft" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Rating:</td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtRating" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btn_AddEmployee" runat="server" OnClick="btn_AddEmployee_Click" Text="Add Employee" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btn_UpdateEmployee" runat="server" OnClick="btn_UpdateEmployee_Click" Text="Update Employee" />
                </td>
                <td colspan="2">
                    <asp:Button ID="btnDeleteEmployeee" runat="server" OnClick="btnDeleteEmployee_Click" Text="Delete Employeee" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="lblEmployeeWarning" runat="server"></asp:Label>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6" colspan="2"></td>
            </tr>
        </table>
    </form>
</body>
</html>
