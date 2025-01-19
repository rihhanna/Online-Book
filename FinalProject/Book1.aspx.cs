using System;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class Book1 : System.Web.UI.Page
    {
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBooks();
            }
        }

        private void LoadBooks()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT BookTitle, Author, Price FROM Books";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            rptBooks.DataSource = reader;
                            rptBooks.DataBind();
                        }
                        else
                        {
                            // If no books are found, display a message (you can replace this with something else if needed)
                            rptBooks.DataSource = null;
                            rptBooks.DataBind();
                            lblMessage.Text = "No books found.";
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle errors (you can log the error or show a message)
                        lblMessage.Text = "An error occurred while retrieving books."+ex.Message;
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
