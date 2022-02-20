using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Text;


namespace TicketReservationSystem.Admin
{
    public partial class AdminAddNewAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            if (Chekuser() == false)
            {
                string adminId = TxtAdminID.Text;
                string Hashpassword = MD5Hash(TxtPassword_Admin.Text);
                string HashRepassword = MD5Hash(TxtRePassword_Admin.Text);
                string nic = TxtNIC_Admin.Text;

                if (passwordValidation(Hashpassword, HashRepassword) == true)
                {                    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs);

                    string query = "INSERT INTO admin (nic,adminid,password) VALUES('" + nic + "','" + adminId + "','" + Hashpassword + "')";
                    SqlCommand cmd = new SqlCommand(query, con);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    LblErrorMsg.Visible = false;
                    LblMsg.Visible = true;

                }

            }
        }
        protected bool Chekuser()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString);
            conn.Open();
            string checkuser = "select count(*) from admin where adminid='" + TxtAdminID.Text + "'";
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
        protected bool passwordValidation(string p1, string p2)
        {

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