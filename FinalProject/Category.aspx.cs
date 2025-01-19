using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Category : System.Web.UI.Page
    {
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCategories();
            }
        }

        private void LoadCategories()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT DISTINCT Category FROM Books";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            ddlCategories.DataSource = reader;
                            ddlCategories.DataTextField = "Category";
                            ddlCategories.DataValueField = "Category";
                            ddlCategories.DataBind();
                        }
                        ddlCategories.Items.Insert(0, new ListItem("Select Category", ""));
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error loading categories: " + ex.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        protected void ddlCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedCategory = ddlCategories.SelectedValue;
            if (!string.IsNullOrEmpty(selectedCategory))
            {
                BindBooks(selectedCategory);
            }
            else
            {
                rpBooks.DataSource = null;
                rpBooks.DataBind();
            }
        }

        private void BindBooks(string category)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT BookID, Title, Author, Category, Price, Quantity, CoverImage FROM Books WHERE Category = @Category";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Category", category);

                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            rpBooks.DataSource = reader;
                            rpBooks.DataBind();
                        }
                        else
                        {
                            rpBooks.DataSource = null;
                            rpBooks.DataBind();
                            lblMessage.Text = "No books found for the selected category.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error fetching books: " + ex.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
    }
}
