using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class ManageBooks : System.Web.UI.Page
    {
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBooks();
            }
        }

        // Search books based on the input
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindBooks(txtSearch.Text.Trim());
        }

        // Redirect to the AddBook page
        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBook.aspx");
        }

        // Handle Repeater item commands for editing or deleting books
        protected void rpBooks_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "EditBook")
            {
                // Redirect to EditBook page with the BookID as a query parameter
                Response.Redirect("EditBook.aspx?BookID=" + e.CommandArgument);
            }
            else if (e.CommandName == "DeleteBook")
            {
                // Delete the book and rebind the list
                int bookID = Convert.ToInt32(e.CommandArgument);
                DeleteBook(bookID);
                BindBooks(); // Rebind the list to refresh it after deletion
            }
        }

        // Method to delete a book based on its ID
        private void DeleteBook(int bookID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Books WHERE BookID = @BookID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookID", bookID);
                    try
                    {
                        con.Open();
                        int rowsAffected = cmd.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Book deleted successfully!";
                        }
                        else
                        {
                            lblMessage.Text = "Error deleting the book.";
                        }
                    }
                    catch (Exception ex)
                    {
                        lblMessage.Text = "Error deleting book: " + ex.Message;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        // Method to bind the books to the Repeater control
        private void BindBooks(string searchQuery = "")
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT BookID, Title, Author, Category, Price, Quantity, CoverImage FROM Books";

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    query += " WHERE Title LIKE @SearchQuery";
                }

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    if (!string.IsNullOrEmpty(searchQuery))
                    {
                        cmd.Parameters.AddWithValue("@SearchQuery", "%" + searchQuery + "%");
                    }

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
                            lblMessage.Text = "No books found.";
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
        protected void btnViewBooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Books.aspx");
        }
        protected void btnCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }


    }
}
