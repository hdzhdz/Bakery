using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery.Controls
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        private void fcUserLogin(string strUserName, string strPassword)
        {
            try
            {
                Models.UserLayerTableAdapters.UserLoginTableAdapter loginTableAdapter = new Models.UserLayerTableAdapters.UserLoginTableAdapter();
                System.Data.DataTableReader dataTableReader = loginTableAdapter.GetDataLogin(strUserName, strPassword).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblWarning.Text = "Login is OK";
                    // Admin, Baker and Clerk
                    Session["Employee_ID"] = (int)dataTableReader["Employee_ID"];
                    if (dataTableReader["Position"].ToString().Equals("Clerk"))
                    {
                        Response.Redirect("~/Controls/Account/Customers/Customers.aspx");
                    }
                    if (dataTableReader["Position"].ToString().Equals("Baker"))
                    {
                        Response.Redirect("~/Controls/Account/Baker.aspx");
                    }
                    if (dataTableReader["Position"].ToString().Equals("Admin"))
                    {
                        Response.Redirect("~/Controls/Account/Admin.aspx");
                    }
                }
                else
                {
                    txtPassword.Text = "";
                    lblWarning.Text = "Login is not OK";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            fcUserLogin(txtUserName.Text, txtPassword.Text);
            System.Diagnostics.Debug.WriteLine(txtUserName);
        }
    }
}