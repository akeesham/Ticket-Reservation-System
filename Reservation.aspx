<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="TicketReservationSystem.Reservation1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/StyleSheetReservation.css"/>
</head>
<body>
         <form id="form3" runat="server">
     

        <header><img src="Icons/logo.png"/>Online Ticket Reservation System</header>
            
        <nav>
            Reserve Your Ticket Here...
        </nav>

        <section>

            <article>
                <br />
                <div class="container">
               
                    <div class="st-box">
                        <p>Select the Route</p>
                        <asp:DropDownList id="Start" cssClass="dropDownList" DataTextField="starts" OnSelectedIndexChanged="Start_SelectedIndexChanged" DataValueField="starts" AutoPostBack="True" runat="server">
                            
                        </asp:DropDownList><br />
                    </div>

                    <div class="nd-box">
                        <p><br /></p>
                        <asp:DropDownList id="End" cssClass="dropDownList" DataTextField="ends" DataValueField="ends" AutoPostBack="True" runat="server">
                            <asp:ListItem Selected="True" Value="-1">End...</asp:ListItem>
                             
                        </asp:DropDownList>
                    </div>


                   <%-- <div class="rd-box">
                        <fieldset id="Panel1" class="groupPanel1">
                            <legend>Type of train</legend>                    
                            <asp:RadioButtonList ID="RdoTrainType" AutoPostBack="True" OnSelectedIndexChanged="RdoTrainType_SelectedIndexChanged" runat="server" Width="215px">
                                <asp:ListItem Text="Intercity" Value="1"/>
                                <asp:ListItem Text="Normal" Value="2"/>
                            </asp:RadioButtonList>
                        </fieldset>
                    </div>    --%>           

                </div>

                <div class="container">
                    <div class="st-box">
                       <p>Train type</p>
                       <asp:DropDownList id="DrpTrainType" cssClass="dropDownListTicket" AutoPostBack="True" runat="server">
                           <asp:ListItem Selected="True" Value="1">Intercity</asp:ListItem>
                           <asp:ListItem Value="2">Normal</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="nd-box">
                        <p>Class Type</p>
                        <asp:DropDownList id="DrpClassType" cssClass="dropDownListTicket" AutoPostBack="True" runat="server">
                            <asp:ListItem Selected="True" Value="1">1st Class</asp:ListItem>
                            <asp:ListItem Value="2">2nd Class</asp:ListItem>
                            <asp:ListItem Value="3">3rd Class</asp:ListItem>       
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="container">
                    <div class="st-box">
                        <p>Journey Date</p>
                        <asp:TextBox ID="DatePicker" runat="server" TextMode="Date" Font-Names="Segoe UI" ForeColor="Black"></asp:TextBox>

                        <br /><br />

                        <p>Ticket Count</p>
                        <asp:DropDownList id="TicketCountReserve" cssClass="dropDownListTicket" AutoPostBack="True" runat="server">
                            <asp:ListItem Selected="True" Value="-1">Select...</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                        </asp:DropDownList>


                    </div>

                     <div class="nd-box">
                        <p>Time Picker</p>
                        <asp:DropDownList id="TimePicker" cssClass="dropDownListTicket" DataTextField="time" DataValueField="time" AutoPostBack="True" runat="server">
                            <asp:ListItem Selected="True" Value="-1">Time...</asp:ListItem>
                            
                        </asp:DropDownList>
                    </div>

                    <br /><br />

                    <div class ="available">

                            <div class="err"> 
                                <asp:Label ID="LblCheckMsg" runat="server" Text="Seat available !" Visible="true"></asp:Label>
                            </div>

                            <asp:Button ID="BtnCheckSeat" CssClass="button" runat="server" Text="Check availability" OnClick="BtnCheckSeat_Click" />
                        
                        </div>

                   <%-- <div class="rd-box">
                        <fieldset id="Panel2" class="groupPanel1">
                            <legend>Class type</legend>                    
                                <asp:RadioButtonList ID="RdoClass" AutoPostBack="True" runat="server">
                                    <asp:ListItem Text="1st Class" Value="1">1st Class</asp:ListItem>
                                    <asp:ListItem Text="2nd Class" Value="2">2nd Class</asp:ListItem>
                                    <asp:ListItem Text="3rd Class" Value="3">3rd Class</asp:ListItem>
                            </asp:RadioButtonList>                         
                        </fieldset>

                    </div>--%>

                </div>
                
                
                <br /><br />
               
                <div class="details">
                    <%--<div class="TtxBox">
                        <asp:TextBox ID="TxtShow"  runat="server" TextMode="MultiLine" ReadOnly="True" Height="150px" Width="190px"></asp:TextBox>           
                    </div>--%>

                    <div class="btn">
                        <asp:Button ID="BtnShow" runat="server" CssClass="button" Text="Show Details" OnClick="BtnShow_Click" />
                    </div>
                    
                </div>
               
                
                <%--<div class="payBtn">
                    <asp:Button ID="BtnPay" runat="server" Text="pay" cssClass="btnPay" OnClick="BtnPay_Click" />
                </div>--%>
                

            </article>

        </section>
          
        
    </form>
    <asp:SqlDataSource ID="DataSourceReservation" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" InsertCommand="INSERT INTO reservationdata(referenceno, username, starts, ends, ticketcount, totalamount, date, time) VALUES (,,,,,,,)" SelectCommand="SELECT reservationdata.* FROM reservationdata"></asp:SqlDataSource>
</body>
</html>
