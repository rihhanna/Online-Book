using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalProject
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUserProfile();
                BindContactList();


            }

        }
        public void BindContactList()
        {
            string connectionstring = "server=localhost;database=project;integrated security=true;";
            using (SqlConnection con = new SqlConnection(connectionstring))
            {

                if (Session["userid"] != null)
                {
                    int userid = (int)Session["userid"];
                    string select = "select * from Contact where userid = @userid";

                    SqlCommand cmd = new SqlCommand(select, con);
                    cmd.Parameters.AddWithValue("@userid", userid);
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    Repeater2.DataSource = dt;
                    Repeater2.DataBind();
                }
                else
                {
                    // Handle cases where userid is not in session, possibly redirect or show a message
                    Console.WriteLine("User ID is not available in session.");
                }
            }
        }
        protected void LoadUserProfile()
        {
            string connectionstring = "server=localhost;database=project;integrated security=true;";
            using (SqlConnection con = new SqlConnection(connectionstring))
            {
                int userid = (int)Session["userid"];
                string select = "select username, ProfileImage from users where userid = @userid";

                SqlCommand cmd = new SqlCommand(select, con);
                cmd.Parameters.AddWithValue("@userid", userid);
                con.Open();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                Repeater1.DataSource = dt;
                Repeater1.DataBind();

            }




        }
    }
}