using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Security.Cryptography;

namespace TicketReservationSystem
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] != null)
            {
                Response.Redirect("UserLogin.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string HashPassword = MD5Hash(TxtPasswordAdmin.Text);

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ToString());
            con.Open();
            String query = "Select count(*) from admin where Adminid='" + TxtAdminId.Text + "' and password='" + HashPassword + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            String output = cmd.ExecuteScalar().ToString();

            if (output == "1")
            {
                Session["adminID"] = TxtAdminId.Text;
                Response.Redirect("~/Admin/AdminHome.aspx");
            }
            else
            {
                LblErrorAdmin.Visible = true;
            }
        }

        protected void ChkShowpassword_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkShowpassword.Checked == false)
            {
                string pass = TxtPasswordAdmin.Text;
                TxtPasswordAdmin.TextMode = TextBoxMode.Password;
                TxtPasswordAdmin.Attributes.Add("value", pass);
            }

            else
            {
                TxtPasswordAdmin.TextMode = TextBoxMode.SingleLine;
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