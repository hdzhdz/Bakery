using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery.Controls.Account
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_goToSupply_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Controls/Account/SuppliersAndIngredients.aspx");
        }

        protected void btnEmployee_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Controls/Account/EmployeeManagement.aspx");
        }
    }
}