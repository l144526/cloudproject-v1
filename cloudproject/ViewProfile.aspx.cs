using System;
using System.Data;
using System.Data.SqlClient;

namespace cloudproject
{
    public partial class ViewProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter("select * From users Where users.email = '" + Session["session_id"] + "'", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 1)
            {
                name_label.Text = dt.Rows[0][1].ToString();
                Email_adress.Text = Session["session_id"].ToString();
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }
    }
}