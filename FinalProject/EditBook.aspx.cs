using System;
using System.Data.SqlClient;

namespace FinalProject
{
    public partial class EditBook : System.Web.UI.Page
    {
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Load book details if BookID is provided in the query string
                string bookID = Request.QueryString["BookID"];
                if (!string.IsNullOrEmpty(bookID))
                {
                    LoadBookDetails(Convert.ToInt32(bookID));
                }
            }
        }

        // Load book details for editing
        private void LoadBookDetails(int bookID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT Title, Author, Category, Price, Quantity, Description, CoverImage FROM Books WHERE BookID = @BookID";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@BookID", bookID);
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.Read())
                    {
                        txtTitle.Text = reader["Title"].ToString();
                        txtAuthor.Text = reader["Author"].ToString();
                        txtCategory.Text = reader["Category"].ToString();
                        txtPrice.Text = reader["Price"].ToString();
                        txtQuantity.Text = reader["Quantity"].ToString();
                        txtDescription.Text = reader["Description"].ToString();
                        imgCoverImage.ImageUrl = reader["CoverImage"].ToString(); // Assuming you store the URL of the cover image
                    }
                    con.Close();
                }
            }
        }

        // Update book details
        protected void btnUpdateBook_Click(object sender, EventArgs e)
        {
            string bookID = Request.QueryString["BookID"];
            if (!string.IsNullOrEmpty(bookID))
            {
                UpdateBookDetails(Convert.ToInt32(bookID));
            }
        }

        // Method to update the book's details in the database
        private void UpdateBookDetails(int bookID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Books SET Title = @Title, Author = @Author, Category = @Category, Price = @Price, Quantity = @Quantity, Description = @Description WHERE BookID = @BookID";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.Trim());
                    cmd.Parameters.AddWithValue("@Category", txtCategory.Text.Trim());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Quantity", Convert.ToInt32(txtQuantity.Text.Trim()));
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@BookID", bookID);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        lblMessage.Text = "Book updated successfully!";
                    }
                    else
                    {
                        lblMessage.Text = "Error updating the book.";
                    }
                    con.Close();
                    // After updating, redirect to ManageBooks.aspx
                    Response.Redirect("ManageBooks.aspx");
                }
            }
        }
    }
}
