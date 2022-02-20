<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="TicketReservationSystem.Admin.AdminHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="AdminHome.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="formClass">

    <header><img src="Icons_Images/logo.png"/>Online Ticket Reservation System</header> 

    <section>

        
        <span>

            <asp:Button ID="BtnAdminHome" cssClass="button" Text="Home" style="margin-top: 100px; background-color: #17aa17;" runat="server" OnClick="BtnAdminHome_Click"/>
            <asp:Button ID="BtnAddTrain" cssClass="button" Text="Add New Train" runat="server" OnClick="BtnAddTrain_Click"/>

            <asp:Button ID="BtnUpdateDelete" cssClass="button" Text="Update/Delete" runat="server" OnClick="BtnUpdateDelete_Click"/>

            
            <img src="Icons_Images/Logout_.png"/>
            <a runat="server" onserverclick="logout_ServerClick"><p>Logout</p></a>

            
        </span>

        <article>
            <img src="Icons_Images/Icon_admin.png"/>
            <h2>Welcome to Admin Panel</h2>
            
            <img class="img" src="Icons_Images/train_1.png"/>

            <a href="AdminAddNewAdmin.aspx"><p>Add new admin</p></a>


        </article>

    </section>

</div>

    </form>
</body>
</html>
