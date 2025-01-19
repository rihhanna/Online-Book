using System;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class Books : System.Web.UI.Page
    {
        // Use your appropriate connection string (updated for your setup)
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBooks();
            }
        }

        private void BindBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT BookID, Title, Author, Category, Price, Quantity, CoverImage FROM Books";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Check if the reader has any rows (books) to bind
                        if (reader.HasRows)
                        {
                            rpBooks.DataSource = reader;
                            rpBooks.DataBind();
                        }
                        else
                        {
                            // Handle no books found
                            lblMessage.Text = "No books found.";
                            lblMessage.ForeColor = System.Drawing.Color.Red;
                        }
                    }
                    catch (SqlException sqlEx)
                    {
                        // Handle SQL-specific errors
                        lblMessage.Text = "Error retrieving data: " + sqlEx.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    catch (Exception ex)
                    {
                        // Handle general errors
                        lblMessage.Text = "An unexpected error occurred: " + ex.Message;
                        lblMessage.ForeColor = System.Drawing.Color.Red;
                    }
                    finally
                    {
                        con.Close(); // Ensure the connection is always closed
                    }
                }
            }
        }
    }
}
