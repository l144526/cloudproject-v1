using System;
using System.Data;
using System.Data.SqlClient;

namespace cloudproject
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          //Session["session_id"] = "junib3.1994@Gmail.com";

        /////////////////////////////


            string str = Session["session_id"].ToString();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter("select * From users Where users.email = '" + Session["session_id"] + "'", con);
            DataTable dt = new DataTable();
           
            sda.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 1)
            {
                view_profile_button.Text = dt.Rows[0][1].ToString();
            }
            else
            {
                view_profile_button.Text = "unknown";
            }
        }

        protected void view_profile_button_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewProfile.aspx");
        }
    }
}