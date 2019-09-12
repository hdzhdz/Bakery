<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Bakery.Controls.Account.WebForm1" %>

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
            text-align: left;
            height: 30px;
        }
        .auto-style3 {
            height: 30px;
        }
        .auto-style4 {
            width: 4px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <table class="auto-style1">
            <tr>
                <td colspan="2">
        <table class="auto-style1">
            <tr>
                <td>Add New Customer:</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Customer ID:</td>
                <td>
                    <asp:TextBox ID="txtCustomerID" runat="server">0</asp:TextBox>
                </td>
                <td colspan="2">
                    Leave 0 if add new!!!</td>
            </tr>
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Zip:</td>
                <td>
                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" style="height: 26px" Text="Add" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnLookUp" runat="server" OnClick="btnLookUp_Click" Text="Look Up" />
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btnUpdateCustomer" runat="server" OnClick="btnUpdateCustomer_Click" Text="Update" />
                </td>
                <td class="auto-style3">
                    <asp:Label ID="lblWarning" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td class="auto-style4" colspan="2">
                    <table class="auto-style1">
                        <tr>
                            <td>&nbsp;</td>
                            <td>Items</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td>
                                <asp:GridView ID="GridViewItems" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Item_ID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField HeaderText="Item_ID" DataField="Item_ID" InsertVisible="False" ReadOnly="True" SortExpression="Item_ID" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" SortExpression="Name" />
                                        <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                                        <asp:BoundField DataField="Baker" HeaderText="Baker" ReadOnly="True" SortExpression="Baker" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetItems" SelectCommandType="StoredProcedure" UpdateCommand="sp_AddOrderDetail" UpdateCommandType="StoredProcedure">
                                    <UpdateParameters>
                                        <asp:Parameter Name="Order_ID" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                    <asp:Label ID="lblCon" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridViewOrderDetail" runat="server" AutoGenerateColumns="False" DataSourceID="OrderDetail">
                        <Columns>
                            <asp:BoundField DataField="Order_ID" HeaderText="Order_ID" SortExpression="Order_ID" />
                            <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" SortExpression="Item_ID" />
                            <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                            <asp:CommandField ShowEditButton="True" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="OrderDetail" runat="server" ConnectionString="<%$ ConnectionStrings:Bakery.Properties.Settings.ProjectBakeryConnectionString %>" SelectCommand="sp_GetOrderDetail" SelectCommandType="StoredProcedure" UpdateCommand="sp_UpdateOrderDetail" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1" Name="Order_ID" SessionField="Order_ID" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Order_ID" Type="Int32" />
                            <asp:Parameter Name="Item_ID" Type="Int32" />
                            <asp:Parameter Name="Amount" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:Button ID="btnCreateOrderandOrderDetail" runat="server" OnClick="btnCreateOrderandOrderDetail_Click" Text="Create Orders" />
                </td>
                <td class="auto-style4">
                                <asp:Button ID="btn_CheckOut" runat="server" OnClick="btn_Total_Click" Text="Check Out" />
                            </td>
                <td class="auto-style4">
                    <asp:Label ID="lblTotal" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
