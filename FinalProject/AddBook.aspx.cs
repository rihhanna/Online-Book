using System;
using System.Data.SqlClient;
using System.IO;

namespace FinalProject
{
    public partial class AddBook : System.Web.UI.Page
    {
        private string connectionString = "Server=localhost; Database=project; Integrated Security=True;";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAddBook_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string author = txtAuthor.Text.Trim();
            string isbn = txtISBN.Text.Trim();
            string category = txtCategory.Text.Trim();
            decimal price;
            int quantity;
            string description = txtDescription.Text.Trim();
            string coverImagePath = null;

            // Validate price and quantity
            if (!decimal.TryParse(txtPrice.Text.Trim(), out price))
            {
                lblMessage.Text = "Invalid price.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            if (!int.TryParse(txtQuantity.Text.Trim(), out quantity))
            {
                lblMessage.Text = "Invalid quantity.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            try
            {
                // Handle file upload
                if (fileCoverImage.HasFile)
                {
                    string fileName = Path.GetFileName(fileCoverImage.PostedFile.FileName);
                    string filePath = Server.MapPath("~/Images/") + fileName;
                    coverImagePath = "~/Images/" + fileName;
                    fileCoverImage.SaveAs(filePath);
                }

                // Insert book into database
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Books (Title, Author, ISBN, Category, Price, Quantity, Description, CoverImage) " +
                                   "VALUES (@Title, @Author, @ISBN, @Category, @Price, @Quantity, @Description, @CoverImage)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Title", title);
                        cmd.Parameters.AddWithValue("@Author", author);
                        cmd.Parameters.AddWithValue("@ISBN", isbn);
                        cmd.Parameters.AddWithValue("@Category", category);
                        cmd.Parameters.Add("@Price", System.Data.SqlDbType.Decimal).Value = price;
                        cmd.Parameters.Add("@Quantity", System.Data.SqlDbType.Int).Value = quantity;
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@CoverImage", coverImagePath ?? (object)DBNull.Value);

                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }

                lblMessage.Text = "Book added successfully!";
                lblMessage.ForeColor = System.Drawing.Color.Green;

                // Reload the page to reset controls
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }

        // Event handler for viewing all books
        

        protected void btnViewBooks_Click1(object sender, EventArgs e)
        {
            // Redirect to the page that lists all books
            Response.Redirect("Books.aspx");
        }
    }
}
