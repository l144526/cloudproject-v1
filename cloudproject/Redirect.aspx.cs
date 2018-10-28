using System;
using System.Data;
using System.Data.SqlClient;

namespace cloudproject
{
    public partial class redirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String fb_name = Request.QueryString["name"];
            String fb_email = Request.QueryString["email"];

            string str = Session["fb_email"].ToString();
            Session["fb_email"] = fb_email;

            SqlConnection con;
            SqlDataAdapter sda;
            DataTable dt;

            // Check if the person already has an account or not
            con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            sda = new SqlDataAdapter("select * From users Where users.email = '" + fb_email + "'", con);
            dt = new DataTable();

            sda.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 1)
            {
                Session["session_id"] = Session["fb_email"].ToString();
            }
            else if (dt.Rows.Count == 0)
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                string sql = "INSERT INTO [dbo].[users] ([name], [email], [password]) VALUES (N'" + fb_name + "', N'" + fb_email + "', NULL)";
                try
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand(sql, conn)
                    {
                        CommandType = CommandType.Text
                    };
                    cmd.ExecuteNonQuery();
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    string msg = "Insert Error:";
                    msg += ex.Message;
                    throw new Exception(msg);
                }
                finally
                {
                    conn.Close();
                }
                Session["session_id"] = Session["fb_email"].ToString();
               str = Session["fb_email"].ToString();
               str = Session["session_id"].ToString();
            }
            Response.Redirect("home.aspx");


        }
    }
}