using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace cloudproject
{
    public partial class Default: System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["fb_email"] = "$$$$$$$$$$";
            Session["fb_name"] = "$$$$$$$$$$";
        }
        
        protected void Login_Click(object sender, EventArgs e)
        {
                  
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter("select count(*) From users Where users.email = '" + inputEmail.Text + "' and users.password = '" + inputPassword.Text + "'", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            con.Close();

            if (dt.Rows[0][0].ToString() == "1")
            {
                Session["session_id"] = inputEmail.Text;
                Response.Redirect("home.aspx");
            }
            else
            {
                inputPassword.Text = "";
                inputEmail.Focus();
            }
        }
    }
}