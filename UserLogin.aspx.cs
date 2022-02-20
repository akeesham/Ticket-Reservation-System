using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;


namespace TicketReservationSystem
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                Response.Redirect("UserLogin.aspx");
            }

      

        }

        protected void BtnAdminLogin_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminLogin.aspx");
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string HashPassword = MD5Hash(TxtPassword.Text);
            //for encripting the password

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ToString());
            con.Open();
            String query = "Select count(*) from users where username='" + TxtUserName.Text + "' and password='" + HashPassword + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            String output = cmd.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["user"] = TxtUserName.Text;
                Response.Redirect("~/Reservation.aspx");
                LblError.Visible = false;
            }
            else
            {
                LblError.Visible = true;
            }
        }

       
        protected void ChkShowpasswordUser_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkShowpasswordUser.Checked == false)
            {
                string pass = TxtPassword.Text;
                TxtPassword.TextMode = TextBoxMode.Password;
                TxtPassword.Attributes.Add("value", pass);
            }

            else
            {
                TxtPassword.TextMode = TextBoxMode.SingleLine;
            }
        }

        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
  
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));
            
            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {    
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }

    }
}