using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.Security.Cryptography;


namespace TicketReservationSystem
{
    public partial class UserSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
                if (Chekuser() == false)
                {
                    string username = TxtUserName.Text;
                    string HashPassword = MD5Hash(TxtPassword.Text);
                    string HashRepassword = MD5Hash(TxtRePassword.Text);
                    string nic = TxtNIC.Text;

                    if (passwordValidation(HashPassword, HashRepassword) == true)
                    {
                        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                        SqlConnection con = new SqlConnection(cs);

                        string query = "INSERT INTO users (nic,username,password) VALUES('" + nic + "','" + username + "','" + HashPassword + "')";
                        SqlCommand cmd = new SqlCommand(query, con);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();

                        LblMsg.Visible = true;
                        LblErrorMsg.Visible = false;
                        
                    }

                    
                }
        }

        protected bool Chekuser()
        {
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
                conn.Open();
                string checkuser = "select count(*) from users where username='" + TxtUserName.Text + "'";
                SqlCommand com = new SqlCommand(checkuser, conn);
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());
                if (temp == 1)
                {  
                    LblErrorMsg.Visible = true;
                    LblMsg.Visible = false;
                    return true;
                }

                conn.Close();
                return false;

        }
        protected bool passwordValidation(string p1,string p2) {

            if (p1 == p2)
                return true;
            else
                return false;
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