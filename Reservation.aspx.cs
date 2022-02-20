using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketReservationSystem
{
    public partial class Reservation1 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                string query = "SELECT DISTINCT starts FROM traindata";

                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();

                Start.DataSource = cmd.ExecuteReader();
                Start.DataBind();
                
                con.Close();
              
            }
        }

        protected void BtnReserve_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reservation.aspx");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CancelTicket.aspx");
        }

        protected void BtnShow_Click(object sender, EventArgs e)
        {

            if (RdoTrainType.SelectedItem.Text != null && RdoClass.SelectedItem.Text != null && End.SelectedItem.Value != "-1")
            {

                string price = string.Empty;
                int amount = 0;

                if (RdoClass.SelectedItem.Text == "1st Class")
                    price = "price1stclass";
                else if (RdoClass.SelectedItem.Text == "2nd Class")
                    price = "price2ndclass";
                else if (RdoClass.SelectedItem.Text == "3rd Class")
                    price = "price3rdclass";


                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();

                string query = "SELECT * FROM traindata WHERE starts= @st AND ends= @end AND traintype= @type";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@st", Start.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@end", End.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@type", RdoTrainType.SelectedItem.Text);

                SqlDataReader rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    amount = rd.GetInt32(rd.GetOrdinal(price));
                }

                int price_ = amount * (Int32.Parse(TicketCountReserve.Text));

                TxtShow.Text = "From : " + Start.SelectedItem.Text + Environment.NewLine +
                                "End : " + End.SelectedItem.Text + Environment.NewLine +
                                "Train Type : " + RdoTrainType.SelectedItem.Text + Environment.NewLine +
                                "Class : " + RdoClass.SelectedItem.Text + Environment.NewLine +
                                "No of Tickets : " + TicketCountReserve.SelectedItem.Text + Environment.NewLine +
                                "Total Amount : Rs. " + price_.ToString() + Environment.NewLine;

                ViewState["totalAmount"] = price_.ToString();


            }


        }

        protected void BtnPay_Click(object sender, EventArgs e)
        {

            if (End.SelectedValue != "-1" && TimePicker.SelectedValue != "-1" && TimePicker.Text != "" && RdoTrainType.SelectedItem.Text != "" && RdoClass.SelectedItem.Text != "") 
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);

                int checkAvailable = checkSeatAvailability();

                con.Open();
                //Retrive train no from the traindata accoding to the parameters
                String query = "SELECT trainno FROM traindata WHERE starts=@st AND ends=@ed AND traintype=@tp AND time=@t";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@st", Start.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@ed", End.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@tp", RdoTrainType.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@t", TimePicker.SelectedItem.Text);
                string train_No = cmd.ExecuteScalar().ToString();

                if (checkAvailable == 1)
                {
                    Response.Write("cannot be reserved");

                }

                else if (checkAvailable == 2)
                {

                    makePayment(train_No);

                    String query3 = "SELECT availableseats FROM seatdata WHERE trainno=@no AND journeydate=@dt";
                    SqlCommand cmd2 = new SqlCommand(query3, con);
                    cmd2.Parameters.AddWithValue("@no", train_No);
                    cmd2.Parameters.AddWithValue("@dt", DatePicker.Text);
                    int a_seats = int.Parse(cmd2.ExecuteScalar().ToString());

                    a_seats -= int.Parse(TicketCountReserve.Text);
                    String query4 = "UPDATE seatdata SET availableseats=@new";
                    SqlCommand cmd3 = new SqlCommand(query4, con);
                    cmd3.Parameters.AddWithValue("@new", a_seats);  //can reserve and update seatdata table available seat coloumn
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }

                else if (checkAvailable == 3)
                {
                    LblCheckMsg.Text = "Train full";
                    LblCheckMsg.Visible = true;

                }


                else if (checkAvailable == 4)
                {
                    //can reserve and insert into seatdata table * coloumn

                    makePayment(train_No);


                    String query3 = "SELECT totalseats FROM traindata WHERE trainno=@no";
                    SqlCommand cmd2 = new SqlCommand(query3, con);
                    cmd2.Parameters.AddWithValue("@no", train_No);
                    int total_seats = int.Parse(cmd2.ExecuteScalar().ToString());
                    int a_seats = total_seats - (Int32.Parse(TicketCountReserve.Text));

                    string query4 = "INSERT INTO seatdata (trainno, traintype, journeydate, availableseats) VALUES (@tno, @type, @date, @aSeat)";
                    SqlCommand cmd3 = new SqlCommand(query4, con);
                    cmd3.Parameters.AddWithValue("@tno", train_No);
                    cmd3.Parameters.AddWithValue("@type", RdoTrainType.SelectedItem.Text);
                    cmd3.Parameters.AddWithValue("@date", DatePicker.Text);
                    cmd3.Parameters.AddWithValue("@aSeat", a_seats);
                    cmd3.ExecuteNonQuery();

                    con.Close();

                }
            }

            
        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/UserLogin.aspx");
        }

        protected void Start_SelectedIndexChanged(object sender, EventArgs e)
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            con.Open();
            string query = "SELECT DISTINCT ends FROM traindata WHERE starts= @st";
            

                

            SqlCommand cmd = new SqlCommand(query, con);
            
            cmd.Parameters.AddWithValue("@st", Start.SelectedItem.Text);

            End.DataSource = cmd.ExecuteReader();
            End.DataBind();

            con.Close();
        }



        protected void RdoTrainType_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (RdoTrainType.SelectedItem.Text != null)
            {
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con = new SqlConnection(cs);
                con.Open();

                string query = "SELECT time FROM traindata WHERE starts= @st AND ends= @end AND traintype= @type";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@st", Start.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@end", End.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@type", RdoTrainType.SelectedItem.Text);


                TimePicker.DataSource = cmd.ExecuteReader();
                TimePicker.DataBind();

                con.Close();

            }
        }

        protected void BtnViewTime_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewTimeTable.aspx");
        }

        protected void BtnCheckSeat_Click(object sender, EventArgs e)
        {
            checkSeatAvailability();

        }


        protected void makePayment(string train_No)
        {

            string start = Start.SelectedValue;
            string end = End.SelectedValue;
            int ticketcount = Int32.Parse(TicketCountReserve.SelectedValue);
            string price = (string)ViewState["totalAmount"];
            string jdate = DatePicker.Text;//journey date----
            string time = TimePicker.SelectedValue;
            string rdate = DateTime.Now.ToString("yyyy-M-d");//store the reservation date (current date)---

            int amount = Convert.ToInt32(price);

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            string query = "INSERT INTO reservationdata (username,starts,ends,ticketcount,totalamount,journeydate,time,reserveddate,trainno) VALUES (@name,@st,@en,@tc,@price,@jdate,@time,@rdate,@tno)";

            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@name", Session["user"]);
            cmd.Parameters.AddWithValue("@st", start);
            cmd.Parameters.AddWithValue("@en", end);
            cmd.Parameters.AddWithValue("@tc", ticketcount);
            cmd.Parameters.AddWithValue("@price", amount);
            cmd.Parameters.AddWithValue("@jdate", jdate);
            cmd.Parameters.AddWithValue("@rdate", rdate);
            cmd.Parameters.AddWithValue("@time", time);
            cmd.Parameters.AddWithValue("@tno", train_No);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();


        }

        protected int checkSeatAvailability()
        {

            if (TicketCountReserve.SelectedValue!="-1" && End.SelectedValue != "-1" && Start.SelectedIndex != -1 && TimePicker.SelectedValue != "-1" && TimePicker.Text != "" && TimePicker.SelectedValue != "-1" && RdoTrainType.SelectedItem.Text != "" && RdoClass.SelectedItem.Text != "")
            {

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DBCS"].ToString());
                con.Open();
                //Retrive train no from the traindata accoding to the parameters
                String query = "SELECT trainno FROM traindata WHERE starts=@st AND ends=@ed AND traintype=@tp AND time=@t";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@st", Start.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@ed", End.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@tp", RdoTrainType.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@t", TimePicker.SelectedItem.Text);
                String trainNo = cmd.ExecuteScalar().ToString();

                //check
                String query1 = "Select count(*) FROM seatdata where trainno=@no AND journeydate=@dt";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                cmd1.Parameters.AddWithValue("@no", trainNo);
                cmd1.Parameters.AddWithValue("@dt", DatePicker.Text);
                String output = cmd1.ExecuteScalar().ToString();

                int seatCount = 0;

                if (output == "1")
                {
                    String query3 = "SELECT availableseats FROM seatdata WHERE trainno=@no AND journeydate=@dt";
                    SqlCommand cmd2 = new SqlCommand(query3, con);
                    cmd2.Parameters.AddWithValue("@no", trainNo);
                    cmd2.Parameters.AddWithValue("@dt", DatePicker.Text);
                    int a_seats = int.Parse(cmd2.ExecuteScalar().ToString());

                    seatCount = a_seats;

                    int TicketCount = int.Parse(TicketCountReserve.Text);

                    if (a_seats > 0)
                    {
                        if (a_seats < TicketCount)
                        {

                            LblCheckMsg.Text = a_seats + "Seat not available !";
                            LblCheckMsg.ForeColor = System.Drawing.Color.Red;
                            LblCheckMsg.Visible = true;

                            return 1;   // cannot be reserved
                        }

                        else if (a_seats >= TicketCount)
                        {

                            LblCheckMsg.Text = a_seats + "Seat available !";
                            LblCheckMsg.ForeColor = System.Drawing.Color.Green;
                            LblCheckMsg.Visible = true;
                            return 2;

                        }
                    }

                    else
                    {
                        LblCheckMsg.Text = "Train Full !";
                        LblCheckMsg.ForeColor = System.Drawing.Color.Red;
                        LblCheckMsg.Visible = true;
                        return 3; // cannot be reserved
                    }
                }

                else
                {
                    LblCheckMsg.Text = seatCount + "Seat available !";
                    LblCheckMsg.ForeColor = System.Drawing.Color.Green;
                    LblCheckMsg.Visible = true;

                    return 4;  //can reserve and insert into seatdata table * coloumn


                }

                return 0;

            }

            return 0;

        }
    }
}