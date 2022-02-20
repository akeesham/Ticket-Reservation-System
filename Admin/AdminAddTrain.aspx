<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminAddTrain.aspx.cs" Inherits="TicketReservationSystem.Admin.AdminAddTrain" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="AdminAddTrain.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="formClass">

    <header><img src="Icons_Images/logo.png"/>Online Ticket Reservation System</header> 

    <section>

        <span>
            <asp:Button ID="BtnAdminHome" cssClass="button" Text="Home" style="margin-top: 100px;" runat="server" OnClick="BtnAdminHome_Click"/>
            <asp:Button ID="BtnAddTrain" cssClass="button" Text="Add New Train" style="background-color: #17aa17;" runat="server" OnClick="BtnAddTrain_Click"/>
            <asp:Button ID="BtnUpdateDeleteTrain" cssClass="button" Text="Update/Delete" runat="server" OnClick="BtnUpdateDeleteTrain_Click"/>
            
            
            <img src="Icons_Images/Logout_.png"/>
            <a runat="server" onserverclick="logout_ServerClick"><p>Logout</p></a>

        </span>

        <article>
            
            <h2>Add New Train</h2>
            <hr/>

            <div class="grid">

                <div class="trainNo">
                    <p>Train no : </p>
                    <asp:Textbox  ID="TxtTrainNo" runat="server" />
                </div>
            
                <div class="time">
                    <p>Time : </p>
                    <asp:Textbox  ID="TxtTime" TextMode="Time" runat="server" />
                </div>

                <div class="trainType">
                    
                    <fieldset>
                        <legend>Type of train</legend>
                        <asp:RadioButton ID="RdoNormal" text="Normal" GroupName="Traintype" runat="server"/><br/>
                        <asp:RadioButton ID="RdoIntercity" text="Intercity" GroupName="Traintype" runat="server"/><br/>
                    </fieldset>

                </div>

                <br/><br/>

                
                    <div class="_1st">
                        <p>1st Class Price : </p> 
                        <asp:Textbox  ID="TxtPrice1" runat="server" />
                    </div>
                    
                    <div class="_2nd">
                    <p>2nd Class Price : </p>
                    <asp:Textbox  ID="TxtPrice2" runat="server" />
                    </div>   

                    <div class="_3rd">
                    <p>3rd Class Price : </p>
                    <asp:Textbox  ID="TxtPrice3" runat="server" />
                    </div>

                <br/><br/>

                </div>

            <div class="routeDiv">
                <div class="trainRoute">
                    <p>Enter the train route : </p>
                    <asp:Textbox ID="TxtStart" placeholder="Start" runat="server"/>
                    <asp:Textbox ID="TxtEnd" placeholder="End" runat="server"/>
                </div>
                <p>Enter seat count</p>
                <asp:TextBox ID="TxtSeatCount" runat="server"></asp:TextBox>
                <br />
                <asp:Button ID="BtnAdd" cssClass= "addBtn" Text="Add Train" runat="server" OnClick="BtnAdd_Click" />
            </div>
                
            
            
            

        </article>

    </section>

</div>
    </form>
    <asp:SqlDataSource ID="DataSourceTrain" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" InsertCommand="INSERT INTO traindata(trainno, traintype, starts, ends, time) VALUES (,,,,)" SelectCommand="SELECT traindata.* FROM traindata"></asp:SqlDataSource>
</body>
</html>
