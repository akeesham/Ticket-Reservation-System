<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminUpdateDeleteTrain.aspx.cs" Inherits="TicketReservationSystem.Admin.AdminDeleteTrain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="AdminUpdateDeleteTrain.css" />
</head>
<body>
    <form id="form1" runat="server">
       <div class="formClass">

    <header><img src="Icons_Images/logo.png"/>Online Ticket Reservation System</header> 

    <section>
        <div class="article">
             <h2>Update Route or Delete Train</h2>
                
                <hr/>
            
                <div class="grid" style="border-style: none; font-family: calibri; font-size: 15px;">

                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="DataSourceTrainData" ForeColor="#333333" GridLines="None">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="trainno" HeaderText="Train no" SortExpression="trainno" />
                            <asp:BoundField DataField="traintype" HeaderText="Type" SortExpression="traintype" />
                            <asp:BoundField DataField="starts" HeaderText="Start" SortExpression="starts" />
                            <asp:BoundField DataField="ends" HeaderText="End" SortExpression="ends" />
                            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" />
                            <asp:BoundField DataField="price1stclass" HeaderText="1st class" SortExpression="price1stclass" />
                            <asp:BoundField DataField="price2ndclass" HeaderText="2nd class" SortExpression="price2ndclass" />
                            <asp:BoundField DataField="price3rdclass" HeaderText="3rd class" SortExpression="price3rdclass" />
                            <asp:BoundField DataField="totalseats" HeaderText="Total Seats" SortExpression="totalseats" />
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#33CC33" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>

                    <asp:SqlDataSource ID="DataSourceTrainData" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:DBCS %>" DeleteCommand="DELETE FROM [traindata] WHERE [id] = @original_id AND [trainno] = @original_trainno AND [traintype] = @original_traintype AND [starts] = @original_starts AND [ends] = @original_ends AND [time] = @original_time AND [price1stclass] = @original_price1stclass AND [price2ndclass] = @original_price2ndclass AND [price3rdclass] = @original_price3rdclass AND [totalseats] = @original_totalseats" InsertCommand="INSERT INTO [traindata] ([trainno], [traintype], [starts], [ends], [time], [price1stclass], [price2ndclass], [price3rdclass], [totalseats]) VALUES (@trainno, @traintype, @starts, @ends, @time, @price1stclass, @price2ndclass, @price3rdclass, @totalseats)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [traindata]" UpdateCommand="UPDATE [traindata] SET [trainno] = @trainno, [traintype] = @traintype, [starts] = @starts, [ends] = @ends, [time] = @time, [price1stclass] = @price1stclass, [price2ndclass] = @price2ndclass, [price3rdclass] = @price3rdclass, [totalseats] = @totalseats WHERE [id] = @original_id AND [trainno] = @original_trainno AND [traintype] = @original_traintype AND [starts] = @original_starts AND [ends] = @original_ends AND [time] = @original_time AND [price1stclass] = @original_price1stclass AND [price2ndclass] = @original_price2ndclass AND [price3rdclass] = @original_price3rdclass AND [totalseats] = @original_totalseats">
                        <DeleteParameters>
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_trainno" Type="String" />
                            <asp:Parameter Name="original_traintype" Type="String" />
                            <asp:Parameter Name="original_starts" Type="String" />
                            <asp:Parameter Name="original_ends" Type="String" />
                            <asp:Parameter Name="original_time" Type="String" />
                            <asp:Parameter Name="original_price1stclass" Type="Int32" />
                            <asp:Parameter Name="original_price2ndclass" Type="Int32" />
                            <asp:Parameter Name="original_price3rdclass" Type="Int32" />
                            <asp:Parameter Name="original_totalseats" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="trainno" Type="String" />
                            <asp:Parameter Name="traintype" Type="String" />
                            <asp:Parameter Name="starts" Type="String" />
                            <asp:Parameter Name="ends" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="price1stclass" Type="Int32" />
                            <asp:Parameter Name="price2ndclass" Type="Int32" />
                            <asp:Parameter Name="price3rdclass" Type="Int32" />
                            <asp:Parameter Name="totalseats" Type="Int32" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="trainno" Type="String" />
                            <asp:Parameter Name="traintype" Type="String" />
                            <asp:Parameter Name="starts" Type="String" />
                            <asp:Parameter Name="ends" Type="String" />
                            <asp:Parameter Name="time" Type="String" />
                            <asp:Parameter Name="price1stclass" Type="Int32" />
                            <asp:Parameter Name="price2ndclass" Type="Int32" />
                            <asp:Parameter Name="price3rdclass" Type="Int32" />
                            <asp:Parameter Name="totalseats" Type="Int32" />
                            <asp:Parameter Name="original_id" Type="Int32" />
                            <asp:Parameter Name="original_trainno" Type="String" />
                            <asp:Parameter Name="original_traintype" Type="String" />
                            <asp:Parameter Name="original_starts" Type="String" />
                            <asp:Parameter Name="original_ends" Type="String" />
                            <asp:Parameter Name="original_time" Type="String" />
                            <asp:Parameter Name="original_price1stclass" Type="Int32" />
                            <asp:Parameter Name="original_price2ndclass" Type="Int32" />
                            <asp:Parameter Name="original_price3rdclass" Type="Int32" />
                            <asp:Parameter Name="original_totalseats" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>

                <div class="back">
                    <a href="AdminHome.aspx"><p>Back to home</p></a>
                </div>
            
             </div>
            
           
             
         </section>

        </div>
    </form>

</body>
</html>
