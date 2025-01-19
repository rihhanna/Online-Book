using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace FinalProject
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFeaturedBooks();
            }
        }

        private void BindFeaturedBooks()
        {
            // Connection string to the database
            string connectionString = "server=localhost; database=project; integrated security=true";
            string query = "SELECT Title, Author, Rating, CoverImage FROM Books";

            // Establishing connection to the database
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    try
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        // Check if there is any data
                        if (reader.HasRows)
                        {
                            // Bind the data from the SQL reader to the Repeater
                            FeaturedBooksRepeater.DataSource = reader;
                            FeaturedBooksRepeater.DataBind();
                        }
                        else
                        {
                            // Handle case where no books are found
                            // Optionally, show a message
                        }
                    }
                    catch (Exception ex)
                    {
                        // Handle exception (e.g., log the error)
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }

        // Method to generate star ratings (out of 5 stars)
        public string GenerateStars(int rating)
        {
            return new string('★', rating) + new string('☆', 5 - rating);
        }
    }
}
