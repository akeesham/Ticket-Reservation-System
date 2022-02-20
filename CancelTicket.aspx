<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CancelTicket.aspx.cs" Inherits="TicketReservationSystem.CancelTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Css/StyleSheetCancel.css"/>
</head>
<body>
    <form id="form4" runat="server">

        <header><img src="Icons/logo.png"/>Ticket Reservation System</header>
            
        <nav>
            Cancel Your Ticket Here...
        </nav>

        <section>

            <article>
                <br />
               
                    <div class="st-box">

                        <div class="left"><p>Reference No</p></div>

                        <div class="right">

                            <asp:TextBox ID="TxtReference" cssClass="input1" placeholder="Reference " runat="server"></asp:TextBox>
                            <asp:Label ID="LblRefError" runat="server" cssClass="errorRef" Text="Need reference number" Visible="False"></asp:Label>

                        </div>
                        
                    </div>


                    <div class="st-box"><p>Reserved database</p></div>
                
                   <div class="grid" style="border-style: none; overflow-y:scroll; overflow-x:hidden;height:200px; font-family:calibri; font-size: 16px;">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Font-Size="Medium">
                            <columns>
                                <asp:BoundField DataField="referenceno" HeaderText="Ref No" />
                                <asp:BoundField DataField="starts" HeaderText="Starts" />
                                <asp:BoundField DataField="ends" HeaderText="End" />
                                <asp:BoundField DataField="ticketcount" HeaderText="No.of Tickets" />
                                <asp:BoundField DataField="totalamount" HeaderText="Total" />
                                <asp:BoundField DataField="journeydate" HeaderText="Journey date" />

                            </columns>
                            <AlternatingRowStyle BackColor="White" />
                            <EditRowStyle BackColor="#7C6F57" />
                            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="#172536" BorderStyle="None" HorizontalAlign="Left" />
                            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#E3EAEB" />
                            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#F8FAFA" />
                            <SortedAscendingHeaderStyle BackColor="#246B61" />
                            <SortedDescendingCellStyle BackColor="#D4DFE1" />
                            <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
                    </div>

                
                 <div class="st-box">

                        <div class="left"><p>no-of ticket to cancel</p></div>

                        <div class="right">
                            
                            <asp:DropDownList id="TicketCountCancel" cssClass="dropDownListTicket" AutoPostBack="false" runat="server">
                                <asp:ListItem Selected="True" Value="1">1</asp:ListItem>
                                <asp:ListItem Value="2"> 2 </asp:ListItem>
                                <asp:ListItem Value="3"> 3 </asp:ListItem>
                                <asp:ListItem Value="4"> 4 </asp:ListItem>
                                <asp:ListItem Value="5"> 5 </asp:ListItem>
                            </asp:DropDownList>

                        </div>
                        
                        <asp:Label ID="LblMsg" runat="server" cssClass="error" Text="Ticket Count Exceeded!" Visible="False"></asp:Label>
                        
                </div>

                
                <div class="st-box">
    
                        <fieldset class="groupPanel">
                        <legend>Refund</legend>

                            
                            <asp:TextBox ID="AccountNo" cssClass="input" placeholder="Account no" runat="server"></asp:TextBox><br />

                            <asp:TextBox ID="ReAccountNo" cssClass="input" placeholder="Re-type account no" runat="server"></asp:TextBox><br />
                        
                            <asp:CompareValidator ID="Compare_AccountNo" CssClass="errorMsg_" runat="server" ControlToCompare="ReAccountNo" ControlToValidate="AccountNo" 
                               ErrorMessage="*Account number doesn't match" ForeColor="Red">

                            </asp:CompareValidator>

                            <asp:Label ID="LblAccError" runat="server" CssClass="accErrorMsg_" Text="Please Enter account number!" Visible="False"></asp:Label>

                        </fieldset>
                  
                </div>

                <asp:Button ID="BtnConfirm" runat="server" Text="Confirm" CssClass="btnConfirm" OnClick="BtnConfirm_Click" />

            </article>

        </section>
    </form>
    <asp:SqlDataSource ID="DataSourceReservation" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM reservationdata" SelectCommand="SELECT reservationdata.* FROM reservationdata" UpdateCommand="UPDATE reservationdata SET ticketcount =, totalamount =, date =, time =, username =, starts =, ends ="></asp:SqlDataSource>
    </body>
</html>
