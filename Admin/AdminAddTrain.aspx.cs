using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem.Admin
{
    public partial class AdminAddTrain : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnAdminHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminHome.aspx");
        }

        protected void BtnAddTrain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminAddTrain.aspx");
        }


        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            string query = "INSERT INTO traindata (trainno, traintype, price1stclass, price2ndclass, price3rdclass, starts, ends, time,totalseats) VALUES (@no, @type, @price1, @price2, @price3, @start, @end, @time,@totalSeat)";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@no", TxtTrainNo.Text);
            if (RdoIntercity.Checked == true)
            {
                cmd.Parameters.AddWithValue("@type", RdoIntercity.Text);
            }
            if (RdoNormal.Checked == true)
            {
                cmd.Parameters.AddWithValue("@type", RdoNormal.Text);
            }

            cmd.Parameters.AddWithValue("@price1", TxtPrice1.Text);
            cmd.Parameters.AddWithValue("@price2", TxtPrice2.Text);
            cmd.Parameters.AddWithValue("@price3", TxtPrice3.Text);
            cmd.Parameters.AddWithValue("@start", TxtStart.Text);
            cmd.Parameters.AddWithValue("@end", TxtEnd.Text);
            cmd.Parameters.AddWithValue("@time", TxtTime.Text);
            cmd.Parameters.AddWithValue("@totalSeat", Int32.Parse(TxtSeatCount.Text));

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/AdminLogin.aspx");
        }

        protected void BtnUpdateDeleteTrain_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminUpdateDeleteTrain.aspx");
        }
    }
}