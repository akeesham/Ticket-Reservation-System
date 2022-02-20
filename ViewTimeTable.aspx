<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewTimeTable.aspx.cs" Inherits="TicketReservationSystem.ViewTimeTable" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/StyleSheetTimeTable.css" />
</head>
<body>
    <form id="form1" runat="server">

        <header><img src="Icons/logo.png"/>Online Ticket Reservation System</header>
        
        <nav>
            Train TimeTable...
        </nav>

        <section>

            <article>
               
                <div class="grid" style="border-style: none; font-family: calibri; font-size: 15px;">

                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="DataSourceTimeTable" GridLines="None" AllowPaging="True">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="trainno" HeaderText="Train no" SortExpression="trainno" />
                            <asp:BoundField DataField="traintype" HeaderText="Type" SortExpression="traintype" />
                            <asp:BoundField DataField="starts" HeaderText="Start" SortExpression="starts" />
                            <asp:BoundField DataField="ends" HeaderText="End" SortExpression="ends" />
                            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                            <asp:BoundField DataField="price1stclass" HeaderText="1st class" SortExpression="price1stclass" />
                            <asp:BoundField DataField="price2ndclass" HeaderText="2nd class" SortExpression="price2ndclass" />
                            <asp:BoundField DataField="price3rdclass" HeaderText="3rd class" SortExpression="price3rdclass" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="#172536" BorderStyle="None" HorizontalAlign="Left" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="DataSourceTimeTable" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [traindata]"></asp:SqlDataSource>

                </div>

            </article>

        </section>

    </form>
    
</body>
</html>
