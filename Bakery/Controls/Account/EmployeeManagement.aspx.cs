using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery.Controls.Account
{
    public partial class EmployeeManagement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewEmployee.SelectedRow;
            txtEmployeeID.Text = row.Cells[1].Text;
            txtFirstName.Text = row.Cells[2].Text;
            txtLastName.Text = row.Cells[3].Text;
            txtAccount.Text = row.Cells[4].Text;
            txtPassword.Text = row.Cells[5].Text;
            txtStreet.Text = row.Cells[6].Text;
            txtCity.Text = row.Cells[7].Text;
            txtZip.Text = row.Cells[8].Text;
            txtPhone.Text = row.Cells[9].Text;
            txtEmail.Text = row.Cells[10].Text;
            txtPosition.Text = row.Cells[11].Text;
            txtSalary.Text = row.Cells[12].Text;
            txtDateJoin.Text = row.Cells[13].Text;
            txtDateLeft.Text = row.Cells[14].Text;
            txtRating.Text = row.Cells[15].Text;
            Session["SelectedEmployee"] = int.Parse(txtEmployeeID.Text);
            GridViewBaker_Made.DataBind();

        }

        protected void fcUpdateEmployee(int ID, string firstName, string LastName, string Account, string Password, string city, string Street, string zip, string phone, string email, string pos, decimal salry, DateTime join, DateTime left, Decimal rating )
        {
            
            try
            {
                Models.UserLayerTableAdapters.UserLoginTableAdapter userTableAdapter = new Models.UserLayerTableAdapters.UserLoginTableAdapter();
                System.Data.DataTableReader dataTableReader = userTableAdapter.UpdateUserLogin(ID, firstName, LastName, Account, Password, city, Street, zip, phone, email, pos, salry, join, left, rating).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblEmployeeWarning.Text = "Employee is Added";
                    GridViewEmployee.DataBind();
                }
                else
                {
                    lblEmployeeWarning.Text = "Employee is not added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void fcDeleteEmployee (int id)
        {

            try
            {
                Models.UserLayerTableAdapters.UserLoginTableAdapter userTableAdapter = new Models.UserLayerTableAdapters.UserLoginTableAdapter();
                System.Data.DataTableReader dataTableReader = userTableAdapter.DeleteAnEmployee(id).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblEmployeeWarning.Text = "Employee is NOT Deleted";
                }
                else
                {
                    lblEmployeeWarning.Text = "Employee is Deleted";
                    GridViewEmployee.DataBind();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void btn_AddEmployee_Click(object sender, EventArgs e)
        {
            fcUpdateEmployee(0, txtFirstName.Text, txtLastName.Text, txtAccount.Text, txtPassword.Text, txtCity.Text, txtStreet.Text, txtZip.Text, txtPhone.Text, txtEmail.Text, txtPosition.Text, Convert.ToDecimal(txtSalary.Text), Convert.ToDateTime(txtDateJoin), Convert.ToDateTime(txtDateLeft), Convert.ToDecimal(txtRating.Text));
        }

        protected void btn_UpdateEmployee_Click(object sender, EventArgs e)
        {
            fcUpdateEmployee(int.Parse(txtEmployeeID.Text), txtFirstName.Text, txtLastName.Text, txtAccount.Text, txtPassword.Text, txtCity.Text, txtStreet.Text, txtZip.Text, txtPhone.Text, txtEmail.Text, txtPosition.Text, Convert.ToDecimal(txtSalary.Text), Convert.ToDateTime(txtDateJoin), Convert.ToDateTime(txtDateLeft), Convert.ToDecimal(txtRating.Text));
        }

        protected void btnDeleteEmployee_Click(object sender, EventArgs e)
        {
            fcDeleteEmployee(int.Parse(txtEmployeeID.Text));
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Controls/Account/Admin.aspx");
        }
    }
}