<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserSignUp.aspx.cs" Inherits="TicketReservationSystem.UserSignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="CSS/styleSheetLogin.css"/>
</head>
<body>
    <form id="form2" runat="server">
      <div class="formClass">
           
        <div class="loginLabelBlock">
            <img src="Images/Icon_create.png"/>
            <p class="LoginLabelTop">New account</p>    
        </div>

        <div class="RequireUserName">
            <asp:RequiredFieldValidator ID="Required_UserName" runat="server" ErrorMessage="*" ControlToValidate="TxtUserName" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:TextBox ID="TxtUserName" cssClass="input" placeholder="Username" runat="server"></asp:TextBox><br /> 
        
        <div class="RequireUserName" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="Required_NIC" runat="server" ErrorMessage="*" ControlToValidate="TxtNIC" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>
        <asp:TextBox ID="TxtNIC" cssClass="input" placeholder="NIC/Passport" runat="server"></asp:TextBox><br />

        <div class="RequireUserName" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="RequiredPassword" runat="server" ErrorMessage="*" ControlToValidate="TxtPassword" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>    
        <asp:TextBox ID="TxtPassword" cssClass="input" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox><br />
        
        <div class="RequireUserName" style="margin-top: 24px;">
            <asp:RequiredFieldValidator ID="RequiredRePassword" runat="server" ErrorMessage="*" ControlToValidate="TxtRePassword" ForeColor="Red"></asp:RequiredFieldValidator>  
        </div>   
        <asp:TextBox ID="TxtRePassword" cssClass="input" placeholder="Re-Password" TextMode="Password" runat="server"></asp:TextBox><br />

        <asp:Label ID="LblMsg" runat="server" cssClass="SuccessMsg" Text="Successfully Created" Visible="False"></asp:Label>
        <asp:Label ID="LblErrorMsg" runat="server" cssClass="errorMsg_" Text="Username already exist" Visible="False"></asp:Label>

        <asp:Button ID="BtnCreate" cssClass="button" Text="Create" Font-Size="11pt" OnClick="BtnCreate_Click" runat="server"/>
        
        <div style="margin-top:30px">
            <p class="signUpLabel">Have an account? <a href="UserLogin.aspx">Login</a></p> 
        </div>
        
    </div>
    </form>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" InsertCommand="INSERT INTO users(nic, username, password) VALUES (,,)" SelectCommand="SELECT username, password, nic FROM users"></asp:SqlDataSource>
</body>
</html>

