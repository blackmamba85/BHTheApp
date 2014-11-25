using BHSCMSApp.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BHSCMSApp.Dashboard.Tools
{
    public partial class ModifyCategories : System.Web.UI.Page
    {
        static List<Category> categoryList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            { FillCurrentCategoryList(); }
            
            editCategoryDiv.Visible = false;
            
        }

        private void FillCurrentCategoryList()
        {
            string qry = "Select CategoryID, Category, Description From BHSCMS.dbo.CategoryTable";
            DataTable dt = new DataTable();
            using(SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString ))
            {
                con.Open();

                using(SqlCommand com = new SqlCommand(qry,con))
                {
                    using(SqlDataAdapter adapter = new SqlDataAdapter(com))
                    {
                        adapter.Fill(dt);
                    }
                }
            }

            categoryList = new List<Category>();

            foreach(DataRow dr in dt.Rows)
            {
                categoryList.Add(new Category
                    {
                        CategoryID = int.Parse(dr[0].ToString()),
                        CategoryName = dr[1].ToString(),
                        Description = dr[2].ToString()

                    });
            }

            listBoxCategory.DataSource = categoryList.Select(x => x.CategoryName).ToList();
            listBoxCategory.DataBind();
            

        }

        protected void listBoxCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            editCategoryDiv.Visible = true;
            addCategoryDiv.Visible = false;
            Category selectedCat = categoryList.Select(x => x).Where(x => x.CategoryName == listBoxCategory.Items[listBoxCategory.SelectedIndex].Text).FirstOrDefault();

            hiddenCatID.Value = selectedCat.CategoryID.ToString();
            editCatName.Text = selectedCat.CategoryName;
            editCatDescription.Text = (string.IsNullOrEmpty(selectedCat.Description)) ? "null" : selectedCat.Description;
        }

        private bool PushCategory(Category editCat)
        {
            bool pushSuccess = false;

            string qry = "Update BHSCMS.dbo.CategoryTable Set Category = @catName, Description = @catDescription Where CategoryID = @catID";
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
            {
                con.Open();

                using (SqlCommand com = new SqlCommand(qry, con))
                {

                    com.Parameters.AddWithValue("@catID", editCat.CategoryID);
                    com.Parameters.AddWithValue("@catName",editCat.CategoryName);
                    com.Parameters.AddWithValue("@catDescription", editCat.Description);


                    com.ExecuteNonQuery();
                    pushSuccess = true;
                }
            }

            return pushSuccess;
        }

        protected void Modify_Command(object sender, CommandEventArgs e)
        {
            if(e.CommandName.Equals("EditSubmit"))
            {
                Category modifiedCat = new Category()
                {
                    CategoryID = int.Parse(hiddenCatID.Value),
                    CategoryName = editCatName.Text,
                    Description = editCatDescription.Text
                };

                bool success = PushCategory(modifiedCat);
                if (success)
                {
                    string script = "alert('Update successful!')";
                    ScriptManager.RegisterStartupScript(this, GetType(), "randoKey", script, true);
                    FillCurrentCategoryList();
                    editCatName.Text = string.Empty;
                    editCatDescription.Text = string.Empty;
                }
                else if (!success)
                {
                    string script = "alert('Update Unsucessful. Please try again.')";
                    ScriptManager.RegisterStartupScript(this, GetType(), "randoKeyNO", script, true);
                }
            }
            else if (e.CommandName.Equals("Delete"))
            {
                string qry = "Delete From BHSCMS.dbo.CategoryTable Where CategoryID=@catID";
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
                {
                    con.Open();

                    using (SqlCommand com = new SqlCommand(qry, con))
                    {
                        com.Parameters.AddWithValue("catID", hiddenCatID.Value);
                        com.ExecuteNonQuery();
                    }
                }
                FillCurrentCategoryList();
            }
            else if (e.CommandName.Equals("EditCancel"))
            {
                editCategoryDiv.Visible = false;
                addCategoryDiv.Visible = true;
                listBoxCategory.ClearSelection();
            }
            else if(e.CommandName.Equals("Add"))
            {
                Category newCat = new Category()
                {
                    CategoryName = addCatName.Text,
                    Description = addCatName.Text
                };

                string qry = "Insert Into BHSCMS.dbo.CategoryTable (Category, Description) Values (@catName, @catDescription)";


                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["BHSCMS"].ConnectionString))
                {
                    con.Open();

                    using (SqlCommand com = new SqlCommand(qry, con))
                    {
                        com.Parameters.AddWithValue("@catName", newCat.CategoryName);
                        com.Parameters.AddWithValue("@catDescription", newCat.Description);
                        com.ExecuteNonQuery();
                    }
                }
                FillCurrentCategoryList();
                addCatName.Text = string.Empty;
                addCatDescription.Text = string.Empty;
            }
        }
    }
}