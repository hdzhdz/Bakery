using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Bakery.Controls.Account
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string strConnectionString; // = ConfigurationManager.ConnectionStrings["ProjectBakeryConnectionString"].ConnectionString;
        SqlConnection SqlCon; // = new SqlConnection(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            // Employee_ID as login
            // TODO: when log in, new orderID, when checkout, new again
            //Session["Order_ID"] = 1;
            strConnectionString = ConfigurationManager.ConnectionStrings["Bakery.Properties.Settings.ProjectBakeryConnectionString"].ConnectionString;
            SqlCon = new SqlConnection();
        }
        protected void fcAddCustomer (int x, string FirstName, string LastName, string Address, string Zip, string Phone, string email)
        {
            try
            {
                
                Models.CustomerLayerTableAdapters.CustomerAdapter updateCustomerTableAdapter = new Models.CustomerLayerTableAdapters.CustomerAdapter();
                System.Data.DataTableReader dataTableReader = updateCustomerTableAdapter.AddCustomer(x, FirstName, LastName, Address, Zip, Phone, email).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblWarning.Text = "Customer is Added";
                }
                else
                {
                    lblWarning.Text = "Customer is not added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            fcAddCustomer(0, txtFirstName.Text, txtLastName.Text, txtAddress.Text, txtZip.Text, txtPhone.Text, txtEmail.Text);

        }

        protected void fcAddOrder (int Customer_ID, int Employee_ID)
        {
            Models.OrderLayersTableAdapters.OrderAdapter orderAdapter = new Models.OrderLayersTableAdapters.OrderAdapter();
            Session["Order_ID"] = orderAdapter.AddOrder(Customer_ID, Employee_ID);
            //lblCon.Text = ((int) Session["Order_ID"]).ToString();
        }

        protected void fcAddOrderDetail (int Order_ID)
        {
            Models.OrderLayersTableAdapters.OrderDetailAdapter orderDetailAdapter = new Models.OrderLayersTableAdapters.OrderDetailAdapter();
            orderDetailAdapter.AddOrderDetail(Order_ID);
        }

        protected void fcLookUpCustomer(string FirstName, string LastName)
        {
            try
            {
                Models.CustomerLayerTableAdapters.CustomerAdapter updateCustomerTableAdapter = new Models.CustomerLayerTableAdapters.CustomerAdapter();
                System.Data.DataTableReader dataTableReader = updateCustomerTableAdapter.Customer(FirstName, LastName).CreateDataReader();


                if (dataTableReader.Read())
                {
                    lblWarning.Text = "Customer is existed" ;
                    txtCustomerID.Text = dataTableReader[0].ToString();
                }
                else
                {
                    lblWarning.Text = "Customer is NOT existed";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void btnLookUp_Click(object sender, EventArgs e)
        {
            fcLookUpCustomer(txtFirstName.Text, txtLastName.Text);
        }

        protected void btnUpdateCustomer_Click(object sender, EventArgs e)
        {
            fcAddCustomer(int.Parse(txtCustomerID.Text), txtFirstName.Text, txtLastName.Text, txtAddress.Text, txtZip.Text, txtPhone.Text, txtEmail.Text);
        }

        protected void fcCheckOut (int Order_ID, int Customer_ID, int Employee_ID)
        {
            Models.OrderLayersTableAdapters.OrderAdapter orderAdapter = new Models.OrderLayersTableAdapters.OrderAdapter();
            orderAdapter.CheckOut(Order_ID, Customer_ID, Employee_ID);
            lblTotal.Text = "$"+orderAdapter.GetTotal(Order_ID).ToString();
            GridViewItems.DataBind();
        }

        protected void btn_Total_Click(object sender, EventArgs e)
        {
            fcCheckOut((int)Session["Order_ID"], Int32.Parse(txtCustomerID.Text),(int)Session["Employee_ID"]);
        }

        protected void btnCreateOrderandOrderDetail_Click(object sender, EventArgs e)
        {
            fcAddOrder(Int32.Parse(txtCustomerID.Text), (int)Session["Employee_ID"]);
            fcAddOrderDetail((int)Session["Order_ID"]);
            lblCon.Text = ((int)Session["Order_ID"]).ToString();
        }
    }
}