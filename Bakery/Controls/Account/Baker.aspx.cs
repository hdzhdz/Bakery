using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery.Controls.Account
{
    public partial class Baker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Recipe_ID"] = 0;
            //for test only, after remove Session employid
           
        }

        protected void fcGetRecipeID (int recipe_ID, string recipe_Name)
        {
            try
            {
                Models.RecipeLayerTableAdapters.GetRecipeNameandIDTableAdapter recipeTableAdapter = new Models.RecipeLayerTableAdapters.GetRecipeNameandIDTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeTableAdapter.GetRecipeNameandID(recipe_ID, recipe_Name).CreateDataReader();
                if (dataTableReader.Read())
                {
                    txtRecipe_ID.Text = dataTableReader["Recipe_ID"].ToString();
                    txtRecipe_Name.Text = dataTableReader["Name"].ToString();
                    lblRecipeWarning.Text = "Recipe is found";
                }
                else
                {
                    lblRecipeWarning.Text = "Recipe is NOT found";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
                lblRecipeWarning.Text = e.ToString();
            }
        }

        protected void fcGetRecipeDeatail (int recipe_ID)
        {
            try
            {
                Models.RecipeLayerTableAdapters.GetRecipeInstructionForBakerByIDTableAdapter recipeTableAdapter = new Models.RecipeLayerTableAdapters.GetRecipeInstructionForBakerByIDTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeTableAdapter.GetInstructionForBaker(recipe_ID).CreateDataReader();
                if (dataTableReader.Read())
                {
                    txtInstruction.Text = dataTableReader["Instruction"].ToString();
                    Session["Recipe_ID"] = int.Parse(txtRecipe_ID.Text);
                    GridViewIngredient.DataBind();
                    lblRecipeWarning.Text = "Recipe is found";
                }
                else
                {
                    lblRecipeWarning.Text = "Recipe is NOT found";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void fcAddCookies (int Item_ID, string Name, int Employee_ID, int Recipe_ID, int Amount, decimal Rating, decimal price)
        {
            try
            {
                Models.ItemLayerTableAdapters.BakerItemsTableAdapter bakerItemsTableAdapter = new Models.ItemLayerTableAdapters.BakerItemsTableAdapter();
                System.Data.DataTableReader dataTableReader = bakerItemsTableAdapter.BakerItemAdding(Item_ID, Name, Employee_ID, Recipe_ID, Amount, Rating, price).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblAddedCookies.Text = "Cookies is ADDED";
                }
                else
                {
                    lblAddedCookies.Text = "Cookies is NOT added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        

        protected void btnLookUpRecipe_Click(object sender, EventArgs e)
        {
            fcGetRecipeID(int.Parse(txtRecipe_ID.Text), txtRecipe_Name.Text);
        }

        protected void btnGetRecipeDetail_Click(object sender, EventArgs e)
        {
            fcGetRecipeDeatail(int.Parse(txtRecipe_ID.Text));
        }

        protected void btnCookiesAdded_Click(object sender, EventArgs e)
        {
            fcAddCookies(0, txtRecipe_Name.Text, int.Parse(Session["Employee_ID"].ToString()), int.Parse(txtRecipe_ID.Text), int.Parse(txtCookiesBaked.Text), Convert.ToDecimal(0.00), Convert.ToDecimal(txtPrice.Text));
        }

        protected void cboRecipe_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtRecipe_ID.Text = cboRecipe.SelectedValue.ToString().Trim();
            txtRecipe_Name.Text = cboRecipe.SelectedItem.Text.Trim();
            
        }
    }
}