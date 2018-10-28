using System;
using System.Data;
using System.Data.SqlClient;

namespace cloudproject
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["session_id"] = "taseer@gmail.com";

            ///////////////////////////////////////////////////////

            string str = Session["session_id"].ToString();
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            SqlDataAdapter sda = new SqlDataAdapter("select * From users Where users.email = '" + Session["session_id"] + "'", con);
            DataTable dt = new DataTable();

            sda.Fill(dt);
            con.Close();

            if (dt.Rows.Count == 1)
            {  
                if (dt.Rows[0][3].ToString()=="")
                {
                    password.Visible = false;
                }
              
            }
        }
    
        protected void Update_Click(object sender, EventArgs e)
        {
            if(name.Text.Length>0)
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                string sql = "UPDATE [dbo].[users] SET name = '" + name.Text.ToString() + "' WHERE email='" + Session["session_id"].ToString() + "'";
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
            }
            if(password.Text.Length>0 && password.Visible==true)
            {
                SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
                string sql = "UPDATE [dbo].[users] SET password = '" + password.Text.ToString() + "' WHERE email='" + Session["session_id"].ToString() + "'";
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
            }
            Response.Redirect("ViewProfile.aspx");
        }
        
    }
}