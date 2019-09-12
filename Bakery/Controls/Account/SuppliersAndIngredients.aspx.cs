using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bakery.Controls.Account
{
    public partial class SuppliersAndIngredients : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Recipe_ID"] = txtRecipeID.Text;
        }

        protected void fcAddSupplier(int x, string Name, string Contract, DateTime date , Decimal rating)
        {
            try
            {
                Models.SupplierLayersTableAdapters.SuppliersTableAdapter suppliersTableAdapter = new Models.SupplierLayersTableAdapters.SuppliersTableAdapter();
                System.Data.DataTableReader dataTableReader = suppliersTableAdapter.UpdateSupplier(x, Name, Contract, date, rating).CreateDataReader();
                lblSupplierWarning.Text = Calendar_Supplier.SelectedDate.ToString();
                if (dataTableReader.Read())
                {
                    lblSupplierWarning.Text = "Supplier is Added";
                    cboSupllier.DataBind();
                }
                else
                {
                    lblSupplierWarning.Text = "Supplier is not added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }




        protected void fcLookUpSuplier(string Name)
        {
            try
            {
                Models.SupplierLayersTableAdapters.SuppliersTableAdapter suppliersTableAdapter = new Models.SupplierLayersTableAdapters.SuppliersTableAdapter();
                System.Data.DataTableReader dataTableReader = suppliersTableAdapter.SearchSupplier(Name).CreateDataReader();


                if (dataTableReader.Read())
                {
                    lblSupplierWarning.Text = "Supplier is existed";
                    txtSupplierID.Text = dataTableReader[0].ToString();
                }
                else
                {
                    lblSupplierWarning.Text = "Supplier is NOT existed";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void fcAddIngredient(int x, string Name, int SupplierID, string Unit, int Amount, decimal CostPerUnit, decimal totalCost, DateTime ExppirationDate, decimal Rating)
        {
            try
            {
                Models.IngredientLayersTableAdapters.IngredientTableAdapter ingredientTableAdapter = new Models.IngredientLayersTableAdapters.IngredientTableAdapter();
                System.Data.DataTableReader dataTableReader = ingredientTableAdapter.UpdateIngredient(x, SupplierID, Unit, Amount, CostPerUnit, totalCost, ExppirationDate, Rating, Name).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblIngredientWarning.Text = "Ingredient is Added";
                    cboIngredient.DataBind();
                }
                else
                {
                    lblSupplierWarning.Text = "Ingredient is not added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void fcLookUpIngredient(string Name)
        {
            try
            {
                Models.IngredientLayersTableAdapters.IngredientTableAdapter ingredientTableAdapter = new Models.IngredientLayersTableAdapters.IngredientTableAdapter();
                System.Data.DataTableReader dataTableReader = ingredientTableAdapter.SearchIngredientByName(Name).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblIngredientWarning.Text = "Ingredient is existed";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                }
                else
                {
                    lblSupplierWarning.Text = "Ingredient is NOT existed";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void fcLookUpIngredientByID(int ID)
        {
            try
            {
                Models.IngredientLayersTableAdapters.IngredientTableAdapter ingredientTableAdapter = new Models.IngredientLayersTableAdapters.IngredientTableAdapter();
                System.Data.DataTableReader dataTableReader = ingredientTableAdapter.SearchIngredientByID(ID).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblIngredientWarning.Text = "Ingredient is existed";
                    txtIngredientID.Text = dataTableReader["Ingredient_ID"].ToString();
                    txtIngredientName.Text = dataTableReader["Name"].ToString();
                    txtIngredientSupplierID.Text = dataTableReader["Supplier_ID"].ToString();
                    txtIngredientUnit.Text = dataTableReader["Unit"].ToString();
                    txtIngredientAmount.Text = dataTableReader["Amount"].ToString();
                    txtIngredientCostPerUnit.Text = dataTableReader["CostperUnit"].ToString();
                    lblExpirationDate.Text = ((DateTime)dataTableReader["ExpirationDate"]).ToString("dd-MM-yyyy");
                    txtIngredientTotalCost.Text = dataTableReader["TotalCost"].ToString();
                    txtIngredientRating.Text = dataTableReader["Rating"].ToString();
                }
                else
                {
                    lblSupplierWarning.Text = "Ingredient is NOT existed";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void fcAddRecipe(int Recipe_ID, int Employee_ID, string Name, string Instruction, decimal Rating, int amount)
        {
            try
            {
                Models.RecipeLayerTableAdapters.RecipeTableAdapter recipeTableAdapter = new Models.RecipeLayerTableAdapters.RecipeTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeTableAdapter.UpdateRecipe(Recipe_ID, Employee_ID, Name, Instruction, amount, Rating).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblRecipeWarning.Text = "Recipe is Added";
                    cboRecipeName.DataBind();
                    Session["Recipe_ID"] = Convert.ToInt32(dataTableReader[0].ToString());
                }
                else
                {
                    lblRecipeWarning.Text = "Recipe is not added";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void fcLookUpRecipe(string Name)
        {
            try
            {
                Models.RecipeLayerTableAdapters.RecipeTableAdapter recipeTableAdapter = new Models.RecipeLayerTableAdapters.RecipeTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeTableAdapter.SearchRecipeByName(Name).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblRecipeWarning.Text = "Recipe is existed";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                }
                else
                {
                    lblRecipeWarning.Text = "Recipe is NOT existed";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void fcAddRecipeDetail(int Recipe_ID, int Ingredient_ID, int Amount)
        {
            try
            {
                Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter recipeDetailTableAdapter = new Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeDetailTableAdapter.UpdateRecipeDetail(Recipe_ID, Ingredient_ID, Amount).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblRecipeDetailWarning.Text = "Ingredient is Added to the Recipe";
                    cboIngredientsOfRecipe.DataBind();
                }
                else
                {
                    lblRecipeDetailWarning.Text = "Ingredient is NOT Added to the Recipe";
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }
        protected void fcLookUpRecipeDetail(int Recipe_ID, int Ingredient_ID)
        {
            try
            {
                lblRecipeDetailWarning.Text = "Start";

                Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter recipeDetailTableAdapter = new Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter();
                lblRecipeDetailWarning.Text = "Mid";
                System.Data.DataTableReader dataTableReader = recipeDetailTableAdapter.SearchIngredientInRecipe(Recipe_ID, Ingredient_ID).CreateDataReader();
                lblRecipeDetailWarning.Text = "Dont";

                if (dataTableReader.Read())
                {
                    lblRecipeDetailWarning.Text = "Ingredient is existed in the Recipe";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                    fcLookUpIngredientByID(Ingredient_ID);
                }
                else
                {
                    lblRecipeDetailWarning.Text = "Ingredient is NOT existed in the Recipe";
                }
            }
            catch (Exception ex)
            {
                lblRecipeWarning.Text = ex.ToString();
                Console.WriteLine("Login Error: " + ex.ToString());
            }
        }

        protected void fcDeleteRecipeDetail(int Recipe_ID, int Ingredient_ID)
        {
            try
            {
                Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter recipeDetailTableAdapter = new Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeDetailTableAdapter.DeleteARecipeDetails(Recipe_ID, Ingredient_ID).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblRecipeDetailWarning.Text = "Ingredient is NOT Deleted in the Recipe";
                }
                else
                {
                    lblRecipeDetailWarning.Text = "Ingredient is Deleted from the Recipe";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                    cboIngredientsOfRecipe.DataBind();
                }
            }
            catch (Exception e)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void btn_AddSupplier_Click(object sender, EventArgs e)
        {
            fcAddSupplier(0, txtSupplierName.Text, txtSupplierContract.Text, Calendar_Supplier.SelectedDate, Convert.ToDecimal(txtSupplierRating.Text));
        }

        protected void btn_UpdateSupplier_Click(object sender, EventArgs e)
        {
            fcAddSupplier(Convert.ToInt32(txtSupplierID.Text), txtSupplierName.Text, txtSupplierContract.Text, Calendar_Supplier.SelectedDate, Convert.ToDecimal(txtSupplierRating.Text));

        }

        protected void btn_LookUpSupplier_Click(object sender, EventArgs e)
        {
            fcLookUpSuplier(txtSupplierName.Text);
        }

        protected void btn_AddIngredient_Click(object sender, EventArgs e)
        {
            fcAddIngredient(0, txtIngredientName.Text, Convert.ToInt32(txtSupplierID.Text), txtIngredientUnit.Text, Convert.ToInt32(txtIngredientAmount.Text), Convert.ToDecimal(txtIngredientCostPerUnit.Text), Convert.ToDecimal(txtIngredientTotalCost.Text), Calendar_Ingredient.SelectedDate, Convert.ToDecimal(txtIngredientRating.Text));
        }

        protected void btn_LookUpIngredient_Click(object sender, EventArgs e)
        {
            fcLookUpIngredient(txtIngredientName.Text);
        }

        protected void btn_UpdateIngredient_Click(object sender, EventArgs e)
        {
            fcAddIngredient(Convert.ToInt32(txtIngredientID.Text), txtIngredientName.Text, Convert.ToInt32(txtSupplierID.Text), txtIngredientUnit.Text, Convert.ToInt32(txtIngredientAmount.Text), Convert.ToDecimal(txtIngredientCostPerUnit.Text), Convert.ToDecimal(txtIngredientTotalCost.Text), Calendar_Ingredient.SelectedDate, Convert.ToDecimal(txtIngredientRating.Text));
        }

        protected void cboContract_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Models.SupplierLayersTableAdapters.SuppliersTableAdapter suppliersTableAdapter = new Models.SupplierLayersTableAdapters.SuppliersTableAdapter();
                System.Data.DataTableReader dataTableReader = suppliersTableAdapter.SearchSupplier(cboSupllier.SelectedItem.Text.Trim()).CreateDataReader();


                if (dataTableReader.Read())
                {
                    lblSupplierWarning.Text = "Supplier is existed";
                    txtSupplierID.Text = dataTableReader[0].ToString();
                    txtSupplierName.Text = dataTableReader["Name"].ToString();
                    txtIngredientSupplierID.Text = dataTableReader[0].ToString();
                    txtSupplierContract.Text = dataTableReader["Contract"].ToString();
                    txtSupplierRating.Text = dataTableReader["Rating"].ToString();
                    lblContractDate.Text = ((DateTime)dataTableReader["StartDate"]).ToString("dd-MM-yyyy");
                }
                else
                {
                    lblSupplierWarning.Text = "Supplier is NOT existed";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Login Error: " + ex.ToString());
            }
        }

        protected void cboIngredient_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Models.IngredientLayersTableAdapters.IngredientTableAdapter ingredientTableAdapter = new Models.IngredientLayersTableAdapters.IngredientTableAdapter();
                System.Data.DataTableReader dataTableReader = ingredientTableAdapter.SearchIngredientByName(cboIngredient.SelectedItem.Text.Trim()).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblIngredientWarning.Text = "Ingredient is existed";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                    txtIngredientName.Text = dataTableReader["Name"].ToString();
                    txtIngredientSupplierID.Text = dataTableReader["Supplier_ID"].ToString();
                    txtIngredientUnit.Text = dataTableReader["Unit"].ToString();
                    txtIngredientAmount.Text = dataTableReader["Amount"].ToString();
                    txtIngredientCostPerUnit.Text = dataTableReader["CostperUnit"].ToString();
                    lblExpirationDate.Text = ((DateTime)dataTableReader["ExpirationDate"]).ToString("dd-MM-yyyy");
                    txtIngredientTotalCost.Text = dataTableReader["TotalCost"].ToString();
                    txtIngredientRating.Text = dataTableReader["Rating"].ToString();
                }
                else
                {
                    lblSupplierWarning.Text = "Ingredient is NOT existed";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Login Error: " + ex.ToString());
            }
        }

        protected void btnAddRecipe_Click(object sender, EventArgs e)
        {
            fcAddRecipe(0, Convert.ToInt32(txtRecipeEmployeeID.Text), txtRecipeName.Text, txtRecipeInstruction.Text, Convert.ToDecimal(txtRecipeRating.Text), int.Parse(txtCookiesPerBatch.Text));
        }

        protected void btnLookUpRecipe_Click(object sender, EventArgs e)
        {
            fcLookUpRecipe(txtRecipeName.Text);
        }

        protected void btnUpdateRecipe_Click(object sender, EventArgs e)
        {
            fcAddRecipe(Convert.ToInt32(txtRecipeID.Text), Convert.ToInt32(txtRecipeEmployeeID.Text), txtRecipeName.Text, txtRecipeInstruction.Text, Convert.ToDecimal(txtRecipeRating.Text), int.Parse(txtCookiesPerBatch.Text));
        }

        protected void cboRecipeName_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Models.RecipeLayerTableAdapters.RecipeTableAdapter recipeTableAdapter = new Models.RecipeLayerTableAdapters.RecipeTableAdapter();
                System.Data.DataTableReader dataTableReader = recipeTableAdapter.SearchRecipeByName(cboRecipeName.SelectedItem.Text.Trim()).CreateDataReader();
                if (dataTableReader.Read())
                {
                    lblRecipeWarning.Text = "Recipe is existed";
                    txtRecipeID.Text = dataTableReader[0].ToString();
                    Session["Recipe_ID"] = Convert.ToInt32(dataTableReader[0].ToString());
                    txtRecipeName.Text = dataTableReader["Name"].ToString();
                    txtRecipeInstruction.Text = dataTableReader["Instruction"].ToString();
                    txtRecipeEmployeeID.Text = dataTableReader["Employee_ID"].ToString();
                    txtRecipeRating.Text = dataTableReader["Rating"].ToString();
                    txtCookiesPerBatch.Text = dataTableReader["AmountPerBatch"].ToString();
                }
                else
                {
                    lblRecipeWarning.Text = "Recipe is NOT existed";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void cboRecipeEmployeID_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Models.UserLayerTableAdapters.UserLoginTableAdapter userLoginTableAdapter = new Models.UserLayerTableAdapters.UserLoginTableAdapter();
                System.Data.DataTableReader dataTableReader = userLoginTableAdapter.SearchEmployeeByFirstName(cboRecipeEmployeName.SelectedItem.Text.Trim()).CreateDataReader();
                if (dataTableReader.Read())
                {
                    txtRecipeEmployeeID.Text = dataTableReader["Employee_ID"].ToString();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void btnAddRecipeDetail_Click(object sender, EventArgs e)
        {
            fcAddRecipeDetail(Convert.ToInt32(txtRecipeID.Text), Convert.ToInt32(txtIngredientID.Text), Convert.ToInt32(txtAmountRecipeDetail.Text));

        }

        protected void btnLookUpIngredientInRecipeDetail_Click(object sender, EventArgs e)
        {
            fcLookUpRecipeDetail(Convert.ToInt32(txtRecipeID.Text), Convert.ToInt32(txtIngredientID.Text));
        }

        protected void btnDeleteRecipeIngredient_Click(object sender, EventArgs e)
        {
            fcDeleteRecipeDetail(Convert.ToInt32(txtRecipeID.Text), Convert.ToInt32(txtIngredientID.Text));
        }

        protected void cboIngredientsOfRecipe_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter updateRecipeDetailTableAdapter = new Models.RecipeDetailLayerTableAdapters.RecipeDetailTableAdapter();
                int x = 0;
                if (cboIngredientsOfRecipe.SelectedItem != null)
                {
                     x = int.Parse(cboIngredientsOfRecipe.SelectedItem.ToString());
                }

                lblRecipeDetailWarning.Text = x.ToString();
                lblRecipeWarning.Text = Convert.ToInt32(txtRecipeID.Text).ToString();
                System.Data.DataTableReader dataTableReader = updateRecipeDetailTableAdapter.SearchIngredientInRecipe(int.Parse(Session["Recipe_ID"].ToString()), x).CreateDataReader();
                lblRecipeDetailWarning.Text = "Done";
                if (dataTableReader.Read())
                {
                    lblRecipeDetailWarning.Text = "Ingredient is existed in the Recipe";
                    txtIngredientID.Text = dataTableReader[0].ToString();
                    txtAmountRecipeDetail.Text = dataTableReader["Amount"].ToString();
                    lblRecipeDetailWarning.Text = dataTableReader["Amount"].ToString();
                    fcLookUpIngredientByID(x);
                }
                else
                {
                    lblRecipeDetailWarning.Text = "Ingredient is NOT existed in the Recipe";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Login Error: " + e.ToString());
            }
        }

        protected void btnDeleteRecipeIngredient_Click1(object sender, EventArgs e)
        {
            fcDeleteRecipeDetail(int.Parse(txtRecipeID.Text), int.Parse(txtIngredientID.Text));
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Controls/Account/Admin.aspx");
        }
    }
}