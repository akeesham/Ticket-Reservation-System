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
    public partial class CancelTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDataBase();


        }

        protected void BtnConfirm_Click(object sender, EventArgs e)
        {
            int temp=0;

            if (TxtReference.Text!="")
            {

                int refno = Int32.Parse(TxtReference.Text);
                int ticketCount = Int32.Parse(TicketCountCancel.SelectedValue);


                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con1 = new SqlConnection(cs);

                con1.Open();

                SqlCommand cmd5 = new SqlCommand("SELECT count(*) FROM reservationdata WHERE username=@Uname AND referenceno=@ref", con1);             
                cmd5.Parameters.AddWithValue("@Uname", Session["user"]);
                cmd5.Parameters.AddWithValue("@ref", refno);

                temp = Int32.Parse(cmd5.ExecuteScalar().ToString());

                
                if (temp == 1)
                {
                    
                    string query1 = "SELECT ticketcount FROM reservationdata WHERE referenceno='" + refno + "'";
                    SqlCommand cmd1 = new SqlCommand(query1, con1);
                    int ticketInDatabase = Int32.Parse(cmd1.ExecuteScalar().ToString());

                    string query2 = "SELECT totalamount FROM reservationdata WHERE referenceno='" + refno + "'";
                    SqlCommand cmd2 = new SqlCommand(query2, con1);
                    int totalAmountDatabase = Int32.Parse(cmd2.ExecuteScalar().ToString());


                    SqlCommand cmd10 = new SqlCommand("SELECT reserveddate FROM reservationdata WHERE referenceno=@ref", con1);
                    cmd10.Parameters.AddWithValue("@ref", refno);

                    string dt = cmd10.ExecuteScalar().ToString();

                    DateTime d1 = Convert.ToDateTime(dt);
                    DateTime d2 = DateTime.Now;


                    double totalDays = (d2.Date - d1.Date).TotalDays;   //Getting total days different between reserved date and current date


                    if (ticketCount <= ticketInDatabase)
                    {
                        LblMsg.Visible = false;

                        if (ticketCount == ticketInDatabase)
                        {

                            if (AccountNo.Text != "" && ReAccountNo.Text != "")
                            {
                                LblAccError.Visible = false;

                                if (totalDays <= 30)
                                {
                                    LblAccError.Visible = false;

                                    SqlCommand cmd4 = new SqlCommand("DELETE FROM reservationdata WHERE referenceno=@ref", con1);
                                    cmd4.Parameters.AddWithValue("@ref", refno);
                                    SqlDataReader rd1 = cmd4.ExecuteReader();
                                    con1.Close();

                                    refund(totalAmountDatabase);
                                }

                                else
                                {
                                    Response.Write("You cannot cancel reservation. 30 Days passed");
                                }



                            }

                            else
                            {

                                LblAccError.Visible = true;
                            }

                        }

                        else
                        {
                            
                            if (AccountNo.Text != "" && ReAccountNo.Text != "")
                            {
                                LblAccError.Visible = false;

                                if (totalDays <= 30)
                                {
                                    LblAccError.Visible = false;

                                    int updateCount = (ticketInDatabase - ticketCount);
                                    int oneTicketPrice = totalAmountDatabase / ticketInDatabase;
                                    int updatePrice = (updateCount * oneTicketPrice);

                                    SqlCommand cmd3 = new SqlCommand("UPDATE reservationdata SET ticketcount=@update , totalamount=@amount WHERE referenceno= @ref ", con1);
                                    cmd3.Parameters.AddWithValue("@update", updateCount);
                                    cmd3.Parameters.AddWithValue("@amount", updatePrice);
                                    cmd3.Parameters.AddWithValue("@ref", refno);

                                    cmd3.ExecuteNonQuery();
                                    con1.Close();

                                    refund(ticketCount* oneTicketPrice);
                                }

                                else
                                {
                                    Response.Write("You cannot cancel reservation. 30 Days passed");
                                }

                                
                            }

                            else
                            {
                                LblAccError.Visible = true;
                            }
                    
                        }

                    }

                    else
                    {
                        LblMsg.Visible = true;
                    }

                }

                else
                {
                    LblRefError.Text = "Invalid Reference number";
                    LblRefError.Visible = true;
                }

            }

            else
            {
                LblRefError.Visible = true;
            }
     

            loadDataBase();

            //update available ticket += cancelled ticket

            if (TxtReference.Text != "")
            {
                LblRefError.Visible = false;

                if (temp != 0)
                {
                    string cs1 = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                    SqlConnection con = new SqlConnection(cs1);
                    con.Open();
                    SqlCommand cmd6 = new SqlCommand("SELECT trainno FROM reservationdata WHERE referenceno=@rno", con);
                    cmd6.Parameters.AddWithValue("@rno", Int32.Parse(TxtReference.Text));
                    string train_No = cmd6.ExecuteScalar().ToString();

                    SqlCommand cmd7 = new SqlCommand("SELECT journeydate FROM reservationdata WHERE referenceno=@rno", con);
                    cmd7.Parameters.AddWithValue("@rno", Int32.Parse(TxtReference.Text));
                    string date = cmd7.ExecuteScalar().ToString();

                    String query3 = "SELECT availableseats FROM seatdata WHERE trainno=@no AND journeydate=@dt";
                    SqlCommand cmd8 = new SqlCommand(query3, con);
                    cmd8.Parameters.AddWithValue("@no", train_No);
                    cmd8.Parameters.AddWithValue("@dt", date);
                    int a_seats = int.Parse(cmd8.ExecuteScalar().ToString());

                    a_seats += int.Parse(TicketCountCancel.SelectedItem.Text);
                    String query4 = "UPDATE seatdata SET availableseats=@new";
                    SqlCommand cmd9 = new SqlCommand(query4, con);
                    cmd9.Parameters.AddWithValue("@new", a_seats);
                    cmd9.ExecuteNonQuery();
                    con.Close();
                }

                else
                {
                    LblRefError.Text = "Invalid Reference number";
                    LblRefError.Visible = true;
                }

                
            }

            else
            {
                LblRefError.Visible = true;
            }

            
        }

        protected void refund(int amount)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            con.Open();

            SqlCommand cmd = new SqlCommand("INSERT INTO refund (refno,username,accountno,amount) VALUES(@ref,@name,@acc,@amount)", con);
            cmd.Parameters.AddWithValue("@ref", TxtReference.Text);
            cmd.Parameters.AddWithValue("@name", Session["user"]);
            cmd.Parameters.AddWithValue("@acc", AccountNo.Text);
            cmd.Parameters.AddWithValue("@amount",amount);

            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void BtnReserve_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Reservation.aspx");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CancelTicket.aspx");
        }

        protected void loadDataBase ()
        {

                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                SqlConnection con1 = new SqlConnection(cs);
                SqlCommand cmd3 = new SqlCommand("SELECT * FROM reservationdata WHERE username=@name", con1);
                con1.Open();
                cmd3.Parameters.AddWithValue("@name", Session["user"]);
                SqlDataReader rd2 = cmd3.ExecuteReader();
                GridView1.DataSource = rd2;
                GridView1.DataBind();


        }
     
        protected void BtnViewTime_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ViewTimeTable.aspx");
        }

        protected void logout_ServerClick(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("~/UserLogin.aspx");
        }
    }
}