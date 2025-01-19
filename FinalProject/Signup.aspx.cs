using System;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;

namespace FinalProject
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connectionString = "server=localhost;database=project;integrated security=true;";

            if (ValidateInputs())
            {
                try
                {
                    string profilePicturePath = UploadProfilePicture();

                    using (SqlConnection conn = new SqlConnection(connectionString))
                    {
                        string username = TextBox1.Text;
                        string password = HashPassword(TextBox2.Text); // Hashing password
                        string email = TextBox3.Text;
                        string role = "user";

                        string insert = "INSERT INTO users (username, passwd, email, ProfileImage, Role) " +
                                        "OUTPUT INSERTED.userid VALUES (@username, @password, @email, @profileimage, @role)";

                        SqlCommand cmd = new SqlCommand(insert, conn);
                        cmd.Parameters.AddWithValue("@username", username);
                        cmd.Parameters.AddWithValue("@password", password);
                        cmd.Parameters.AddWithValue("@email", email);
                        cmd.Parameters.AddWithValue("@profileimage", profilePicturePath);
                        cmd.Parameters.AddWithValue("@role", role);

                        conn.Open();

                        int userid = (int)cmd.ExecuteScalar();
                        Session["userid"] = userid;

                        if (userid > 0)
                        {
                            lblMessage.Text = "Sign up successful!";
                            lblMessage.Visible = true;
                            Response.Redirect("~/booklist.aspx");
                        }
                        else
                        {
                            lblMessage.Text = "Sign up failed. Please try again.";
                            lblMessage.Visible = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.Visible = true;
                }
            }
        }

        private bool ValidateInputs()
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text) || string.IsNullOrWhiteSpace(TextBox2.Text) ||
                string.IsNullOrWhiteSpace(TextBox3.Text) || !FileUpload1.HasFile)
            {
                lblMessage.Text = "Please fill in all fields and upload a profile picture.";
                lblMessage.Visible = true;
                return false;
            }
            return true;
        }

        private string UploadProfilePicture()
        {
            string profilePicturePath = "";
            if (FileUpload1.HasFile)
            {
                string folderPath = Server.MapPath("~/ProfilePictures/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                profilePicturePath = "~/ProfilePictures/" + fileName;
                FileUpload1.SaveAs(Path.Combine(folderPath, fileName));
            }
            return profilePicturePath;
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] hash = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(hash);
            }
        }
    }
}
