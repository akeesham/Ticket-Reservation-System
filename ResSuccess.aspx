<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResSuccess.aspx.cs" Inherits="TicketReservationSystem.ResSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

        body 
        {
            background-color : white;
        }

        .formClass 
        {
            background-color: white;
            position:absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            width: 600px;
            border-radius: 20px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.5);
            height: 150px;
            text-align: justify;
            box-sizing: border-box;
        }

        .msg 
        {
            color: limegreen;
            font-weight: 400;
            font-family: 'Segoe UI';
            font-size: 32px;
            position:absolute;
            top: 45%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
       
        .link
        {
            position:absolute;
            top: 70%;
            left: 50%;
            transform: translate(-50%,-50%);
        }
                
    </style>
</head>
<body>
    <form id="formSuc" runat="server">
        
        <div class="formClass">

            <asp:Label ID="Label1" runat="server" cssClass="msg" Text="Operation Success!"></asp:Label>
            
             <div style="margin-top:30px">
                <p class="link"><a href="Reservation.aspx">Go back</a></p> 
            </div>

        </div>

    </form>
</body>
</html>
