using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace FinalProject
{
    public class BookRepository
    {
        // Hardcoded connection string to your SQL Server database
        private readonly string _connectionString = "Server=localhost;Database=project;Integrated Security=True;";

        // Method to get the list of featured books
        public List<Book> GetFeaturedBooks()
        {
            var books = new List<Book>();

            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                string query = "SELECT Title, Author, Rating, CoverImage FROM Books"; // Modify the query as needed

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            books.Add(new Book
                            {
                                Title = reader["Title"].ToString(),
                                Author = reader["Author"].ToString(),
                                Rating = Convert.ToInt32(reader["Rating"]),
                                CoverImage = reader["CoverImage"].ToString()
                            });
                        }
                    }
                }
            }

            return books;
        }
    }

    // Define the Book class with properties
    public class Book
    {
        public string Title { get; set; }
        public string Author { get; set; }
        public int Rating { get; set; }
        public string CoverImage { get; set; }
    }
}
