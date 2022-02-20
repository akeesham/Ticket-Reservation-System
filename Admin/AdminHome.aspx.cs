using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem.Admin
{
    public partial class AdminHome : System.Web.UI.Page
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

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/AdminLogin.aspx");
        }

        protected void BtnUpdateDelete_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/AdminUpdateDeleteTrain.aspx");
        }
    }
}