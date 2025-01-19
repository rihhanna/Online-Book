using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void button1_Click(object sender, EventArgs e)
        {
            string username = TextBox1.Text;
            string password = TextBox2.Text;

            string connectionString = "server=localhost;database=project;integrated security=true;";
            try
            {

                using (SqlConnection con = new SqlConnection(connectionString))

                {
                    string select = "select userid from users where username = @username and passwd= @password";
                    SqlCommand cmd = new SqlCommand(select, con);
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);
                    con.Open();
                    object result = cmd.ExecuteScalar();
                    if (result != null)
                    {
                        int useridint = (int)result;
                        Session["userid"] = useridint;
                        Response.Redirect("~/books.aspx");

                    }
                    else
                    {
                        Response.Write("Invalid username or password!");
                    }

                }
            }
            catch (Exception ex)
            {
                Response.Write("Error!!" + ex.Message);
            }
        }

        
    }
}
    